package com.boat.Service.Attandance;

import java.util.List;

import com.boat.domain.Attandance;


public interface AttandanceService { 
	
	//출근 시간 저장
	public void AttOn(String on, String empno,String dept);

	//출퇴근 리스트 불러오기
	public List<Attandance> getAttList();
	
	//개인출퇴근 리스트 불러오기
	public List<Attandance> getAttList(String eMPNO);


	public void AttOff(String OFF_TIME, String EMPNO);

	//오늘 출근기록_EMPNO받아서 넣기!!
	public Attandance getTodayMyatt(String empno);

	

	
	
	

}
