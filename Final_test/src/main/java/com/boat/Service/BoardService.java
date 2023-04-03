package com.boat.Service;

import java.util.List;

import com.boat.domain.Board;



public interface BoardService {

	 public int getListCount();
	   
	   public List<Board> getBoardList(int page, int limit);
	   
	   public Board getDetail(int num);
	   
	   public int boardReply(Board board);
	   
	   public int boardModify(Board modifyboard);
	   
	   public int boardDelete(int num);
	   
	   public int setReadCountUpdate(int num);
	   
	   public boolean isBoardWriter(int num,String pass);
	   
	   public void insertBoard(Board board);

	   public int boardReplyUpdate(Board board);

	
	public void deleteFileList(String filename);
	
	public List<String> getDeleteFileList();
}