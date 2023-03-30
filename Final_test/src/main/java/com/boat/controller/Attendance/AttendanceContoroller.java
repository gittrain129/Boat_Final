package com.boat.controller.Attendance;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boat.Service.Attandance.AttandanceService;
import com.boat.domain.Attandance;

@Controller
@RequestMapping(value="/Attendance")
public class AttendanceContoroller {
	
	private static final Logger logger = LoggerFactory.getLogger(AttendanceContoroller.class);
	
	private AttandanceService attandanceService;
	
	public AttendanceContoroller(AttandanceService attandanceService) {
		this.attandanceService = attandanceService;
	}
	
	//현재는 전체 리스트 가져오지만 추후 어드민과 개인 회원 나눠서 가저와야함
	//쿼리 변경 및 버튼 변경 후 
	@RequestMapping(value="/list")
	public ModelAndView attList(ModelAndView mv) {
		List<Attandance> attlist = attandanceService.getAttList();
		
		//On_time _ EMPNO 받아서 넣기!
//		Attandance TodayMyatt = attandanceService.TodayMyatt(EMPNO);
		Attandance TodayMyatt = attandanceService.TodayMyatt();
		
		mv.addObject("TodayMyatt",TodayMyatt);
		mv.addObject("listcount",attlist);
		mv.setViewName("Attendance/main");
	return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/on")
	public ModelAndView on(String EMONO,String ON_TIME,
			 ModelAndView mv) {
		
		attandanceService.AttOn(ON_TIME,EMONO);
	
		
		mv.addObject("ON_TIME", ON_TIME);
		mv.setViewName("Attendance/main");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/off")
	public ModelAndView off(String EMONO,String OFF_TIME
			, ModelAndView mv) {
	//	String off = attandance.getOFF_TIME();
	//	String empno =attandance.getEMPNO();
		
	//	logger.info("퇴근시간 :"+ off);
	//	logger.info("사번 :"+ empno);
		
		attandanceService.AttOff(OFF_TIME,EMONO);
		mv.setViewName("Attendance/main");
		mv.addObject("OFF_TIME", OFF_TIME);
		return mv;
	}
	
	
	
}//클래스 end
