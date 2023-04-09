package com.boat.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.ChatMessage;
import com.boat.domain.ChatRoom;

@Mapper
public interface ChatMapper {
	
	//방 번호를 선택하는 메소드
	public ChatRoom selectChatRoom(String roomId);
	
	//채팅 메세지 DB 저장
	public int insertMessage(ChatMessage chatMessage);
}
