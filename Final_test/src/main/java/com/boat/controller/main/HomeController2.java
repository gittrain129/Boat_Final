package com.boat.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController2 {

	@GetMapping("/index")
	public String hello() {
		return "/Main/index";
	}
	
	
	
}
