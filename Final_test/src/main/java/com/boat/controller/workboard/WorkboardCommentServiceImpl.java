package com.boat.controller.workboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;

@Service
public class WorkboardCommentServiceImpl implements WorkboardCommentService{
	
	private  WorkboardCommentMapper dao;
	private LogAdvice log;
	
	@Autowired
	public  WorkboardCommentServiceImpl( WorkboardCommentMapper dao, LogAdvice log) {
		this.dao = dao;
		this.log = log;
	}

	
		
	@Override
	public int getListCount(int board_num) {
		log.beforeLog();
		return dao.getListCount(board_num);
	}
	
	
	

	@Override
	public List<WorkboardComment> getCommentList(int board_num, int page) {
		int startrow = 1;
		int endrow = page * 3;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("board_num", board_num);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getCommentList(map);
	}

	
	
	@Override
	public int commentsInsert(WorkboardComment c) {
		return dao.commentsInsert(c);
	}

	
	@Override
	public int commentsDelete(int num) {
		return dao.commentsDelete(num);
	}

	
	@Override
	public int commentsUpdate(WorkboardComment co) {
		return dao.commentsUpdate(co);
	}

}
