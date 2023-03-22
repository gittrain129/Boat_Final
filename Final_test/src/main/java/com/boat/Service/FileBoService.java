package com.boat.Service;

import java.util.List;

import com.boat.domain.Filebo;

public interface FileBoService { 

	//글의 갯수 구하기 
	public int getListCount();
	
	//글 목록 보기
	public List<Filebo> getBoardList(int page,int limit);
	
	//글 내용 보기   
	public Filebo getDetail(int num);
	
	//글 답변
	public int boardReply(Filebo board);
	
	//글 수정
	public int boardModify(Filebo modifyboard);
	
	//글 삭제
	public int boardDelete(int num);
	
	//조회수 업데이트
	public int setReadCountUpdate(int num);
	
	//글쓴이인지 확인
	public boolean isBoardWriter(int num, String pass);
	
	//글등록하기
	public void insertBoard(Filebo board);
	
	//BOARD_RE_SEQ값 수정
	public int boardReplyUpdate(Filebo board);

	public List<String> getDeleteFileList();

	public void deleteFileList(String filename);
}