package com.boat.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttandanceMapper {

	public void AttOn(String on, String empno);

}