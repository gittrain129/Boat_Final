package com.boat.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping(value="/admin")
public class adminController {


	@GetMapping("/list")
	public String adminlist() {
		return "/Admin/adminlist";
	}
	
	
	
	@GetMapping("")
	public String hello5() {
		return "/Admin/admin_radio";
	}
}
