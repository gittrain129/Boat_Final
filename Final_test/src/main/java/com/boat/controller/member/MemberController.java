package com.boat.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member")
public class MemberController {


	
	@GetMapping("/sign_up")
	public String signup() {
		return "/Member/sign_up";
	}
	
	@GetMapping("/sign_in")
	public String signin() {
		return "/Member/sign_in";
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
