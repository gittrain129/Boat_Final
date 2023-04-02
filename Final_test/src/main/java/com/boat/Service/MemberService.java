package com.boat.Service;

import java.util.List;
import java.util.Map;

import com.boat.domain.Member;

public interface MemberService {

	//네이버 가입했는지 확인
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);

	//이메일 있으면 해당 이메일로 네이버 가입
	public void setNaverConnection(Map<String, Object> apiJson);

	//네이버 로그인
	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson);

	//사원번호 생성
	public int isEmpno(String select);

	//회원가입 처리
	public int insert(Member member);

	//정보
	public Member member_info(String id);

	//네이버 회원가입 처리
	public int userNaverRegisterPro(Map<String, Object> paramMap);

	//구글 유저 확인
	public Map<String, Object> GoogleConnectionCheck(Map<String, Object> paramMap);

	//구글 로그인
	public Map<String, Object> userGoogleLoginPro(Map<String, Object> paramMap);

	//구글 회원가입
	public int userGoogleRegisterPro(Map<String, Object> paramMap);

	//아이디 찾기
	public List<Member> getidlist(String name, String email);



}
