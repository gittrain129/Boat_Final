package com.boat.controller.cal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalContoller {
	

	@RequestMapping(value="/map",method=RequestMethod.GET)
	public String mapPage() {
		
		
	return "Calendar/map";
	}

	@RequestMapping(value="/cal",method=RequestMethod.GET)
	public String calPage() {
		
		
	return "Calendar/cal";
	}
}//클래스 end