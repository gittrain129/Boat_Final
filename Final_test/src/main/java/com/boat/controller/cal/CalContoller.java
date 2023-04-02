package com.boat.controller.cal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
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
	
	//@SuppressWarnings("unchecked")
	@RequestMapping("/getEvents")
	    @ResponseBody
	    public  Map<String,Object> getEvents(
	    		//@RequestParam("eventName") String eventName
	    		@RequestParam(value = "DEPT", required = false)String DEPT) {
		 
		 JSONObject jsonObj = new JSONObject();
		// JSONArray jsonArr = new JSONArray();
	        
		  List<Calendar> events;
	        if (DEPT != null && !DEPT.isEmpty()) {
	            events = calendarService.getEventsByDept(DEPT);
	        } else {
	            events = calendarService.getAllEvents();
	        }
	        //Map<String,Object>map = new HashMap<String,Object>();
	        //map.put("events", events);
	        JSONArray jsonArr = new JSONArray();
	        logger.info("dddddd"+events.toString());
	        
	        Map <String,Object> event = new HashMap<String,Object>();
	        for(Calendar cal: events) {
	        	 event.put("id",cal.getSCHEDULE_CODE());
	             event.put("start", cal.getSTART_DATE());
	             event.put("end", cal.getEND_DATE());
	             event.put("title", cal.getEVENT_NAME());
	             event.put("color",cal.getCOLOR());
	             event.put("allDay", cal.getALLDAY());
	             event.put("DEPT", cal.getDEPT());
	            
	           //  jsonArr.add(cal);
	        }
	       // logger.info(event);
	        return event;
		 
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
