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


}
