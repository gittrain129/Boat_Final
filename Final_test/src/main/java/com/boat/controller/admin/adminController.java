package com.boat.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class adminController {


	@GetMapping("/admin")
	public String hello5() {
		return "/Admin/admin_radio";
	}
}
