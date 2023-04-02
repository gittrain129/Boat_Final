package com.boat.controller.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/board")
public class boardController {

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(value="page",defaultValue="1",required=false) int page,
									ModelAndView mv	) {
		int limit = 10; 
				
	//	int listcount = boardService.getListCount();
		
		//int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page-1) /10) *10 +1;
		int endpage = startpage +10 -1;
		
		if(endpage>maxpage)
			endpage=maxpage;
		
	//  List<Board> boardlist = boardService.getBoardList(page,limit);
		
		mv.setViewName("board/board_list");
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		//mv.addObject("listcount",listcount);
		//mv.addObject("boardlist",boardlist);
		mv.addObject("limit",limit);
		return mv;
	}
	
	
	@GetMapping("/Write")
	public String Write() {
		return "/Board/board_write";
	}
	

	@GetMapping("/detail")
	
	   public ModelAndView Detail (ModelAndView mv) {
		
			   return mv;
	
}
	
	//수정
	//답글 보기 달기
	//삭제

}