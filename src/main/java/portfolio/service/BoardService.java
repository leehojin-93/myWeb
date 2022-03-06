package portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portfolio.dao.BoardDao;
import portfolio.vo.BoardVo;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	
	// 게시판 리스트 selectBOARD
	public List<BoardVo> boardList() {
		List<BoardVo> boardList = boardDao.boardList();
		
		return boardList;
	}
	
	// 게시판 등록 inBOARD
	public int boardWrite(BoardVo boardVo) {
		int boardWrite = boardDao.boardWrite(boardVo);
		
		return boardWrite;
	}
}
