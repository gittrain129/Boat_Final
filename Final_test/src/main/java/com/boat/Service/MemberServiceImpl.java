package com.boat.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.domain.Member;
import com.boat.mybatis.mapper.MemberMapper;

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
		String selectempno = "홍보팀";
		if(select.equals("2"))
			selectempno = "개발팀";
		if(select.equals("3"))
			selectempno = "인사팀";
		if(select.equals("4"))
			selectempno = "기획팀";
		if(select.equals("5"))
			selectempno = "영업팀";
		
		Member member = dao.isEmpno(selectempno);
		int empno;
		if(member == null)
			empno = 0;
		else
			empno = Integer.parseInt(member.getEMPNO());
		
		return empno;
	}

	
}
