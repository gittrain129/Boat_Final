package com.boat.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.domain.Member;
import com.boat.mybatis.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberMapper dao;
	
	@Autowired
	public MemberServiceImpl(MemberMapper dao) {
		this.dao = dao;
	}

	@Override
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson) {
		return dao.naverConnectionCheck(apiJson);
	}

	@Override
	public void setNaverConnection(Map<String, Object> apiJson) {
		dao.setNaverConnection(apiJson);
	}

	@Override
	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson) {
		return dao.userNaverLoginPro(apiJson);
	}

	//사원번호 생성
	@Override
	public int isEmpno(String select) {
		
		System.out.println("selectempno"+select);
		
		Member member = dao.isEmpno(select);
		int empno;
		if(member != null && !(member.getEMPNO().equals("ADMIN")))
			empno = Integer.parseInt(member.getEMPNO());
		else
			empno=0;
		
		return empno;
	}

	//회원가입 처리
	@Override
	public int insert(Member member) {
		return dao.insert(member);
	}

	//정보
	@Override
	public Member member_info(String id) {
		return dao.isId(id);
	}

	@Override
	public int userNaverRegisterPro(Map<String, Object> paramMap) {
		return dao.userNaverRegisterPro(paramMap);
	}

	@Override
	public Map<String, Object> GoogleConnectionCheck(Map<String, Object> paramMap) {
		return dao.GoogleConnectionCheck(paramMap);
	}

	@Override
	public Map<String, Object> userGoogleLoginPro(Map<String, Object> paramMap) {
		return dao.userGoogleLoginPro(paramMap);
	}

	//구글 회원가입
	@Override
	public int userGoogleRegisterPro(Map<String, Object> paramMap) {
		return dao.userGoogleRegisterPro(paramMap);
	}


	
	
}
