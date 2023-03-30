package com.boat.domain;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Todo {


	private String EMPNO;
	private String T_CONTENT;
	private String START_DATE;
	private String END_DATE;
	private String REG_DATE;  	
	private String DEPT;
	private String NUM;
	private Member member;
	//private List<Member> member;
	
	
}
