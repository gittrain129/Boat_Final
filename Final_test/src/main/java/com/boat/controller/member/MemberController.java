package com.boat.controller.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);


	
	@GetMapping("/sign_up")
	public String signUp() {
		return "/Member/sign_up";
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
		return "/Member/MyboardList";
	}
	
	
}
