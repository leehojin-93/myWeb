package portfolio.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import portfolio.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입 inDB
	public int joinUser(UserVO userVo) {
		int joinUser = sqlSession.insert("user.joinUser", userVo);
		
		return joinUser;
	}
	
	// 로그인 selectUSER_setSESSION
	public UserVO loginSession(UserVO userVo) {
		UserVO loginSession = sqlSession.selectOne("user.loginSession", userVo);
		
		return loginSession;
	}
	
	// id 중복체크 selectDB
	public int idCheck(String id) {
		int DBid = sqlSession.selectOne("user.idCheck", id);
		
		return DBid;
	}

}
