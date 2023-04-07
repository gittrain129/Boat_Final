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
	public int getListCount(int FILE_BO_NUM) {
		log.beforeLog();
		return dao.getListCount(FILE_BO_NUM);
	}

	@Override
	public List<Filecomm> getCommentList(int FILE_BO_NUM, int state) {
		
		Map<String,Integer>map = new HashMap<String,Integer>();
		map.put("FILE_BO_NUM", FILE_BO_NUM);
		map.put("state", state);
		List<Filecomm> co =dao.getCommentList(map);
		//System.out.println(co.size()+"sjjjjsjjjjjjj");
		
		return co;
	}

	@Override
	public int commentInsert(Filecomm c) {
		System.out.println(c.toString()+"sjjjjsjjjjjjj");
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
