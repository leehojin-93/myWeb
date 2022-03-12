package portfolio.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import portfolio.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 게시판 리스트 selectBOARD
	public List<BoardVO> boardList() {
		List<BoardVO> boardList = sqlSession.selectList("board.boardList");
		
		return boardList;
	}
	
	// 게시글 등록 inBOARD
	public int boardWrite(BoardVO boardVo) {
		int boardWrite = sqlSession.insert("board.boardWrite", boardVo);
		
		return boardWrite;
	}

}
