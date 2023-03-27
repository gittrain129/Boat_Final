package com.boat.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.Todo;

@Mapper
public interface TodoMapper {

	void Todoinsert(Todo todo);

	Todo myTodolist(String empno);

}
