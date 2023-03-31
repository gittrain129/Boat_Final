package com.boat.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data

public class Filebo {
	
	private int FILE_NUM ;
	private String FILE_NAME;  
	private String FILE_PASS; 
	private String FILE_SUBJECT;	
	private String FILE_CONTENT;
	private String FILE_FILE;
	private String FILE_FILE2;
	
	private int FILE_RE_REF;
	private int FILE_RE_LEV;
	private int FILE_RE_SEQ;
	private int FILE_READCOUNT;
	private String FILE_DATE;
	private int CNT;
	private String DEPT;
	private String FIlE_EMPNO;
	
	private MultipartFile uploadfile;
	private MultipartFile uploadfile2;
	
	private String FILE_ORIGINAL;//첨부될파일의이름
	private String FILE_ORIGINAL2;//첨부될파일의이름
	
	
	

	
}