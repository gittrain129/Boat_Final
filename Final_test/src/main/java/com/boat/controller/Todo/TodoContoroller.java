package com.boat.controller.Todo;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.boat.Service.Todo.TodoService;
import com.boat.domain.Todo;

@Controller
@RequestMapping(value="/Todo")//http://localhost:8088/myhome4/board/로 시작하는 주소 매핑
public class TodoContoroller {

	private static final Logger logger =
			  LoggerFactory.getLogger(TodoContoroller.class);

	
	private TodoService todoService;
	
	public TodoContoroller(TodoService todoService) {
		this.todoService = todoService;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView Todomain(Principal principal,
							ModelAndView mv) {
		String empno = principal.getName();
		//String empno = "2310001";
		
		
		String dept = todoService.getDept(empno);
		logger.info("로그인한 empno : "+empno);
		logger.info("로그인한 dept : "+dept);
		
		//select * from todolist where empno= '로그인한사람;
		//1. select * from Todo where empno = #{empno}
		List<Todo> Mytodolist = todoService.mytodolist(empno);
		
		logger.info("todo :	"+ Mytodolist );
		
		
		
		//select * from TODOLIST where dept = #{dept}
		// order by empno
		List<Todo> mydeptTodolist = todoService.deptList(dept);
		
		//3.
		//select key
		//select * from TODOLIST where empno = #{empno}
		
		
		
		mv.setViewName("Todo/Todonew");
		
		//Mytodolist
		mv.addObject("MyTodo",Mytodolist);
		//deptList
		//mv.addObject("MydeptList",mydeptTodolist);
		
	return mv;

	}
	
	@PostMapping(value="/add") 
	  public String add( Todo todo,
			  HttpServletRequest request) throws Exception {
				
		
		
		logger.info("왜또 널이뜨니"+todo.toString());//select ket dept?
		todoService.insertTodo(todo);
		
		//저장 성공하면 Todo/list
		  return  "redirect:list"; 
		
	}
	
}//클래스 end
