package com.boat.Service.Calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;
import com.boat.domain.Calendar;
import com.boat.mybatis.mapper.CalendarMapper;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	private CalendarMapper dao;
	
	@Autowired
	public CalendarServiceImpl(CalendarMapper dao) {
		this.dao = dao;
	}

	//캘린더 일정삽입
	@Override
	public int insertcal(Calendar cal) {
		return dao.calInsert(cal);
		
	}

	@Override
	public int getListcount() {
		// TODO Auto-generated method stub
		return 0;
	}


//	@Override
//	public List<Calendar> getList(String dept) {
//	Map<String,String>map = new HashMap<String,String>();
//
//		map.put("dept",dept);
//		
//		return dao.getCalList(dept);
//		
//	}

	public List<Calendar> getEvents(String dEPT) {
		
		return dao.getEvents(dEPT);
	}

	
	@Override
	public List<Calendar> getEventsByDept(String DEPT) {
		return dao.getEventsByDept(DEPT);
	}

	@Override
	public List<Calendar> getAllEvents() {
		return dao.getAllEvents();
    }





	

}
