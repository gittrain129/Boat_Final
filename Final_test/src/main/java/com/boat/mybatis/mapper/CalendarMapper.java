package com.boat.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.Calendar;

@Mapper
public interface CalendarMapper {

	List<Calendar> getCalList(String dept);

	int calInsert(Calendar cal);




}
