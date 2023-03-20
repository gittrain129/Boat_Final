package com.boat.controller.Todo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Todo")//http://localhost:8088/myhome4/board/로 시작하는 주소 매핑
public class TodoContoroller {


	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String mainpage() {
		
		
	return "Todo/Todonew";
	}
	
	@RequestMapping(value="/todo1",method=RequestMethod.GET)
	public String todosample1() {
		
		
		return "Todo/todo";
	}
	
	@RequestMapping(value="/todo2",method=RequestMethod.GET)
	public String todosample2() {
		
		
		return "Todo/todo2";
	}
	
}//클래스 end
