package com.boat.controller.conference;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boat.Service.ConferenceReservationService;
import com.boat.domain.ConferenceReservation;


@Controller
@RequestMapping(value="/confer")
public class conferController {
	
	@Autowired
	  private ConferenceReservationService conferenceReservationService;

	
	@PostMapping("/reservation")
	public String reserveConference(@RequestParam("start_time") String startTime,
	                                @RequestParam("end_time") String endTime,
	                                @RequestParam("content") String content) {
	 
		System.out.println("호출됨 reservation 메소드");
	  ConferenceReservation conferenceReservation = new ConferenceReservation();
	  conferenceReservation.setStart_time(startTime);
	  conferenceReservation.setEnd_time(endTime);
	  conferenceReservation.setContent(content);
	  conferenceReservationService.insert1(conferenceReservation);
	  System.out.println("insert됨 reservation 메소드");
	  return "success";
	}
	
	
	

	@GetMapping("/view")
	public String mainView(Model model) {
	   
	    List<ConferenceReservation> conferenceReservations = conferenceReservationService.findAll();

	    
	    List<Map<String, Object>> conferenceEvents = new ArrayList<>();
	    for (ConferenceReservation conferenceReservation : conferenceReservations) {
	        Map<String, Object> event = new HashMap<>();
	        event.put("id", conferenceReservation.getId());
	        event.put("title", conferenceReservation.getContent());
	        event.put("start", conferenceReservation.getStart_time());
	        event.put("end", conferenceReservation.getEnd_time());
	        conferenceEvents.add(event);
	    }

	    
	    model.addAttribute("conferenceEvents", conferenceEvents);

	  
	    return "/Conference_Res/conferMain";
	}
	
	
	
	
	
	
}
