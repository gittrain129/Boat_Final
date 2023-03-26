package com.boat.Service.Calendar;

import java.util.List;

import com.boat.domain.Calendar;


public interface CalendarService { 
	
	//이벤트 갯수 
	public int getListcount();

	//이벤트 불러오기
	public List<Calendar> getList(String dept);

	public int insertcal(Calendar cal);

	
	
	

}
