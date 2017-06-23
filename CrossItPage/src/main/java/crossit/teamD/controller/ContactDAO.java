package crossit.teamD.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import crossit.teamD.SqlFactory;
import crossit.teamD.model.ContactDO;

public class ContactDAO {
	
	//전체 리스트
	public List<ContactDO> selectAll(){
		//SqlSessionFactory 객체로부터 SQL문을 직접 실행 할 수 있는 SqlSession객체를 받아옴
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		List<ContactDO> list = sqlSession.selectList("selectListAllContact");

		sqlSession.close();
		return list;
	}

	//1개 리스트
	public ContactDO selectByNum(int ctNum){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		ContactDO ctDO = sqlSession.selectOne("selectListOneContact" , ctNum);

		sqlSession.close();
		return ctDO;
	}

	//리스트 등록
	public void insert(ContactDO DO){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		sqlSession.insert("insertListContact", DO);

		sqlSession.commit();
		sqlSession.close();
	}

	//리스트 수정
	public void update(ContactDO DO){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		sqlSession.update("updateListContact", DO);

		sqlSession.commit();
		sqlSession.close();	
	}

	//리스트 삭제
	public void delete(int ctNum){
		SqlSession sqlSession 
		= SqlFactory.getSqlSessionFactory().openSession();
		sqlSession.delete("deleteListContact", ctNum);

		sqlSession.commit();
		sqlSession.close();	
	}
}
