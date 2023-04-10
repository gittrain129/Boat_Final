package com.boat.controller.address;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boat.Service.MemberService;
import com.boat.domain.Member;

@Controller
@RequestMapping(value="/address")
public class addressController {

	private MemberService memberservice;
	
	@Autowired
	public addressController(MemberService memberservice) {
		
		this.memberservice = memberservice;
		
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(value="page",defaultValue="1",required=false) int page,
								@RequestParam(value="dept",defaultValue="전체부서", required=false) String dept,
			ModelAndView mv	) {
		if(dept.equals("전체부서")) {
			dept = "";
		}
		int limit = 6; 
		int listcount = memberservice.getOptionListCount(dept);
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page-1) /10) *10 +1;
		int endpage = startpage +10 -1;
		
		if(endpage>maxpage)
			endpage=maxpage;
		
		
		
		List<Member> boardlist = memberservice.getOptionAddressList(page, limit,dept);
		
		mv.setViewName("Address/newaddress");
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		mv.addObject("boardlist",boardlist);
		mv.addObject("limit",limit);
		mv.addObject("dept",dept);
		
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="/list_ajax")
	public Map<String, Object> listAjax(@RequestParam(value="page", defaultValue="1", required=false) int page, 
									   @RequestParam(value="limit", defaultValue="10", required=false) int limit,
									   @RequestParam(value="dept") String dept
									   
									   
			){
		if(dept.equals("전체부서")) {
			dept = "";
		}
		
		int listcount = memberservice.getOptionListCount(dept);
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page-1) /10) *10 +1;
		int endpage = startpage +10 -1;
		if(endpage > maxpage)
			endpage = maxpage;
		
		
		
		List<Member> boardlist = memberservice.getOptionAddressList(page, limit,dept);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page",page);
		map.put("maxpage",maxpage);
		map.put("startpage",startpage);
		map.put("endpage",endpage); 
		map.put("listcount",listcount);
		map.put("boardlist",boardlist);
		map.put("limit",limit);
		
		
		return map;
	}
}
