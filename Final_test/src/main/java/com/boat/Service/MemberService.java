package com.boat.Service;

import java.util.Map;

public interface MemberService {

	//네이버 가입했는지 확인
	public Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);

	public void setNaverConnection(Map<String, Object> apiJson);

	//네이버 로그인
	public Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson);


}
