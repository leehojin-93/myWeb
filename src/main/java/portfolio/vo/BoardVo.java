package portfolio.vo;

public class BoardVo {
	private int boardNo;
	private String boardTitle;
	private String boardContext;
	private int boardHit;
	private String boardRegDate;
	private String boardModDate;
	private int writeUserNo;
	private String userName;
	
	public BoardVo() {}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public String getBoardContext() {
		return boardContext;
	}

	public void setBoardContext(String boardContext) {
		this.boardContext = boardContext;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public String getBoardRegDate() {
		return boardRegDate;
	}

	public void setBoardRegDate(String boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	public String getBoardModDate() {
		return boardModDate;
	}

	public void setBoardModDate(String boardModDate) {
		this.boardModDate = boardModDate;
	}

	public int getWriteUserNo() {
		return writeUserNo;
	}

	public void setWriteUserNo(int writeUserNo) {
		this.writeUserNo = writeUserNo;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContext=" + boardContext
				+ ", boardHit=" + boardHit + ", boardRegDate=" + boardRegDate + ", boardModDate=" + boardModDate
				+ ", writeUserNo=" + writeUserNo + ", userName=" + userName + "]";
	}

}
