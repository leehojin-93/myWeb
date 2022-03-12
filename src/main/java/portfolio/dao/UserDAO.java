package portfolio.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import portfolio.vo.UserVO;

public class UserDAO {
	@Autowired
	private SqlSession sqlSession;

	// 회원가입 inDB
	public int joinUser(UserVO UserVO) {
		int joinUser = sqlSession.insert("user.joinUser", UserVO);

		return joinUser;
	}

	// 로그인 selectUSER_setSESSION
	public UserVO loginSession(UserVO UserVO) {
		UserVO loginSession = sqlSession.selectOne("user.loginSession", UserVO);

		return loginSession;
	}

	// id 중복체크 selectDB
	public int idCheck(String id) {
		int DBid = sqlSession.selectOne("user.idCheck", id);

		return DBid;
	}
}
