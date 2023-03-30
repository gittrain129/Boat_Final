package com.boat.domain;

import lombok.Data;

@Data
public class Attandance {

	//MEMBER_ATTENDANCE
//	1	NO	아이디
//	2	EMPNO	사번
//	3	ON_TIME	출근/복귀 시간
//	4	OFF_TIME	퇴근시간
//	5	OUT_TIME	외출시간
	
	private String EMPNO;
	private String CONTENT;
	private String ON_TIME;
	private String OFF_TIME;
	private String OUT_TIME;
	private String REG_DATE;
	
}
