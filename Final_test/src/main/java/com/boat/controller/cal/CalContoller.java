package com.boat.controller.cal;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boat.Service.Calendar.CalendarService;
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
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public int CalAdd(
			Calendar cal,
			HttpServletRequest request) throws Exception{
		
		logger.info("...."+cal.toString());
		
		return calendarService.insertcal(cal);
		
		
	}
	
	@RequestMapping("/getEvents")
	    @ResponseBody
	    public  List<Map <String,Object>> getEvents(
	    		@RequestParam(value = "DEPT", required = false)String DEPT) throws ParseException {
		 
	        
		  List<Calendar> events;
	        if (DEPT != null && !DEPT.isEmpty()) {
	            events = calendarService.getEventsByDept(DEPT);
	        } else {
	            events = calendarService.getAllEvents();
	        }
	        List<Map <String,Object>> result = new ArrayList<Map <String,Object>>();
	        
	        for(Calendar cal: events) {
	        	Map <String,Object> event = new HashMap<String,Object>();
	        	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mmz");
	        	//Date date = format.parse(cal.getSTART_DATE());
	        	//Date date2 = format.parse(cal.getEND_DATE());
	    	    //java.util.Calendar ca =  java.util.Calendar.getInstance();
	    	    //format.format(cal.getSTART_DATE());
	    	    
	        	 event.put("id",cal.getSCHEDULE_CODE());
	             //event.put("start", date);
	             //event.put("end", date2);
	             event.put("start", cal.getSTART_DATE());
	             event.put("end", cal.getEND_DATE());
	             event.put("title", cal.getEVENT_NAME());
	             event.put("color",cal.getCOLOR());
	             event.put("allDay", cal.getALLDAY());

	             event.put("DEPT", cal.getDEPT());
	             result.add(event);
	        }
	        logger.info("얍"+result.toString());
	        return result;
		 
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
