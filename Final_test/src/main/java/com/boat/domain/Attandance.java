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
	private String DEPT;
	private String CONTENT;
	private String ON_TIME;
	private String OFF_TIME;
	private String OUT_TIME;
	private String REG_DATE;
	public String getEMPNO() {
		return EMPNO;
	}
	public void setEMPNO(String eMPNO) {
		EMPNO = eMPNO;
	}
	public String getDEPT() {
		return DEPT;
	}
	public void setDEPT(String dEPT) {
		DEPT = dEPT;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getON_TIME() {
		return ON_TIME;
	}
	public void setON_TIME(String oN_TIME) {
		ON_TIME = oN_TIME;
	}
	public String getOFF_TIME() {
		return OFF_TIME;
	}
	public void setOFF_TIME(String oFF_TIME) {
		OFF_TIME = oFF_TIME;
	}
	public String getOUT_TIME() {
		return OUT_TIME;
	}
	public void setOUT_TIME(String oUT_TIME) {
		OUT_TIME = oUT_TIME;
	}
	public String getREG_DATE() {
		return REG_DATE;
	}
	public void setREG_DATE(String rEG_DATE) {
		REG_DATE = rEG_DATE;
	}
	
}
