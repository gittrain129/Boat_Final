package com.boat.Service.Calendar;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;
import com.boat.domain.Attandance;
import com.boat.mybatis.mapper.AttandanceMapper;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	private AttandanceMapper dao;
	private LogAdvice log;
	
	@Autowired
	public CalendarServiceImpl(AttandanceMapper dao,LogAdvice log) {
		this.dao = dao;
		this.log = log;
	}


	@Override
	public List<Attandance> getAttList() {
		
		
		
		return dao.getAttList();
	}

	
	@Override
	public void AttOn(String on, String empno) {
		HashMap<String,String>map = new HashMap<String,String>();
		map.put("on",on);
		map.put("empno", empno);
		dao.AttOn(on,empno);
		
	}


	

}
