package portfolio.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import portfolio.service.UserService;
import portfolio.vo.UserVO;

@Controller
@RequestMapping(value = "/user", method = {RequestMethod.GET, RequestMethod.POST})
public class UserController {
	@Autowired
	private UserService userService;
	
	// 회원가입 페이지
	@RequestMapping(value = "/joinForm")
	public String joinForm() {
		return "/user/joinForm";
	}
	
	// id 중복체크 selectDB
	@ResponseBody
	@RequestMapping(value = "/idCheck")
	public int idCheck(@RequestParam("id") String id) {
		int DBid = userService.idCheck(id);
		
		return DBid;
	}
	
	// 회원가입 inDB
	@RequestMapping(value = "/joinUser")
	public String join(@ModelAttribute UserVO userVo) {
		System.out.println(userVo);
//			int joinUser = userService.joinUser(userVo);
//			
//			return "/user/loginForm";
		return "";
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/loginForm")
	public String loginForm() {
		return "/user/loginForm";
	}
	
	// 로그인 selectUSER_setSESSION
	@ResponseBody
	@RequestMapping(value = "/login")
	public UserVO login(@ModelAttribute UserVO userVo, HttpSession session) {
		UserVO loginSession = userService.loginSession(userVo);
			if (loginSession != null)
			session.setAttribute("loginSession", loginSession);

			return loginSession;
	}
	
	// 로그아웃 removeSESSION
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginSession");
		session.invalidate();
		
		return "/user/loginForm";
	}

}
