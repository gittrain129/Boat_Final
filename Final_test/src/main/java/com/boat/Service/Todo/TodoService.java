package com.boat.Service.Todo;

import java.util.List;

import com.boat.domain.Todo;


public interface TodoService {

	void insertTodo(Todo todo);

	List<Todo> mytodolist(String empno);

	String getDept(String empno);

	List<Todo> deptList(String dept,String empno);

	void Todoupdate(String num, String t_CONTENT, String eND_DATE); 
	
	
	
	
	

}
