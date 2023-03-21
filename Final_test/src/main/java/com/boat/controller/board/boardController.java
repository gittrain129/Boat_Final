package com.boat.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/board")
public class boardController {

	@GetMapping("/boardList")
	public String List() {
		return "/Board/boardList";
	}
	
	
	@GetMapping("/boardWrite")
	public String Write() {
		return "/Board/boardWrite";
	}
	

	@GetMapping("/detail")
	
	   public ModelAndView Detail (ModelAndView mv) {
		
			   return mv;
	
}
	
	//수정
	//답글 보기 달기
	//삭제

}