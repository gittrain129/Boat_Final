package com.boat.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boat.Service.MemberService;
import com.boat.domain.Member;

@Controller
@RequestMapping(value="/admin")
public class adminController {

private MemberService memberservice;
@Autowired
private PasswordEncoder passwordEncoder;
	
	@Autowired
	public adminController(MemberService memberservice) {
		
		this.memberservice = memberservice;
		
	}
	
	@GetMapping("/menu")
	public String adminlist() {
		return "/Admin/adminmenu";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(value="page",defaultValue="1",required=false) int page,
								@RequestParam(value="dept",defaultValue="전체부서", required=false) String dept,
			ModelAndView mv	) {
		int num = 0;
		if(dept.equals("전체부서")) {
			dept = "";
			num = 0;
		}else if(dept.equals("홍보팀")) {
			num = 1;
		}else if(dept.equals("개발팀")) {
			num = 2;
		}else if(dept.equals("인사팀")) {
			num = 3;
		}else if(dept.equals("기획팀")) {
			num = 4;
		}else if(dept.equals("영업팀")) {
			num = 5;
		}
		
		
		String[] st1 = {"BOAT crew","BOAT의 커뮤니케이션 전문가","BOAT의 변화를 두려워하지않는","BOAT의 신뢰를 이어주는","BOAT의 새로운 표준을 제시하는","BOAT의 게임체인저"};
		String[] st2 = {"전체부서입니다","홍보팀입니다","개발팀입니다","인사팀입니다","기획팀입니다","영업팀입니다"};
		int limit = 6; 
		int listcount = memberservice.getOptionListCount(dept);
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page-1) /10) *10 +1;
		int endpage = startpage +10 -1;
		
		if(endpage>maxpage)
			endpage=maxpage;
		
		
		
		List<Member> boardlist = memberservice.getOptionAddressList(page, limit,dept);
		
		mv.setViewName("Admin/admin");
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		mv.addObject("boardlist",boardlist);
		mv.addObject("limit",limit);
		mv.addObject("title1",st1[num]);
		mv.addObject("title2",st2[num]);
		if(dept.equals("")) {
		    dept = "전체부서";
		}
		mv.addObject("dept",dept);
		
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="/list_ajax")
	public Map<String, Object> listAjax(@RequestParam(value="page", defaultValue="1", required=false) int page, 
									   @RequestParam(value="limit", defaultValue="6", required=false) int limit,
									   @RequestParam(value="dept") String dept
									   
									   
			){
		String[] st1 = {"BOAT crew","BOAT의 커뮤니케이션 전문가","BOAT의 변화를 두려워하지않는","BOAT의 신뢰를 이어주는","BOAT의 새로운 표준을 제시하는","BOAT의 게임체인저"};
		String[] st2 = {"전체부서입니다","홍보팀입니다","개발팀입니다","인사팀입니다","기획팀입니다","영업팀입니다"};
		int num = 0;
		if(dept.equals("전체부서")) {
			dept = "";
			num = 0;
		}else if(dept.equals("홍보팀")) {
			num = 1;
		}else if(dept.equals("개발팀")) {
			num = 2;
		}else if(dept.equals("인사팀")) {
			num = 3;
		}else if(dept.equals("기획팀")) {
			num = 4;
		}else if(dept.equals("영업팀")) {
			num = 5;
		}
		System.out.println("dept = " + dept);
		int listcount = memberservice.getOptionListCount(dept);
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page-1) /6) *6 +1;
		int endpage = startpage +6 -1;
		if(endpage > maxpage)
			endpage = maxpage;
		
		
		
		List<Member> memberlist = memberservice.getOptionAddressList(page, limit,dept);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page",page);
		map.put("maxpage",maxpage);
		map.put("startpage",startpage);
		map.put("endpage",endpage); 
		map.put("listcount",listcount);
		map.put("memberlist",memberlist);
		map.put("limit",limit);
		map.put("title1",st1[num]);
		map.put("title2",st2[num]);
		
		if(dept.equals("")) {
		    dept = "전체부서";
		}
		map.put("dept", dept);
		
		
		return map;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView adminForm(@RequestParam(value="empno",defaultValue="1",required=false) String empno,
								ModelAndView mv	) {
		
		
		List<Member> memberlist = memberservice.getMemberList(empno);
		
		mv.setViewName("Admin/adminForm");
		//mv.addObject("page",page);
		mv.addObject("memberlist",memberlist);
		
		
		
		
		
		return mv;
	}
	
	@RequestMapping(value="/modify_process", method = RequestMethod.POST)
	public String modify_process(Member member, RedirectAttributes rattr,
			Model model, HttpServletRequest request) throws Exception {
		
		
		member.setPASSWORD_OG(member.getPASSWORD());
		
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getPASSWORD());
		
		member.setPASSWORD(encPassword);
		
		
		MultipartFile uploadfile = member.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			
			String saveFolder = new File("src/main/resources/static/profile").getAbsolutePath();
//			String saveFolder= profileSaveFolder.getProfilesavefolder();
			List<String> fileDBName = fileDBName(fileName, saveFolder, member.getEMPNO());
			
			
			String fileDBNames = fileDBName.get(0);
			String refileName = fileDBName.get(1);
			
			//transferTo(file path) : 업로드된 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBNames));
			
			//바뀐 파일명으로 저장
			member.setPROFILE_IMG(refileName);
			
			
			System.out.println("absolutePathss " +saveFolder);
			//파일 경로 이름
			member.setPROFILE_FILE("profile" + fileDBNames);
		}
		
		
		int result = memberservice.update_admin(member);
		System.out.println("result="+result);
		
				
		//삽입이 된 경우
		if(result == 1) {
			
			rattr.addFlashAttribute("result", "joinSuccess");
			return "redirect:/admin/list";
		}else {
			model.addAttribute("url", request.getRequestURI());
			model.addAttribute("message","회원 가입 실패");
			
			return "error/error";
		}
	}	  					
		
	//파일명
		private List<String> fileDBName(String fileName, String saveFolder, String empno) {
			//새로운 폴더 이름 : 오늘 년+월+일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);//오늘 년도 구합니다.
			int month = c.get(Calendar.MONTH) + 1;//오늘 월 구합니다.
			int date = c.get(Calendar.DATE);//오늘 일 구합니다.
			
			String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
			
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
			
			
			String fileExtenstion = fileName.substring(index + 1);
			
			/*** 확장자 구하기 끝 ***/
			
			//새로운 파일명
			String refileName = empno + "." + fileExtenstion;
			
			
			//오라클 디비에 저장될 파일명
			//String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
			
			
			List<String> fileNames = new ArrayList<String>();
			fileNames.add(fileDBName);
			fileNames.add(refileName);
			
			return fileNames;
		}	
			
	
	
}
