package com.boat.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.Calendar;

@Mapper
public interface CalendarMapper {

	//삭제예정
	List<Calendar> getCalList(String dept);

	int calInsert(Calendar cal);

	List<Calendar> getEventsByDept(String DEPT);

	List<Calendar> getAllEvents();




}
