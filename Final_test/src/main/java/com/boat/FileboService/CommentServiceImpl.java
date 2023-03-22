package com.boat.FileboService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;
import com.boat.domain.Filecomm;
import com.boat.mybatis.mapper.FileComMapper;

@Service
public class CommentServiceImpl implements FileCommentService {
	
	private FileComMapper dao;
	private LogAdvice log;
	
	@Autowired
	public CommentServiceImpl(FileComMapper dao,LogAdvice log) {
		this.dao = dao;
		this.log = log;
	}

	@Override
	public int getListCount(int board_num) {
		log.beforeLog();
		return dao.getListCount(board_num);
	}

	@Override
	public List<Filecomm> getCommentList(int board_num, int page) {
		log.beforeLog();
		int startrow = 1;
		int endrow = page*3;
		
		Map<String,Integer>map = new HashMap<String,Integer>();
		map.put("board_num", board_num);
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getCommentList(map);
	}

	@Override
	public int commentInsert(Filecomm c) {
		return dao.commentInsert(c);
	}

	@Override
	public int commentsDelete(int num) {
		return dao.commentsDelete(num);
	}

	@Override
	public int commentsUpdate(Filecomm co) {
		return dao.commentsUpdate(co);
	}

}
