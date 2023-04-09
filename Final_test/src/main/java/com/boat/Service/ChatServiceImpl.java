package com.boat.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.domain.Board;
import com.boat.domain.ChatMessage;
import com.boat.domain.ChatRoom;
import com.boat.domain.Member;
import com.boat.mybatis.mapper.MemberMapper;

@Service
public class ChatServiceImpl implements ChatService {

	//방 번호를 선택하는 메소드
	@Override
	public ChatRoom selectChatRoom(String roomId) {
		// TODO Auto-generated method stub
		return null;
	}

	//채팅 메세지 DB 저장
	@Override
	public int insertMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
