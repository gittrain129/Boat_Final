package com.boat.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class boardController {

	@GetMapping("/boardList")
	public String hello5() {
		return "/Board/boardList";
	}
	
	
	@GetMapping("/boardWrite")
	public String hello3() {
		return "/Board/boardWrite";
	}
	
}
