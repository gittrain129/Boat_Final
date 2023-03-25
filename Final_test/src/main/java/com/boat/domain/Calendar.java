package com.boat.domain;

import lombok.Getter;
import lombok.Setter;

public class Calendar {

	@Getter
	@Setter
	private int schedule_code;
	private String event_name;
	private String start_date;
	private String end_date;
	private String allday;
	private String empno;
	private String color;
	private String dept;

}
