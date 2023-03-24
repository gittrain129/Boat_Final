package com.boat.controller.member;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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

import com.boat.Service.MemberService;
import com.boat.naver.NaverLoginBO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	private MemberService memberservice;
	private NaverLoginBO naverloginbo;//네이버 api
	
	@Autowired
	public MemberController(NaverLoginBO naverloginbo) {
		this.naverloginbo = naverloginbo;
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
