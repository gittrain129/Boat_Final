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
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
