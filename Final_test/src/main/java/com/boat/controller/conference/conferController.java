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
     private ConferenceReservationService co;

   
   @PostMapping("/reservation")
   public String reserveConference(@RequestParam("rental") String rental,
		   						   @RequestParam("start_time") String startTime,
                                   @RequestParam("end_time") String endTime,
                                   @RequestParam("content") String content) {
    
      System.out.println("호출됨 reservation 메소드");
      System.out.println("rental은: " + rental);
     ConferenceReservation c1 = new ConferenceReservation();
     c1.setSTART_TIME(startTime);
     c1.setEND_TIME(endTime);
     c1.setCONTENT(content);
     c1.setRENTAL(rental);
     co.insert1(c1);
     System.out.println("insert됨 reservation 메소드");
     return "redirect:/confer/view";
   }
   
   
   

   @GetMapping("/view")
   public String mainView(	@RequestParam(value="tab_info",defaultValue="대회의실",required=false) String tab,
		   					Model model) {	
	   								
      System.out.println("view 호출되는중임");
      
       List<ConferenceReservation> cs = co.getcal(tab);

       
       List<Map<String, Object>> cList = new ArrayList<>();
       
       for (ConferenceReservation con : cs) {
           Map<String, Object> event = new HashMap<>();
           event.put("id", con.getID());
           event.put("rental",con.getRENTAL());
           event.put("start", con.getSTART_TIME());
           event.put("end", con.getEND_TIME());
           event.put("title", con.getCONTENT());
           
           cList.add(event);
       }

       System.out.println(cList);
       
       model.addAttribute("list", cList);

     
       return "/Conference_Res/conferMain";
   }
   
   
   
   
   
   
}