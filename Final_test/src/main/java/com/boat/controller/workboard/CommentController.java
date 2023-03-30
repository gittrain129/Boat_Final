package com.boat.controller.workboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value="/comment")
public class CommentController {
	
private CommentService commentService;
	
	@Autowired
	public CommentController(CommentService commentService) {
		this.commentService = commentService;
	}


	
	@PostMapping(value="/add")
	public int CommentAdd(Comment co) {
		return commentService.commentsInsert(co);				
	}
	
}
