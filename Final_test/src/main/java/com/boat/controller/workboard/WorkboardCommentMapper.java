package com.boat.controller.workboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface  WorkboardCommentMapper {

			//글의 갯수 구하기
			public int getListCount(int board_num);
			
			//댓글 목록 가져오기
			public List<WorkboardComment> getCommentList(Map<String, Integer> map);
			
			//댓글 등록하기
			public int commentsInsert(WorkboardComment c);
			
			//댓글 삭제
			public int commentsDelete(int num);
			
			//댓글 수정
			public int commentsUpdate(WorkboardComment co);

}
