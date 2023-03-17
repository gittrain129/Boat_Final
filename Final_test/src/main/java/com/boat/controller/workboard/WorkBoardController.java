package com.boat.controller.workboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WorkBoardController {

	@GetMapping("/workboard")
	public String hello() {
		return "/WorkBoard/workboard_list";
	}
	
	
}
