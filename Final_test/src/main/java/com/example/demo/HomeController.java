package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {

	@GetMapping("/index")
	public String hello() {
		return "/index";
	}
	
	@GetMapping("/confer")
	public String hello2() {
		return "/Conference_Res/conferMain";
	}
	
	@GetMapping("/write")
	public String hello3() {
		return "/Board/boardWrite";
	}
	
	@GetMapping("/confer2")
	public String hello4() {
		return "/Conference_Res/calendar2";
	}
	
	@GetMapping("/admin")
	public String hello5() {
		return "/Admin/admin_radio";
	}
	
	@GetMapping("/address")
	public String hello6() {
		return "/Address/newaddress";
	}
	
	
}
