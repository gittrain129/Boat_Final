package com.boat.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.Todo;

@Mapper
public interface TodoMapper {

	void Todoinsert(Todo todo);

	List<Todo> myTodolist(String empno);

	String getDept(String empno);

	List<Todo> myDeptTodo(String dept);

}
