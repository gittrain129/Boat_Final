package com.boat.domain;

import lombok.Data;

@Data
public class Filecomm {

	private String FILE_C_NUM;//시퀀스
	private String FILE_C_ID;//empno
	private String FILE_CONTENT;
	private String FILE_COMMENT_DATE;//2020-12-24 16:08:35
	private int FILE_BO_NUM;//보드넘
	private int FILE_COMMENT_RE_LEV;
	private int FILE_COMMENT_RE_SEQ;
	private int FILE_COMMENT_RE_REF;
	private String PROFILE;
	
//	FILE_COMMENT
//	 FILE_C_NUM     NOT NULL NUMBER
//FILE_C_ID		VARCHAR2(30)
//FILE_CONTENT	VARCHAR2(200)
//FILE_COMMENT_DATE	DATE
//FILE_COMMENT_NUM		NUMBER
//FILE_COMMENT_RE_LEV	NUMBER
//FILE_COMMENT_RE_SEQ	NUMBER(38)
//FILE_COMMENT_RE_REF	 NUMBER(38)
	/*
	create table FILE_COMMENT (
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
