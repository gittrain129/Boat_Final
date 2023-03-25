package com.boat.domain;

import lombok.Data;

@Data
public class Filecomm {

	private String F_C_NUM;
	private String F_C_ID;
	private String F_CONTENT;
	private String F_COMMENT_DATE;//2020-12-24 16:08:35
	private int F_BO_NUM;
	
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
