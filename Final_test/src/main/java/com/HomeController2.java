package com;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.boat.domain.Member;


@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
@Controller
public class HomeController2 {

	
	
	
	@GetMapping("/index")
	public String hello() {
		
		
		return "/Main/index";
		
	}
	
	
	
}
