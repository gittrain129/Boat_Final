package com.boat.controller.Attendance;


import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
		//if(TodayMyatt!=null||TodayMyatt.equals("")) {
			mv.addObject("TodayMyatt",TodayMyatt);
		//}
		

		/*
		 * //오늘 Calendar currentCalendar = Calendar.getInstance();
		 * 
		 * //이번달
		 * int month = currentCalendar.get(Calendar.MONTH) + 1;
		 * 
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);//오늘
		 * 
		 * Date mon = currentCalendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		 * currentCalendar.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY); //String today
		 * =sdf.format(currentCalendar);
		 * 
		 * //System.out.println("오늘날짜 "+today);
		 * 
		 * // int thisWeek = getWeekOfYear(sdf.format(new Date()));
		 * 
		 * 
		 * // System.out.println("이번주 확인"+thisWeek);
		 * 
		 */

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar currentCalendar = Calendar.getInstance();

	        
	      //이번달
	        String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);


	      //이전 날짜
	        currentCalendar.add(currentCalendar.DATE, -1);
	        String pastDay = df.format(currentCalendar.get(Calendar.DATE));
		      //이번달 마지막 날짜  
		        String lastDay =  df.format(currentCalendar.getActualMaximum(Calendar.DAY_OF_MONTH ));
				

	      //이번주 첫째 날짜  
	        currentCalendar.add(Calendar.DATE, 1 - currentCalendar.get(Calendar.DAY_OF_WEEK)); 
	        String firstWeekDay = df.format(currentCalendar.get(Calendar.DATE));    
	      

	      //이번주 마지막 날짜  

	        currentCalendar.add(Calendar.DATE, 7 - currentCalendar.get(Calendar.DAY_OF_WEEK)); 
	        String lastWeekDay = df.format(currentCalendar.get(Calendar.DATE)); 

	        System.out.println(firstWeekDay+"============================="+lastWeekDay);

	        attandanceService.thisweekwork(firstWeekDay,lastWeekDay);
			
			
			
			
			
			
			
			
			
			
		//전체리스트....? admin 사용...?
		mv.addObject("attlist",attlist);
		mv.setViewName("Attendance/main");
	return mv;
	
	}
	
	private int getWeekOfYear(String date) {
	    Calendar calendar = Calendar.getInstance();
	    String[] dates = date.split("-");
	    int year = Integer.parseInt(dates[0]);
	    int month = Integer.parseInt(dates[1]);
	    int day = Integer.parseInt(dates[2]);
	    calendar.set(year, month - 1, day);
	    return calendar.get(Calendar.WEEK_OF_YEAR);//16주차
	    //return calendar.get(Calendar.WEEK_OF_MONTH);//3주차
	}
	
	
	@ResponseBody
	@PostMapping(value="/on")
	public Map<String,String> on(String ON_TIME,String EMPNO,String DEPT,String NAME,
			 				ModelAndView mv
			 				,HttpServletRequest request)throws IOException
	{
		
		
		
		logger.info("att접속중......출근한 empno = "+EMPNO);
		logger.info("att접속중......출근한 ON_TIME = "+ON_TIME);
		logger.info("att접속중......출근한 NAME = "+NAME);
		attandanceService.AttOn(ON_TIME,EMPNO,DEPT,NAME);
	
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
			, ModelAndView mv
			,HttpServletRequest request) throws ParseException {
		logger.info("att접속중......퇴근할 empno = "+EMPNO);
		logger.info("att접속중......퇴근할 OFF_TIME = "+OFF_TIME);
		HttpSession session = request.getSession();
		session.removeAttribute("TodayOntime");

		attandanceService.AttOff(OFF_TIME,EMPNO);
		mv.addObject("OFF_TIME", OFF_TIME);
		Map<String,String> map =new HashMap<String,String>();
		map.put("OFF_TIME", OFF_TIME);
		
		return map;
	}
	
	
	@RequestMapping(value="/Exceldown")
	public void attListdown(String EMPNO,HttpServletRequest request, 
			HttpServletResponse response, ModelMap model)
			throws Exception {
		Attandance att = new Attandance();
		att.setEMPNO(EMPNO);
		attandanceService.getExceldata(att,request,response);
		
		
	}
}//클래스 end
