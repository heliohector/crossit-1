package com.web.board.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.board.BoardSqlFactory;
import com.web.board.model.BoardInfoDO;

public class BoardInfoDAO {
	
	//전체 리스트
	public List<BoardInfoDO> selectAll(){
		 //SqlSessionFactory 객체로부터 SQL문을 직접 실행 할 수 있는 SqlSession객체를 받아옴
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		List<BoardInfoDO> list = sqlSession.selectList("selectListAll");
		
		sqlSession.close();
		return list;
	}
	
	//1개 리스트
	public BoardInfoDO selectByIndex(int boardIndex){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		BoardInfoDO infoDO = sqlSession.selectOne("selectListOne" , boardIndex);
		
		sqlSession.close();
		return infoDO;
	}
	
	//리스트 등록
	public void insert(BoardInfoDO DO){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		sqlSession.insert("insertList", DO);
		
		sqlSession.commit();
		sqlSession.close();
	}
	
	//리스트 수정
	public void update(BoardInfoDO DO){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		sqlSession.update("updateList", DO);
		
		sqlSession.commit();
		sqlSession.close();	
	}
	
	//리스트 삭제
	public void delete(int boardIndex){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		sqlSession.delete("deleteList", boardIndex);
			
		sqlSession.commit();
		sqlSession.close();	
	}
	
}
