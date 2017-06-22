package com.web.board.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.board.BoardSqlFactory;
import com.web.board.model.TeamInfoDO;

public class TeamInfoDAO {
	
	//전체 리스트
	public List<TeamInfoDO> selectAll(){
		 //SqlSessionFactory 객체로부터 SQL문을 직접 실행 할 수 있는 SqlSession객체를 받아옴
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		List<TeamInfoDO> list = sqlSession.selectList("selectListAllTeam");
		
		sqlSession.close();
		return list;
	}
		
	//1개 리스트
	public TeamInfoDO selectByIndex(int teamIndex){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		TeamInfoDO infoDO = sqlSession.selectOne("selectListOneTeam" , teamIndex);
		
		sqlSession.close();
		return infoDO;
	}
	
	//1개 이미지
	public Map<String, Object> selectImgByIndex(int teamIndex){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		Map<String, Object> infoDO = sqlSession.selectOne("selectImgOneTeam" , teamIndex);
		
		sqlSession.close();
		return infoDO;
	}
		
	//리스트 등록
	public void insert(TeamInfoDO DO){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		sqlSession.insert("insertListTeam", DO);
			
		sqlSession.commit();
		sqlSession.close();
	}
		
	//리스트 수정
	public void update(TeamInfoDO DO){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		sqlSession.update("updateListTeam", DO);
		
		sqlSession.commit();
		sqlSession.close();	
	}
		
	//리스트 삭제
	public void delete(int teamIndex){
		SqlSession sqlSession 
			= BoardSqlFactory.getSqlSessionFactory().openSession();
		sqlSession.delete("deleteListTeam", teamIndex);
			
		sqlSession.commit();
		sqlSession.close();	
	}
	
}
