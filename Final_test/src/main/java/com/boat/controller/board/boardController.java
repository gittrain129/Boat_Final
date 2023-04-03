package com.boat.controller.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.boat.Service.BoardService;
import com.boat.domain.Board;


@Controller
@RequestMapping(value="/board")
public class boardController {
	
	private BoardService boardService;
	
	@Autowired
	public boardController(BoardService boardservice) {
		
		this.boardService = boardservice;
		
	}
	

	@RequestMapping(value="/List", method=RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(value="page",defaultValue="1",required=false) int page,
									ModelAndView mv	) {
		int limit = 10; 
				
		int listcount = boardService.getListCount();
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page-1) /10) *10 +1;
		int endpage = startpage +10 -1;
		
		if(endpage>maxpage)
			endpage=maxpage;
		
	  List<Board> boardlist = boardService.getBoardList(page,limit);
		
		mv.setViewName("Board/boardList");
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		mv.addObject("boardlist",boardlist);
		mv.addObject("limit",limit);
		return mv;
	}
	
	
	@GetMapping(value="/Write")
	public String board_write() {
		return "Board/board_write";
	}
	
	@PostMapping("/add")
	public String add(Board board, HttpServletRequest request) throws Exception{
				//뷰페이지에 empno를 구해오는 쿼리문도 넣어야함
		boardService.insertBoard(board);
		
		
		return"redirect:List";

	}
	
	@GetMapping("/detail")
	
	   public ModelAndView Detail (
	            int num,ModelAndView mv, HttpServletRequest request,
	            @RequestHeader(value="referer", required=false) String beforeURL){

		
		if(beforeURL!=null && beforeURL.endsWith("list")) {
			boardService.setReadCountUpdate(num);
		}
		
		Board board = boardService.getDetail(num);
		
		if(board==null) {
		
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message","상세보기 실패입니다.");
		}
		else {
			
			//int count = commentService.getListCount(num);
			mv.setViewName("Board/board_view");
			//mv.addObject("count", count);
			mv.addObject("boarddata", board);
		}
		return mv;
	}
	
	
	
	
	
	
	

	
	//수정
	//답글 보기 달기
	//삭제

}