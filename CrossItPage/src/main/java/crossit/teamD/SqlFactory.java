package crossit.teamD;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlFactory {
private static SqlSessionFactory sqlSessionFactory = null;
	
	static {
        //XML 설정 파일을  읽음
        try {
        	Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
            
        } catch (IOException e){
            e.printStackTrace();
        }
    }
	
	//sqlSessionFactory 객체 가져옴
	public static SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
}
