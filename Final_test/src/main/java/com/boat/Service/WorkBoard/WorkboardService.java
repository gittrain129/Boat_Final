package com.boat.Service.WorkBoard;

import java.util.List;

import com.boat.domain.Workboard;

public interface WorkboardService{
	

		
		//댓글 목록 가져오기
		public List<Workboard> getCommentList(int page);
		
		//댓글 등록하기
		public int commentsInsert(Workboard c);
		
		//댓글 삭제
		public int commentsDelete(int num);
		
		//댓글 수정
		public int commentsUpdate(Workboard co);

}
