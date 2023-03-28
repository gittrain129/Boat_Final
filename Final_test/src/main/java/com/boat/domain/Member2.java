package com.boat.domain;
//지현 작업중...
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Member2 {
	private String EMPNO;
	private String DEPT;
	private String JOB;
	private String PASSWORD;
	private String NAME;
	private String EMAIL;
	
	private MultipartFile uploadfile;
	
	private String PROFILE_FILE;
	private String PROFILE_IMG;
	private String REGISTER_DATE;
	private String AUTH="ROLE_MEMBER";
	private String NAVERLOGIN;
	private List<Todo> todo;
	
	
	
}
