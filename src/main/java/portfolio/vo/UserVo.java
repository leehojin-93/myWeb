package portfolio.vo;

public class UserVo {
	
	private int userNo;
	private String userId;
	private String userPassword;
	private String userName;
	private String joinDate;
	
	public UserVo() {};
	
	public UserVo(int userNo, String userName) {
		this.userNo = userNo;
		this.userName = userName;
	}
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", userId=" + userId + ", userPassword=" + userPassword + ", userName="
				+ userName + ", joinDate=" + joinDate + "]";
	}
	
}
