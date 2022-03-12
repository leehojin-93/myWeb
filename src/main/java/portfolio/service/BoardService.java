package portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portfolio.dao.BoardDAO;
import portfolio.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDao;
	
	// 게시판 리스트 selectBOARD
	public List<BoardVO> boardList() {
		List<BoardVO> boardList = boardDao.boardList();
		
		return boardList;
	}
	
	// 게시판 등록 inBOARD
	public int boardWrite(BoardVO boardVo) {
		int boardWrite = boardDao.boardWrite(boardVo);
		
		return boardWrite;
	}
}
