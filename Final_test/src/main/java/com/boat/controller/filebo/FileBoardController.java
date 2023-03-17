package com.boat.controller.filebo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Filebo")//http://localhost:8088/myhome4/board/로 시작하는 주소 매핑
public class FileBoardController {

	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String mainpage() {
		
		
	return "Filebo/File_bo_List";
	}
	
}//클래스 end
