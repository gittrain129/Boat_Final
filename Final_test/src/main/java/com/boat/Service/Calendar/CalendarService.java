package com.boat.Service.Calendar;

import java.util.List;

import com.boat.domain.Calendar;


public interface CalendarService { 
	
	//이벤트 갯수 
	public int getListcount();

	public int insertcal(Calendar cal);
	//이벤트 불러오기
	//public List<Calendar> getList(String dept);


	//이벤트 불러
	//public List<Calendar> getEvents(String dEPT);

	//dept있을때
	public List<Calendar> getEventsByDept(String DEPT);
	
	//	dept없을때
	public List<Calendar> getAllEvents();

	
	
	

}
