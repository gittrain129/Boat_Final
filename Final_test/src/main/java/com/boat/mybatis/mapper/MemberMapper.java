package com.boat.mybatis.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.Member;

@Mapper
public interface MemberMapper {
	
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);

	public void setNaverConnection(Map<String, Object> apiJson);

	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson);
	
	//사원번호 생성
	public Member isEmpno(String select);
	
	//회원가입 처리
	public int insert(Member m);

	public Member isId(String empno);
	
}
