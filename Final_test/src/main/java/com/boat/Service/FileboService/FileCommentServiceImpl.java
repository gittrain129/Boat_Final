package com.boat.Service.FileboService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.aop.LogAdvice;
import com.boat.domain.Filecomm;
import com.boat.mybatis.mapper.FileComMapper;

@Service
public class FileCommentServiceImpl implements FileCommentService {
	
	private FileComMapper dao;
	private LogAdvice log;
	
	@Autowired
	public FileCommentServiceImpl(FileComMapper dao,LogAdvice log) {
		this.dao = dao;
		this.log = log;
	}

	@Override
	public int getListCount(int F_COMMENT_NUM) {
		log.beforeLog();
		return dao.getListCount(F_COMMENT_NUM);
	}

	@Override
	public List<Filecomm> getCommentList(int F_COMMENT_NUM, int state) {
		
		Map<String,Integer>map = new HashMap<String,Integer>();
		map.put("F_COMMENT_NUM", F_COMMENT_NUM);
		map.put("state", state);
		
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
