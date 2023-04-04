package com.boat.controller.filebo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boat.Service.FileboService.FileCommentService;
import com.boat.domain.Filecomm;

//@Controller+@ResponseBody
@RestController
@RequestMapping(value="/Filebocom")
public class FileCommentController {
	 
	FileCommentService commentService;
	
	public FileCommentController(FileCommentService commentService) {
		this.commentService = commentService;
	}
	private static final Logger logger=LoggerFactory.getLogger(FileCommentController.class);
	
	@PostMapping(value = "/list")
	public Map<String,Object>CommentList(int board_num, int page){
		List<Filecomm> list = commentService.getCommentList(board_num,page);
		int listcount = commentService.getListCount(board_num);
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("listcount",listcount);
		logger.info("listcount= " + listcount);
		return map;
	}
	
	//@ResponseBody
	@RequestMapping(value="/add")
	public int commentAdd(Filecomm co){
		
		return  commentService.commentInsert(co);
		
		
	}
	
//	@ResponseBody
	@RequestMapping(value="/update")
	public int commentUpdate(Filecomm co){
		
		return  commentService.commentsUpdate(co);
		
		
}
	//@ResponseBody
	@RequestMapping(value="/delete")
	public int commentUpdate(int num){
		
		return  commentService.commentsDelete(num);}
}
