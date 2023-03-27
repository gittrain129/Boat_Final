package com.boat.Service.Todo;

import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;
import com.boat.domain.Todo;
import com.boat.mybatis.mapper.TodoMapper;

@Service
public class TodoServiceImpl implements TodoService {
	
	private TodoMapper dao;
	private LogAdvice log;
	
	public TodoServiceImpl(TodoMapper dao) {
		this.dao=dao;
	}
	
	@Override
	public void insertTodo(Todo todo) {
		
		dao.Todoinsert(todo);
		
	}
	
	


	

}
