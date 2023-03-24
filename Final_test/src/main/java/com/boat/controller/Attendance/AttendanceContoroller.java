package com.boat.controller.Attendance;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boat.Service.Attandance.AttandanceService;

@Controller
@RequestMapping(value="/Attendance")
public class AttendanceContoroller {
	
	private static final Logger logger = LoggerFactory.getLogger(AttendanceContoroller.class);
	
	private AttandanceService attandanceService;
	
	public AttendanceContoroller(AttandanceService attandanceService) {
		this.attandanceService = attandanceService;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String attList() {
		
		
	return "Attendance/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/on",method=RequestMethod.POST)
	public void on(@RequestParam(value="on",required=false) String on,
			 @RequestParam(value="empno",required=false)String empno,
			 Model mo) {
		
		logger.info("출근시간 :"+ on);
		logger.info("사번 :"+ empno);
		attandanceService.AttOn(on,empno);
		
	}
	
	@RequestMapping(value="/off",method=RequestMethod.POST)
	public void off(@RequestParam(value="off",required=false) String off,
			 @RequestParam(value="empno",required=false)String empno) {

		logger.info("퇴근시간 :"+ off);
		logger.info("사번 :"+ empno);
		
	}
	
	
}//클래스 end
