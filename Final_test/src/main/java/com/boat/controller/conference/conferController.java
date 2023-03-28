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
import org.springframework.web.bind.annotation.ResponseBody;

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
                                   @RequestParam("content") String content,
                                   @RequestParam("start") String start,
                                   @RequestParam("end") String end,
                                   @RequestParam("id") String id
		   						) {
    
     
     ConferenceReservation c1 = new ConferenceReservation();
     c1.setSTART_TIME(startTime);
     c1.setEND_TIME(endTime);
     c1.setCONTENT(content);
     c1.setRENTAL(rental);
     c1.setSTART_T(start);
     c1.setEND_T(end);
     c1.setID(id.toString());
     System.out.println("VO의 id = "+c1.getID());
     co.insert1(c1);
     
     return "redirect:/confer/view";
   }
   
   
   

   @GetMapping("/view")
   public String mainView(	@RequestParam(value="tab_info",defaultValue="대회의실",required=false) String tab,
		   					Model model) {	
	   String[] st = {"승인대기중","승인완료","거절"};
       List<ConferenceReservation> cs = co.getcal(tab);
       

       List<Map<String, Object>> cList = new ArrayList<>();
       
       for (ConferenceReservation con : cs) {
           Map<String, Object> event = new HashMap<>();
           //여기에 if(con.getSTATUS() == 1){ 
           //admit에서 status바뀌는 작업후에 if문 추가
           event.put("id", con.getID());
           event.put("rental",con.getRENTAL());
           event.put("start", con.getSTART_TIME());
           event.put("end", con.getEND_TIME());
           event.put("title", con.getCONTENT());
           event.put("start_t", con.getSTART_T());
           event.put("end_t", con.getEND_T());
           
           String status = st[Integer.parseInt(con.getSTATUS())];
           event.put("status", status);
           
       
           cList.add(event);
           
       }

       model.addAttribute("list", cList);

       System.out.println(cList);
     
       return "/Conference_Res/conferMain";
   }
   
   
    @ResponseBody
	@RequestMapping(value="/view_ajax")
	public List<Map<String, Object>> ListAjax(@RequestParam(value="tab_info",defaultValue="대회의실",required=false) String tab
			){
		
		List<ConferenceReservation> cs = co.getcal(tab);
		 List<Map<String, Object>> cList = new ArrayList<>();
		  for (ConferenceReservation con : cs) {
			  //여기에 if(con.getSTATUS() == 1){ 
	           //admit에서 status바뀌는 작업후에 if문 추가
	           Map<String, Object> event = new HashMap<>();
	           event.put("id", con.getID());
	           event.put("rental",con.getRENTAL());
	           event.put("start", con.getSTART_TIME());
	           event.put("end", con.getEND_TIME());
	           event.put("title", con.getCONTENT());
	           
	           cList.add(event);
	       }
		
		return cList;
	}
   
    @RequestMapping(value="/admit")
    public String confer_admit(@RequestParam(value="page", defaultValue="1", required=false) int page,
                               @RequestParam(value="tab", defaultValue="전체", required=false) String tab,
                               Model model) {
        System.out.println(tab);
        System.out.println(page);
        int limit = 8;
        int listcount = co.listcount();
        int maxpage = (listcount + limit - 1) / limit;

        int startpage = ((page-1) /limit) *limit +1;
        int endpage = startpage +limit -1;

        int startrow = (page -1) * limit +1; 
		int endrow = startrow + limit -1;	
        
        if(endpage>maxpage)
            endpage=maxpage;
        if(tab.equals("전체")) {
        	tab="";
        }

        List<ConferenceReservation> reservation = co.admit(startrow,endrow,tab);
        model.addAttribute("page", page);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("reservation", reservation);
        return "/Conference_Res/conferAdmit";
    }

   
    @ResponseBody
	@RequestMapping(value="/admit_ajax")
	public String admit_Ajax(@RequestParam("rental") String rental,
												@RequestParam("start_time") String startTime,
												@RequestParam("end_time") String endTime,
												@RequestParam("id") String id
												){
		
    	ConferenceReservation c2 = new ConferenceReservation();
        c2.setSTART_TIME(startTime);
        c2.setEND_TIME(endTime);
        c2.setRENTAL(rental);
        c2.setID(id.toString());
        
        System.out.println("admit_ajax의 id = "+c2.getID());
        co.admit_pro(c2);
        
        
        return "redirect:/confer/admit";	
    	
    	
    	
    	
    	
    	
    	
	}
    

      
      
   
    
    
    
    
    
    
    
    
    
    
    
}