package com.boat.controller.Attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Attendance")
public class AttendanceContoroller {
	

	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String attList() {
		
		
	return "Attendance/a";
	}
}//클래스 end
