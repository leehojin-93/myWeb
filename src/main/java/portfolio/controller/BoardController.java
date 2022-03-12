package portfolio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import portfolio.service.BoardService;
import portfolio.vo.BoardVO;

@Controller
@RequestMapping(value = "/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	// 게시판 페이지
	@RequestMapping(value = "/list")
	public String board(Model model) {
		List<BoardVO> boardList = boardService.boardList();
		
		model.addAttribute("boardList", boardList);
		
		return "/board/board";
	}
	
	// 게시글 작성 페이지
	@RequestMapping(value = "/boardWriteForm")
	public String boardWriteForm() {
		return "/board/boardWriteForm";
	}
	
	// 게시글 작성 inDB
	@RequestMapping(value = "/boardWrite")
	public String boardWrite(@ModelAttribute BoardVO boardVo, @RequestParam("userNo") int writeUserNo) {
		boardVo.setWriteUserNo(writeUserNo);
		
		int boardWrite = boardService.boardWrite(boardVo);
		
		return "redirect:/main/board";
	}
	
}
