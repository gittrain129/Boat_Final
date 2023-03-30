package com.boat.Service.Attandance;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;
import com.boat.domain.Attandance;
import com.boat.mybatis.mapper.AttandanceMapper;

@Service
public class AttandanceServiceImpl implements AttandanceService {
	
	private AttandanceMapper dao;
	private LogAdvice log;
	
	@Autowired
	public AttandanceServiceImpl(AttandanceMapper dao,LogAdvice log) {
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


	@Override
	public void AttOff(String off, String empno) {
		HashMap<String,String>map = new HashMap<String,String>();
		map.put("off",off);
		map.put("empno", empno);
		
		dao.AttOff(off,empno);
	}


	

}
