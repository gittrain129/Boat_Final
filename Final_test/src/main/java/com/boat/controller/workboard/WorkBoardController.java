package com.boat.controller.workboard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.boat.controller.main.HomeController;

@Controller
public class WorkBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@GetMapping("/workboard")
	public String hello() {
		return "/WorkBoard/workboard_list";
	}

	
}
