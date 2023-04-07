package com.boat.domain;

import lombok.Data;

@Data
public class Filecomm {

	private String F_C_NUM;
	private String F_C_ID;
	private String F_CONTENT;
	private String F_COMMENT_DATE;//2020-12-24 16:08:35
	private int F_BO_NUM;
	private int F_COMMENT_RE_LEV;
	private int F_COMMENT_RE_SEQ;
	private int F_COMMENT_RE_REF;
	
//	
//	 F_C_NUM     NOT NULL NUMBER
//F_C_ID		VARCHAR2(30)
//F_CONTENT	VARCHAR2(200)
//F_COMMENT_DATE	DATE
//F_COMMENT_NUM		NUMBER
//F_COMMENT_RE_LEV	NUMBER
//F_COMMENT_RE_SEQ	NUMBER(38)
//F_COMMENT_RE_REF	 NUMBER(38)


	
	public int getF_COMMENT_RE_LEV() {
		return F_COMMENT_RE_LEV;
	}
	public void setF_COMMENT_RE_LEV(int f_COMMENT_RE_LEV) {
		F_COMMENT_RE_LEV = f_COMMENT_RE_LEV;
	}
	public int getF_COMMENT_RE_SEQ() {
		return F_COMMENT_RE_SEQ;
	}
	public void setF_COMMENT_RE_SEQ(int f_COMMENT_RE_SEQ) {
		F_COMMENT_RE_SEQ = f_COMMENT_RE_SEQ;
	}
	public int getF_COMMENT_RE_REF() {
		return F_COMMENT_RE_REF;
	}
	public void setF_COMMENT_RE_REF(int f_COMMENT_RE_REF) {
		F_COMMENT_RE_REF = f_COMMENT_RE_REF;
	}



	
	
	
	public String getF_C_NUM() {
		return F_C_NUM;
	}
	public void setF_C_NUM(String f_C_NUM) {
		F_C_NUM = f_C_NUM;
	}
	public String getF_C_ID() {
		return F_C_ID;
	}
	public void setF_C_ID(String f_C_ID) {
		F_C_ID = f_C_ID;
	}
	public String getF_CONTENT() {
		return F_CONTENT;
	}
	public void setF_CONTENT(String f_CONTENT) {
		F_CONTENT = f_CONTENT;
	}
	public String getF_COMMENT_DATE() {
		return F_COMMENT_DATE;
	}
	public void setF_COMMENT_DATE(String f_COMMENT_DATE) {
		F_COMMENT_DATE = f_COMMENT_DATE;
	}
	public int getF_BO_NUM() {
		return F_BO_NUM;
	}
	public void setF_BO_NUM(int f_BO_NUM) {
		F_BO_NUM = f_BO_NUM;
	}

	/*
	create table comm (
			num number primary key,
			id varchar2(30) references member(id),
			content varchar2(200),
			reg_date date,
			comment_board_num number references board(board_num) on delete cascade,--comm테이블이 참조하는 보드 글번호가 삭제되면 같이 삭제됩니다. 
			comment_re_lev number(1) check(comment_re_lev in(0,1,2)),
			comment_re_ref number  --원문은 자신 글번호, 답글이면 원문 글번호
			);
	*/
}
