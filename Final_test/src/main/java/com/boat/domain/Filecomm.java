package com.boat.domain;

import lombok.Data;

@Data
public class Filecomm {

	private String F_C_NUM;
	private String F_C_ID;
	private String F_CONTENT;
	private String F_COMMENT_DATE;//2020-12-24 16:08:35
	private int F_BO_NUM;
	
	
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
	
	
}
