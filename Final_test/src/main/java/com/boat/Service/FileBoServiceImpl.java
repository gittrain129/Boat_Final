package com.boat.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.domain.Filebo;
import com.boat.mybatis.mapper.FileboMapper;

@Service
public class FileBoServiceImpl implements FileBoService {

	private FileboMapper dao;
	
	@Autowired
	public FileBoServiceImpl(FileboMapper dao) {
		this.dao = dao;
	}
	
	
	@Override
	public int getListCount() {
		System.out.println("dao getlistcount 전");
		return dao.getListCount();     
	}

	@Override
	public List<Filebo> getBoardList(int page, int limit) {
		
		HashMap<String,Integer>map = new HashMap<String,Integer>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("start",startrow);
		map.put("end", endrow);
		
		return dao.getBoardList(map);
	}


	@Override
	public void insertBoard(Filebo board) {
		dao.insertBoard(board);
	}
	
	@Override
	public int setReadCountUpdate(int num) {
		return dao.setReadCountUpdate(num);
	}

	@Override
	public boolean isBoardWriter(int num, String pass) {
		HashMap<String, Object>map = new HashMap<String,Object>();
		map.put("num", num);
		map.put("pass", pass);
		Filebo result = dao.isBoardWriter(map);
		if(result==null)
			return false;
		else
			return true;
		
	}
	
	@Override
	public int boardModify(Filebo modifyboard) {
		return dao.boardModify(modifyboard);
	}
	@Override
	public Filebo getDetail(int num) {
		
		return dao.getDetail(num); 
	}

	@Override
	public int boardReply(Filebo board) {
		boardReplyUpdate(board);
		board.setFILE_RE_LEV(board.getFILE_RE_LEV()+1);
		board.setFILE_RE_SEQ(board.getFILE_RE_SEQ()+1);
		return dao.boardReply(board);
	}

	

	public int boardReplyUpdate(Filebo board) {

		return dao.boardReplyUpdate(board);		
	}


	@Override
	public int boardDelete(int num) {
		int result = 0;
		Filebo board = dao.getDetail(num);
		if(board !=null) {
			result = dao.boardDelete(board);
		}
		
		return result;
	}


	@Override
	public List<String> getDeleteFileList() {
		return dao.getDeleteFileList();
	}


	@Override
	public void deleteFileList(String filename) {
		dao.deleteFileList(filename);
	}



}
