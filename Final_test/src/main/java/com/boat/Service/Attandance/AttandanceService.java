package com.boat.Service.Attandance;

import org.apache.ibatis.annotations.Mapper;


public interface AttandanceService { 
	
	//출근 시간 저장
	public void AttOn(String on, String empno);

	
	
	

}
