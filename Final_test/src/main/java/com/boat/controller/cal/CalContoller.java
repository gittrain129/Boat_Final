package com.boat.controller.cal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boat.Service.Calendar.CalendarService;
import com.boat.controller.Attendance.AttendanceContoroller;
import com.boat.domain.Calendar;

@Controller
@RequestMapping(value = "/cal")
public class CalContoller {
	
	private static final Logger logger = LoggerFactory.getLogger(CalContoller.class);
	
	private CalendarService calendarService;
	
	public CalContoller(CalendarService calendarService) {
		this.calendarService = calendarService;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/getEvent",method=RequestMethod.POST)
	public Map<String,Object>  calListAll(
		@RequestParam(value="dept",required=false)String dept
	) {
	int callistcount = calendarService.getListcount();//총 리스트 수를 받아옴
	//총 페이지 수   
	
	List<Calendar> callist = calendarService.getList(dept);//리스트를 받아옴
	 Map<String,Object> map= new HashMap<String,Object>();
	 
	map.put("listcount",callistcount);
	map.put("callist",callist);
	for(int i =0; i<callist.size(); i++) {
		Object ob =callist.get(i);
		
	}
	
	return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public int CalAdd(
			Calendar cal,
			HttpServletRequest request) throws Exception{
		
		
		logger.info("...."+cal.toString());
		//String cal = 
		
		return calendarService.insertcal(cal);
		
		
	}
		
		
	
	@RequestMapping(value="/map",method=RequestMethod.GET)
	public String mapPage() {
		
		
	return "Calendar/map";
	}

	
	@RequestMapping(value="/cal",method=RequestMethod.GET)
	public String fullcalPage() {
		
		
		return "Calendar/fullcalendar";
	}
}//클래스 end
