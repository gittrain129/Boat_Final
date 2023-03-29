package com.boat.Service.Attandance;

import java.util.List;

import com.boat.domain.Attandance;


public interface AttandanceService { 
	
	//출근 시간 저장
	public void AttOn(String on, String empno);

	//출퇴근 리스트 불러오기
	public List<Attandance> getAttList();

	public void AttOff(String off, String empno);

	
	
	

}
