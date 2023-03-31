package com.boat.controller.member;


import java.io.File;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boat.Service.MemberService;
import com.boat.Task.SendMail;
import com.boat.domain.MailVO;
import com.boat.domain.Member;
import com.boat.sns.MemberVO;
import com.boat.sns.NaverLoginBO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	private MemberService memberservice;
	private NaverLoginBO naverloginbo;//네이버 api
	private SendMail sendMail;
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	@Autowired
	public MemberController(MemberService memberservice, NaverLoginBO naverloginbo, 
			SendMail sendMail, PasswordEncoder passwordEncoder, JavaMailSender javaMailSender) {
		this.memberservice = memberservice;
		this.naverloginbo = naverloginbo;
		this.sendMail = sendMail;
		this.passwordEncoder = passwordEncoder;
	}

	
	//회원가입
	@GetMapping(value = "/sign_up")
	public String signUp(Model model,HttpSession session) {
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		Logger.info("naverAuthUrl="+naverAuthUrl);
		return "/Member/sign_up";
	}
	
	//일반 회원가입 => 정보 작성폼
	@GetMapping(value = "/join")
	public String join(@RequestParam("email") String email, Model model, HttpSession session) {
		
		model.addAttribute("email", email);
		return "/Member/joinForm";
	}
	
	//사원번호 생성
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public void join(@RequestParam("select") String select, HttpServletResponse response, RedirectAttributes rattr) throws Exception {
		Logger.info("select="+select);
		int empno = memberservice.isEmpno(select);
		System.out.println("empno="+empno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(empno);
		
	}
	
	//회원가입 처리
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public String joinProcess(Member member, RedirectAttributes rattr,
								Model model, HttpServletRequest request) throws Exception {
		member.setPASSWORD_OG(member.getPASSWORD());
		
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getPASSWORD());
		Logger.info(encPassword);
		member.setPASSWORD(encPassword);
		
		
		MultipartFile uploadfile = member.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			
			String saveFolder = new File("src/main/resources/static/profile").getAbsolutePath();
//			String saveFolder= profileSaveFolder.getProfilesavefolder();
			String fileDBName = fileDBName(fileName, saveFolder, member.getEMPNO());
			Logger.info("fileDBName : " + fileDBName);
			
			//transferTo(file path) : 업로드된 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			Logger.info("transferTo path : " + saveFolder + fileDBName);
			//바뀐 파일명으로 저장
			member.setPROFILE_IMG(fileDBName);
			System.out.println("absolutePathss " +saveFolder);
			//파일 경로 이름
			member.setPROFILE_FILE("profile" + fileDBName);
		}
		
		
		int result = memberservice.insert(member);
		System.out.println("result="+result);
		//result=0;
		/*
		 * 스프링에서 제공하는 RedirectAttributes는 기존의 Servlet에서 사용되던
		 * response.sendRedirect()를 사용할 때와 동일한 용도로 사용합니다.
		 * 리다이렉트로 전송하면 파라미터를 전달하고자 할 때 addAttribute()나 addFlashAttribute()를 사용합니다.
		 * 예) response.sendRedirect("/test?result=1");
		 * => rattr.addAttribute("result",1)
		 */
				
		//삽입이 된 경우
		if(result == 1) {
			MailVO vo = new MailVO();
			vo.setTo(member.getEMAIL());
			vo.setContent(member.getEMPNO() + "님 회원 가입을 축하드립니다.");
			sendMail.sendMail(vo);
			
			rattr.addFlashAttribute("result", "joinSuccess");
			return "redirect:sign_in";
		}else {
			model.addAttribute("url", request.getRequestURI());
			model.addAttribute("message","회원 가입 실패");
			
			return "error/error";
		}
	}
	
	//파일명
	private String fileDBName(String fileName, String saveFolder, String empno) {
		//새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);//오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1;//오늘 월 구합니다.
		int date = c.get(Calendar.DATE);//오늘 일 구합니다.
		
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		Logger.info(homedir);
		File path1 = new File(homedir);
		if(!(path1.exists())) {
			path1.mkdir();//새로운 폴더를 생성
		}
		
		
		/*** 확장자 구하기 시작 ***/
		int index = fileName.lastIndexOf(".");
		/*
		 * 문자열에서 특정 문자열의 위치 값(index)을 반환합니다.
		 * IndexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		 * lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		 * (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
		 */
		Logger.info("index = " + index);
		
		String fileExtenstion = fileName.substring(index + 1);
		Logger.info("fileExtenstion = " + fileExtenstion);
		/*** 확장자 구하기 끝 ***/
		
		//새로운 파일명
		String refileName = empno + "." + fileExtenstion;
		Logger.info("refileName = " + refileName);
		
		//오라클 디비에 저장될 파일명
		//String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		Logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	
	
	//이메일 인증
	@ResponseBody
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {	
		System.out.println("전달받은 이메일:"+email);
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "dmswjddid37@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "BOAT 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + " 입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return Integer.toString(checkNum);
 
	}
	
	
	
	
	
	
	
	
	
	
	//네이버 회원가입 => 정보 작성폼
	@RequestMapping(value = "/naverlogin", method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, 
			@RequestParam String state,HttpSession session, RedirectAttributes rattr) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		
		OAuth2AccessToken oauthToken = naverloginbo.getAccessToken(session, code, state);
		
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverloginbo.getUserProfile(oauthToken);
		System.out.println("apiResult =>"+apiResult);
		
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		System.out.println("apiJson="+apiJson);
		
		Map<String, Object> naverConnectionCheck = memberservice.naverConnectionCheck(apiJson);
		System.out.println("naverConnectionCheck="+naverConnectionCheck);
		
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			
			model.addAttribute("email",apiJson.get("email"));
			model.addAttribute("id",apiJson.get("id"));
			model.addAttribute("name",apiJson.get("name"));
			System.out.println("apiJson.get(\"id\")="+apiJson.get("id"));
			return "/Member/joinForm2";
			
		}
//		else if(naverConnectionCheck.get("NAVERLOGIN") == null && naverConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
//			memberservice.setNaverConnection(apiJson);
//			Map<String, Object> loginCheck = memberservice.userNaverLoginPro(apiJson);
//			session.setAttribute("userInfo", loginCheck);
//			
//		}
		else { //모두 연동 되어있을시
			Map<String, Object> loginCheck = memberservice.userNaverLoginPro(apiJson);
			System.out.println("loginCheck="+loginCheck);
			session.setAttribute("userInfo", loginCheck);
			
			String EMPNO = (String) loginCheck.get("EMPNO");
			String PASSWORD_OG = (String) loginCheck.get("PASSWORD_OG");
			session.setAttribute("EMPNO", EMPNO);
			session.setAttribute("PASSWORD_OG", PASSWORD_OG);
			
//			rattr.addFlashAttribute("EMPNO", EMPNO);
//			rattr.addFlashAttribute("PASSWORD_OG", PASSWORD_OG);
			
			return "redirect:sign_in";
		}
		
//		return "redirect:/index";
	}
	
	//네이버 회원가입 처리
	@RequestMapping(value="/userNaverRegisterPro", method=RequestMethod.POST)
	public String userNaverRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session, RedirectAttributes rattr,
			@RequestParam String PASSWORD, @RequestParam MultipartFile uploadfile, Model model, HttpServletRequest request) throws SQLException, Exception {
		System.out.println("paramMap=" + paramMap);
		
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(PASSWORD);
		Logger.info(encPassword);
		paramMap.put("PASSWORD", encPassword);
		paramMap.put("PASSWORD_OG", PASSWORD);
//		member.setPASSWORD(encPassword);
		
		MultipartFile uploadfiles = uploadfile;
		
		if(!uploadfiles.isEmpty()) {
			String fileName = uploadfiles.getOriginalFilename();//원래 파일명
			String EMPNO = (String) paramMap.get("EMPNO");
			
			String saveFolder = new File("src/main/resources/static/profile").getAbsolutePath();
//			String saveFolder= profileSaveFolder.getProfilesavefolder();
			String fileDBName = fileDBName(fileName, saveFolder, EMPNO);
			Logger.info("fileDBName : " + fileDBName);
			
			//transferTo(file path) : 업로드된 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			Logger.info("transferTo path : " + saveFolder + fileDBName);
			//바뀐 파일명으로 저장
			paramMap.put("PASSWORD", encPassword);
//			member.setPROFILE_IMG(fileDBName);
			System.out.println("absolutePathss " +saveFolder);
			//파일 경로 이름
//			member.setPROFILE_FILE("profile" + fileDBName);
			paramMap.put("PROFILE_FILE", "profile" + fileDBName);
		}
		
		Map <String, Object> resultMap = new HashMap<String, Object>();
		int registerCheck = memberservice.userNaverRegisterPro(paramMap);
		System.out.println(registerCheck);
		
		String EMAIL = (String) paramMap.get("EMAIL");
		String EMPNO = (String) paramMap.get("EMPNO");
		
		//삽입이 된 경우
		if(registerCheck == 1) {
			MailVO vo = new MailVO();
			vo.setTo(EMAIL);
			vo.setContent(EMPNO + "님 회원 가입을 축하드립니다.");
			sendMail.sendMail(vo);
				
			rattr.addFlashAttribute("result", "joinSuccess");
			return "redirect:sign_in";
			
		}else {
			model.addAttribute("url", request.getRequestURI());
			model.addAttribute("message","회원 가입 실패");
					
			return "error/error";
		}
		
//		if(registerCheck != 0 && registerCheck > 0) {
//			Map<String, Object> loginCheck = memberservice.userNaverLoginPro(paramMap);
//			session.setAttribute("userInfo", loginCheck);
//			rattr.addFlashAttribute("JavaData", "YES");
////			resultMap.put("JavaData", "YES");
//		}else {
//			rattr.addFlashAttribute("JavaData", "NO");
////			resultMap.put("JavaData", "NO");
//		}
		
//		return "redirect:sign_in";
//		return resultMap;
	}
	
	//네이버 로그아웃
	@RequestMapping(value = "/snslogout", method = RequestMethod.POST)
	public String logout(HttpServletRequest request, HttpSession session) {
	    session.invalidate();
	    SecurityContextHolder.clearContext();
	    return "redirect:/index";
	}
	
	
	
	
	
	
	
	
	

	
	/* 구글아이디로 로그인 */	
    @ResponseBody
	@RequestMapping(value = "/loginGoogle", method = RequestMethod.POST)
	public String loginGooglePOST(@RequestParam String name, HttpSession session, 
			RedirectAttributes rttr) throws Exception{
    	
    	System.out.println("name="+name);

//		MemberVO returnVO = service.loginMemberByGoogle(vo);
//		String mvo_ajaxid = mvo.getId(); 
//		System.out.println("C: 구글아이디 포스트 db에서 가져온 vo "+ vo);
//		System.out.println("C: 구글아이디 포스트 ajax에서 가져온 id "+ mvo_ajaxid);
//		
//		if(returnVO == null) { //아이디가 DB에 존재하지 않는 경우
//			//구글 회원가입
//			service.joinMemberByGoogle(vo);	
//			
//			//구글 로그인
//			returnVO = service.loginMemberByGoogle(vo);
//			session.setAttribute("id", returnVO.getId());			
//			rttr.addFlashAttribute("mvo", returnVO);
//		}
//		
//		if(mvo_ajaxid.equals(returnVO.getId())){ //아이디가 DB에 존재하는 경우
//			//구글 로그인
//			service.loginMemberByGoogle(vo);
//			session.setAttribute("id", returnVO.getId());			
//			rttr.addFlashAttribute("mvo", returnVO);
//		}else {//아이디가 DB에 존재하지 않는 경우
//			//구글 회원가입
//			service.joinMemberByGoogle(vo);	
//			
//			//구글 로그인
//			returnVO = service.loginMemberByGoogle(vo);
//			session.setAttribute("id", returnVO.getId());			
//			rttr.addFlashAttribute("mvo", returnVO);
//		}
//		
		return "redirect:/index";
	}
	
    
    
    
    
    
    
	
	
	
	
	//로그인
	@GetMapping(value = "/sign_in")
	public ModelAndView signIn(ModelAndView mv, 
			@CookieValue(value="remember-me", required=false) Cookie readCookie,
			HttpSession session, Principal userPrincipal, Model model) {
		
		if(readCookie != null) {
			Logger.info("저장된 아이디 : " + userPrincipal.getName());//Principal.getName() : 로그인한 아이디
			mv.setViewName("redirect:/index");
		}else {
			String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
			model.addAttribute("naverUrl", naverAuthUrl);
			Logger.info("naverAuthUrl="+naverAuthUrl);
			
			mv.setViewName("Member/sign_in");
			mv.addObject("loginfail", session.getAttribute("loginfail"));
			//세션에 저장된 값을 한 번만 실행될 수 있도록 mv에 저장하고
			session.removeAttribute("loginfail");//세션의 값은 제거합니다.
		}
		
		return mv;	
	}
	
	@RequestMapping("/id_check")
	public String idCheck() {
		return "/Member/id_check";
	}
	
	@RequestMapping("/id_list")
	public String idList() {
		return "/Member/id_list";
	}
	
	
	@RequestMapping("/pwd_check")
	public String pwdCheck() {
		return "/Member/pwd_check";
	}
	
	@RequestMapping("/pwd_check_ok")
	public String pwdCheckok() {
		return "/Member/pwd_check_ok";
	}
	
	
	
	
	@GetMapping("/myinfo")
	public String hello4() {
		return "/Member/myinfo";
	}
	
	@GetMapping("/chat")
	public String hello5() {
		return "/Chat/chat_room";
	}
	
	@GetMapping("/myboardList")
	public String hello6() {
		return "/Member/myboardList";
	}
	
	
}
