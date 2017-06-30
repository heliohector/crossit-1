package crossit.teamD.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import crossit.teamD.SqlFactory;
import crossit.teamD.model.UserDO;

public class UserDAO {
	//전체 리스트
		public List<UserDO> selectAll(){
			//SqlSessionFactory 객체로부터 SQL문을 직접 실행 할 수 있는 SqlSession객체를 받아옴
			SqlSession sqlSession 
			= SqlFactory.getSqlSessionFactory().openSession();
			List<UserDO> list = sqlSession.selectList("selectListAllUser");

			sqlSession.close();
			return list;
		}

		//1개 리스트
		public UserDO selectByNum(int urNum){
			SqlSession sqlSession 
			= SqlFactory.getSqlSessionFactory().openSession();
			UserDO urDO = sqlSession.selectOne("selectListOneUser" , urNum);

			sqlSession.close();
			return urDO;
		}

		//리스트 등록
		public void insert(UserDO DO){
			SqlSession sqlSession 
			= SqlFactory.getSqlSessionFactory().openSession();
			sqlSession.insert("insertListUser", DO);

			sqlSession.commit();
			sqlSession.close();
		}

		//리스트 삭제
		public void delete(int urNum){
			SqlSession sqlSession 
			= SqlFactory.getSqlSessionFactory().openSession();
			sqlSession.delete("deleteListUser", urNum);

			sqlSession.commit();
			sqlSession.close();	
		}
}
