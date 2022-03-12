package portfolio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
public class PortfolioController {
	
	// 메인 페이지
	@RequestMapping(value = "/home")
	public String main() {
		return "/main/home";
	}
	
}
