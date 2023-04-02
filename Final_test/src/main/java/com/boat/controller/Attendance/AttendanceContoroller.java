package com.boat.controller.Attendance;


import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView attList(ModelAndView mv,
								Principal principal) {
		String EMPNO = principal.getName();
		logger.info("attlist접속중......로그인한 empno = "+EMPNO);
		List<Attandance> attlist = attandanceService.getAttList(EMPNO);
		
		//On_time _ EMPNO 받아서 넣기!
		Attandance TodayMyatt = attandanceService.getTodayMyatt(EMPNO);
		
		
		mv.addObject("TodayMyatt",TodayMyatt);
		//전체리스트....? admin 사용...?
		mv.addObject("attlist",attlist);
		mv.setViewName("Attendance/main");
	return mv;
	
	}
	
	@ResponseBody
	@PostMapping(value="/on")
	public Map<String,String> on(String ON_TIME,String EMPNO,String DEPT,
			 				ModelAndView mv
			 				,HttpServletRequest request)throws IOException
	{
		
		
		
		logger.info("att접속중......출근한 empno = "+EMPNO);
		logger.info("att접속중......출근한 ON_TIME = "+ON_TIME);
		attandanceService.AttOn(ON_TIME,EMPNO,DEPT);
	
		HttpSession session = request.getSession();
		Attandance TodayMyatt = attandanceService.getTodayMyatt(EMPNO);
		session.setAttribute("TodayOntime",TodayMyatt.getON_TIME());
		
		Map<String,String> map =new HashMap<String,String>();
		map.put("ON_TIME", ON_TIME);
		return map;
	}
	@ResponseBody
	@PostMapping(value="/off")
	public Map<String,String> off(String EMPNO,String OFF_TIME
			, ModelAndView mv) {
		logger.info("att접속중......퇴근할 empno = "+EMPNO);
		logger.info("att접속중......퇴근할 OFF_TIME = "+OFF_TIME);
		
		attandanceService.AttOff(OFF_TIME,EMPNO);
		mv.addObject("OFF_TIME", OFF_TIME);
		Map<String,String> map =new HashMap<String,String>();
		map.put("OFF_TIME", OFF_TIME);
		return map;
	}
	
	
	
}//클래스 end
