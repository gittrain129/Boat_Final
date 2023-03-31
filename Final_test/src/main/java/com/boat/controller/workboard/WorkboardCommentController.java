package com.boat.controller.workboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value="/comment")
public class  WorkboardCommentController {
	
private  WorkboardCommentService commentService;
	
	@Autowired
	public  WorkboardCommentController( WorkboardCommentService commentService) {
		this.commentService = commentService;
	}


	
	@PostMapping(value="/add")
	public int CommentAdd(WorkboardComment co) {
		return commentService.commentsInsert(co);				
	}
	
}
