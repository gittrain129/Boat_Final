package com.boat.controller.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boat.Service.MemberService;
import com.boat.Task.SendMail;
import com.boat.domain.MailVO;
import com.boat.domain.Member;
import com.boat.domain.ProfileSaveFolder;
import com.boat.naver.NaverLoginBO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	private MemberService memberservice;
	private NaverLoginBO naverloginbo;//네이버 api
	private SendMail sendMail;
	private ProfileSaveFolder profileSaveFolder;
	
	
	@Autowired
	public MemberController(MemberService memberservice, NaverLoginBO naverloginbo, 
			SendMail sendMail, ProfileSaveFolder profileSaveFolder) {
		this.memberservice = memberservice;
		this.naverloginbo = naverloginbo;
		this.sendMail = sendMail;
		this.profileSaveFolder = profileSaveFolder;
	}

	
	
	
	//회원가입
	@GetMapping(value = "/sign_up")
	public String signUp(Model model,HttpSession session) {
		String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		return "/Member/sign_up";
	}
	
	//일반 회원가입 => 정보 작성폼
	@PostMapping(value = "/join")
	public String join(@RequestParam("email") String email, Model model) {
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
		
//		//비밀번호 암호화 추가
//		String encPassword = passwordEncoder.encode(member.getPASSWORD());
//		Logger.info(encPassword);
//		member.setPASSWORD(encPassword);
		
		
		MultipartFile uploadfile = member.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			
			String saveFolder= profileSaveFolder.getProfilesavefolder();
			String fileDBName = fileDBName(fileName, saveFolder, member.getEMPNO());
			Logger.info("fileDBName : " + fileDBName);
			
			//transferTo(file path) : 업로드된 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			Logger.info("transferTo path : " + saveFolder + fileDBName);
			//바뀐 파일명으로 저장
			member.setPROFILE_IMG(fileDBName);
			member.setPROFILE_FILE(saveFolder + fileDBName);
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
	
	
	
	
	
	
	
	//네이버 회원가입 => 정보 작성폼
	@RequestMapping(value = "/naverlogin", method = {RequestMethod.GET, RequestMethod.POST})
	public String userNaverLoginPro(Model model,
			@RequestParam Map<String,Object> paramMap, @RequestParam String code, 
			@RequestParam String state, HttpSession session) throws SQLException, Exception {
		
		Logger.info("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverloginbo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverloginbo.getUserProfile(oauthToken);
		Logger.info("apiResult =>"+apiResult);
		
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		
		Map<String, Object> naverConnectionCheck = memberservice.naverConnectionCheck(apiJson);
		
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			
			model.addAttribute("email",apiJson.get("email"));
			model.addAttribute("password",apiJson.get("id"));
			return "/Member/joinForm";
			
		}else if(naverConnectionCheck.get("NAVERLOGIN") == null && naverConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			memberservice.setNaverConnection(apiJson);
			Map<String, Object> loginCheck = memberservice.userNaverLoginPro(apiJson);
			session.setAttribute("userInfo", loginCheck);
			
		}else { //모두 연동 되어있을시
			Map<String, Object> loginCheck = memberservice.userNaverLoginPro(apiJson);
			session.setAttribute("userInfo", loginCheck);
		}
		
		return "redirect:index";
	}
	
	
	
	
	@RequestMapping(value = "/sign_in", method = RequestMethod.GET)
	public String signIn() {
		return "/Member/sign_in";
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
