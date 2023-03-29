package com.boat.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.Filebo;



@Mapper
public interface FileboMapper {

	//글의 갯수 구하기 
		public int getListCount();
		
		//글 목록 보기
		public List<Filebo> getBoardList(HashMap<String,Integer>map);
		
		//글 내용 보기   
		public Filebo getDetail(int num);
		
		//글 답변
		public int boardReply(Filebo board);
		
		//글 수정
		public int boardModify(Filebo modifyboard);
		
		//글 삭제
		public int boardDelete(Filebo board);
		
		//조회수 업데이트
		public int setReadCountUpdate(int num);
		
		//글쓴이인지 확인
		public Filebo isBoardWriter(HashMap<String,Object>map);
		
		//글등록하기
		public void insertBoard(Filebo board);
		
		//FileBOARD_RE_SEQ값 수정
		public int boardReplyUpdate(Filebo board);
		
		public List<String> getDeleteFileList();
		
		public void deleteFileList(String filename);
	


		
}
