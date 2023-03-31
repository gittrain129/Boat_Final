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
	
	//개인 리스트가져오기(여러날)
	@Override
	public List<Attandance> getAttList(String eMPNO) {
		 return dao.getAttList(eMPNO);
	}



	@Override//(당일)
	public Attandance TodayMyatt(String EMPNO) {
		HashMap<String,String>map = new HashMap<String,String>();
		map.put("EMPNO", EMPNO);
		
		return dao.TodayMyatt(EMPNO);
	}

	@Override
	public void AttOn(String on, String EMPNO,String DEPT) {
		HashMap<String,String>map = new HashMap<String,String>();
		map.put("on",on);
		map.put("EMPNO", EMPNO);
		map.put("DEPT", DEPT);
		
		dao.AttOn(on,EMPNO,DEPT);
		
	}


	@Override
	public void AttOff(String off, String empno) {
		HashMap<String,String>map = new HashMap<String,String>();
		map.put("off",off);
		map.put("empno", empno);
		System.out.println("offupdate param"+off);
		//log.info("offupdate param"+off);
		dao.AttOff(off,empno);
	}


	

	

}
