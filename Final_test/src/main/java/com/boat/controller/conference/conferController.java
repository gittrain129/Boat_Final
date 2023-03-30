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
     
     co.insert1(c1);
     
     return "redirect:/confer/view";
   }
   
   
   

   @GetMapping("/view")
   public String mainView(	@RequestParam(value="tab_info",defaultValue="",required=false) String tab,
		   					Model model) {	
	   String[] st = {"승인대기중","승인완료","거절"};
	   
       List<ConferenceReservation> cs = co.getcal(tab);
       List<Map<String, Object>> cList = new ArrayList<>();
       
       for (ConferenceReservation con : cs) {
    	   
    	   
    	   Map<String, Object> event = new HashMap<>();
                     
           event.put("id", con.getID());
           event.put("rental",con.getRENTAL());
           event.put("start", con.getSTART_TIME());
           event.put("end", con.getEND_TIME());
           event.put("title", con.getCONTENT());
           event.put("start_t", con.getSTART_T());
           event.put("end_t", con.getEND_T());
           String status = st[Integer.parseInt(con.getSTATUS())];
           event.put("status", status);
           event.put("memo", con.getMEMO());
           
           cList.add(event);
    	  
          }
       System.out.println(cList);
       model.addAttribute("list", cList);

       return "/Conference_Res/conferMain";
   }
   
   
    @ResponseBody
	@RequestMapping(value="/view_ajax")
	public List<Map<String, Object>> ListAjax(@RequestParam(value="tab_info",defaultValue="대회의실",required=false) String tab
			){
		
    	 String[] st = {"승인대기중","승인완료","거절"};
  	   
         List<ConferenceReservation> cs = co.getcal(tab);
         List<Map<String, Object>> cList = new ArrayList<>();
         
         for (ConferenceReservation con : cs) {
        	 if(Integer.parseInt(con.getSTATUS()) ==1) {
      	   	 Map<String, Object> event = new HashMap<>(); 
             event.put("id", con.getID());
             event.put("rental",con.getRENTAL());
             event.put("start", con.getSTART_TIME());
             event.put("end", con.getEND_TIME());
             event.put("title", con.getCONTENT());
             event.put("start_t", con.getSTART_T());
             event.put("end_t", con.getEND_T());
             String status = st[Integer.parseInt(con.getSTATUS())];
             event.put("status", status);
             event.put("memo", con.getMEMO());
             
             cList.add(event);
        	 }
            }
         
		return cList;
	}
   
    @RequestMapping(value="/admit") //admit 최초 접속시 뷰페이지 처리
    public String confer_admit(@RequestParam(value="page", defaultValue="1", required=false) int page,
                               @RequestParam(value="tab",  required=false) String tab,
                               Model model) {
    	if(tab.equals("전체")) {
        	tab="";
        }
        int limit = 8;
        int listcount = co.listcount(tab);
        int maxpage = (listcount + limit - 1) / limit;

        int startpage = ((page-1) /limit) *limit +1;
        int endpage = startpage +limit -1;

        int startrow = (page -1) * limit +1; 
		int endrow = startrow + limit -1;	
        
        if(endpage>maxpage)
            endpage=maxpage;
        

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
        
        
        co.admit_pro(c2);
        
        
        return "redirect:/confer/admit";	
    	
	}
    
    @ResponseBody
  	@RequestMapping(value="/reject_ajax")
  	public String reject_Ajax(@RequestParam("rental") String rental,
  												@RequestParam("start_time") String startTime,
  												@RequestParam("end_time") String endTime,
  												@RequestParam("id") String id,
  												@RequestParam("reason") int reason
  												){
    	 String[] reject_reason = {"먼저 승인된 일정이 있습니다.","수리,보수등으로 인한 사용불가 상태입니다.","일정관리자에게 유선문의 부탁드립니다."};
  		
      	ConferenceReservation c2 = new ConferenceReservation();
          c2.setSTART_TIME(startTime);
          c2.setEND_TIME(endTime);
          c2.setRENTAL(rental);
          c2.setID(id.toString());
          c2.setMEMO(reject_reason[reason]);
          
        
          co.reject_pro(c2);
          
          
          return "redirect:/confer/admit";	
      	
  	}
      
    @ResponseBody
   	@RequestMapping(value="/admitTab_ajax")
   	public List<Map<String, Object>> admitTabAjax(@RequestParam(value="page", defaultValue="1", required=false) int page,
   												  @RequestParam(value="tab",required=false) String tab
   												 
   			){
    	if(tab.equals("전체")) {
        	tab="";
        	} 
    	int limit = 8;
    	int listcount = co.listcount(tab);
    	int maxpage = (listcount + limit - 1) / limit;

    	int startpage = ((page-1) /limit) *limit +1;
    	int endpage = startpage +limit -1;

    	int startrow = (page -1) * limit +1; 
    	int endrow = startrow + limit -1;	

    	if(endpage>maxpage)
    	endpage=maxpage;
    	

    	List<ConferenceReservation> reservation = co.admit(startrow,endrow,tab);
     	List<Map<String, Object>> cList = new ArrayList<>();
        
        for (ConferenceReservation con : reservation) {
       	 
     	   	 Map<String, Object> event = new HashMap<>(); 
            event.put("id", con.getID());
            event.put("rental",con.getRENTAL());
            event.put("start", con.getSTART_TIME());
            event.put("end", con.getEND_TIME());
            event.put("title", con.getCONTENT());
            event.put("start_t", con.getSTART_T());
            event.put("end_t", con.getEND_T());
            event.put("memo", con.getMEMO());
            event.put("status", con.getSTATUS());
            event.put("page", page);
            event.put("startpage", startpage);
            event.put("endpage", endpage);
            event.put("maxpage", maxpage);
            event.put("tab", tab);
            
            cList.add(event);
       	 }         
     System.out.println(cList);
	        return cList;
   	}
   
    @RequestMapping(value="/admitTab_ajax_page") //admit 최초 접속시 뷰페이지 처리
    public String admitTab_ajax_page(@RequestParam(value="page", defaultValue="1", required=false) int page,
                               @RequestParam(value="tab", required=false) String tab,
                               Model model) {
    	if(tab.equals("전체")) {
        	tab="";
        }
        int limit = 8;
        int listcount = co.listcount(tab);
        int maxpage = (listcount + limit - 1) / limit;

        int startpage = ((page-1) /limit) *limit +1;
        int endpage = startpage +limit -1;

        int startrow = (page -1) * limit +1; 
		int endrow = startrow + limit -1;	
        
        if(endpage>maxpage)
            endpage=maxpage;
        

        List<ConferenceReservation> reservation = co.admit(startrow,endrow,tab);
        model.addAttribute("page", page);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("reservation", reservation);
        return "/Conference_Res/conferAdmit";
    }
    
    
    
}