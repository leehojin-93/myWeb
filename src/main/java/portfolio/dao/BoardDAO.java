package portfolio.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import portfolio.vo.BoardVO;

public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	// 게시판 리스트 selectBOARD
	public List<BoardVO> boardList() {
		List<BoardVO> boardList = sqlSession.selectList("board.boardList");

		return boardList;
	}

	// 게시글 등록 inBOARD
	public int boardWrite(BoardVO BoardVO) {
		int boardWrite = sqlSession.insert("board.boardWrite", BoardVO);

		return boardWrite;
	}
}
