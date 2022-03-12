package portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portfolio.dao.UserDAO;
import portfolio.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO userDao;

	// 회원가입 inDB
	public int joinUser(UserVO userVo) {
		int joinUser = userDao.joinUser(userVo);
		
		return joinUser;
	}
	
	// 로그인 selectUSER_setSESSION
	public UserVO loginSession(UserVO userVo) {
		UserVO loginSession = userDao.loginSession(userVo);
		
		return loginSession;
	}
	
	// id 중복체크 selectDB
	public int idCheck(String id) {
		int DBid = userDao.idCheck(id);
		
		return DBid;
	}

}
