package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	
	@GetMapping("/index")
	public String hello() {
		return "index2";  //리턴된 값이 브라우저에 나타납니다.
	}
}
