package com.boat.Service.WorkBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;
import com.boat.domain.Workboard;
import com.boat.mybatis.mapper.WorkboardMapper;

@Service
public class WorkboardServiceImpl implements WorkboardService{
	
	private  WorkboardMapper dao;
	private LogAdvice log;
	
	@Autowired
	public  WorkboardServiceImpl( WorkboardMapper dao, LogAdvice log) {
		this.dao = dao;
		this.log = log;
	}

	
		
	@Override
	public int getListCount(int board_num) {
		log.beforeLog();
		return dao.getListCount(board_num);
	}
	
	
	

	@Override
	public List<Workboard> getCommentList(int board_num, int page) {
		int startrow = 1;
		int endrow = page * 3;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("board_num", board_num);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getCommentList(map);
	}

	
	
	@Override
	public int commentsInsert(Workboard c) {
		return dao.commentsInsert(c);
	}

	
	@Override
	public int commentsDelete(int num) {
		return dao.commentsDelete(num);
	}

	
	@Override
	public int commentsUpdate(Workboard co) {
		return dao.commentsUpdate(co);
	}

}
