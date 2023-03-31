package com.boat.controller.workboard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boat.Service.WorkBoard.WorkboardService;
import com.boat.controller.main.HomeController;
import com.boat.domain.Workboard;


@Controller
@RequestMapping(value="/comment")
public class  WorkboardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private  WorkboardService commentService;
	
	@GetMapping("/workboard")
	public String hello() {
		return "/WorkBoard/workboard_list";
	}
	
	
	@Autowired
	public  WorkboardController( WorkboardService commentService) {
		this.commentService = commentService;
	}


	
	@PostMapping(value="/add")
	public int CommentAdd(Workboard co) {
		return commentService.commentsInsert(co);				
	}
	
}
