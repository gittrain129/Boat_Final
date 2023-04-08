package com.boat.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.domain.Board;
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

	//아이디 찾기
	@Override
	public List<Member> getidlist(String name, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		
		return dao.getidlist(map);
	}

	//비번 설정하려고 찾기
	@Override
	public Member getPassword(String name, String empno, String email) {
		return dao.getPassword(name, empno, email);
	}

	//비번 재설정
	@Override
	public int pwdupdate(String empno, String password, String encPassword) {
		return dao.pwdupdate(empno, password, encPassword);
	}

	//회원 수정
	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	//회원 탈퇴
	@Override
	public int delete(String empno) {
		return dao.delete(empno);
	}

	//내 글 갯수
	@Override
	public int getMyListCount(String empno) {
		return dao.getMyListCount(empno);
	}

	//내 글 목록
	@Override
	public List<Board> getMyBoardList(int page, int limit, String empno) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int startrow = (page-1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("empno", empno);
		
		System.out.println("start"+startrow);
		System.out.println("end"+endrow);
		System.out.println("empno"+empno);
		
		return dao.getMyBoardList(map);
	}

	//채팅 회원 목록
	@Override
	public List<Member> getMemberList(String id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("empno", id);
		return dao.getMemberList(map);
	}

	
	
}
