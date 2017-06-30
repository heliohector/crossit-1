package crossit.teamD.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import crossit.teamD.SqlFactory;
import crossit.teamD.model.AttendanceDO;

public class AttendanceDAO {
	//전체 리스트
	public List<AttendanceDO> selectAll(){
		//SqlSessionFactory 객체로부터 SQL문을 직접 실행 할 수 있는 SqlSession객체를 받아옴
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		List<AttendanceDO> list = sqlSession.selectList("selectListAllAttendance");

		sqlSession.close();
		return list;
	}

	//1개 리스트
	public AttendanceDO selectByNum(int atNum){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		AttendanceDO atDO = sqlSession.selectOne("selectListOneAttendance" , atNum);

		sqlSession.close();
		return atDO;
	}

	//기수 기준으로 목록 수 조회
	public int countByTerm(int atUrTerm){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		int count = sqlSession.selectOne("countByTermAttendance" , atUrTerm);

		sqlSession.close();
		return count;
	}
	
	//기수 기준으로 출결번호 조회 
	public List<Integer> selectByTerm(int atUrTerm){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		List<Integer> list = sqlSession.selectList("selectByTermAttendance", atUrTerm);

		sqlSession.close();
		return list;
	}
	
	//리스트 등록
	public void insert(AttendanceDO DO){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		sqlSession.insert("insertListAttendance", DO);

		sqlSession.commit();
		sqlSession.close();
	}

	//리스트 수정
	public void update(AttendanceDO DO){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		sqlSession.update("updateListAttendance", DO);

		sqlSession.commit();
		sqlSession.close();	
	}
	
	//리스트 삭제
	public void delete(int atNum){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		sqlSession.delete("deleteListAttendance", atNum);

		sqlSession.commit();
		sqlSession.close();	
	}
}
