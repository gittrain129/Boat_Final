package com.boat.domain;

public class Attandance {

	//MEMBER_ATTENDANCE
//	1	NO	아이디
//	2	EMPNO	사번
//	3	ON_TIME	출근/복귀 시간
//	4	OFF_TIME	퇴근시간
//	5	OUT_TIME	외출시간
	
	private String empno;
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getON_TIME() {
		return ON_TIME;
	}
	public void setON_TIME(String oN_TIME) {
		ON_TIME = oN_TIME;
	}
	private String ON_TIME;
}
