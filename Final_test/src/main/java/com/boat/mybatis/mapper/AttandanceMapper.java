package com.boat.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.Attandance;

@Mapper
public interface AttandanceMapper {

	//출근버튼
	public void AttOn(String on, String empno);

	//출퇴근 리스트 가져오기 
	public List<Attandance> getAttList();

	public void AttOff(String off, String empno);

	//오늘 출근기록
	//EMPNO받아서 넣기!!
	//public Attandance TodayMyatt(EMPNO);
	public Attandance TodayMyatt();


}
