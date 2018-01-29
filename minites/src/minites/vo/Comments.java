package minites.vo;

public class Comments {
/*
  comment_no varchar2(100) primary key,								 -- 커멘트 번호
  comment_user varchar2(100) REFERENCES participants(email) not null,-- 커멘트 작성자 이메일
  contents varchar2(1000),											 -- 커멘트 내용
  inputdate date default sysdate,									 -- 커멘트 작성시간
  stmt_no varchar2(100) REFERENCES statesments(stmt_no) not null, 	 -- 발언 번호
  updater varchar2(100),											 -- 수정한 사람
  update_time date default sysdate									 -- 수정한 시간  

*/
	
	private String comment_no;		// 커멘트 번호
	private String comment_email;	// 커멘트 작성자 이메일
	private String comment_user;	// 커멘트 작성자 이름
	private String contents;		// 커멘트 내용
	private String inputdate;	 	// 커멘트 작성시간
	private String stmt_no; 		// 발언 번호
	private String updater;			// 수정한 사람
	private String update_time;		// 수정한 시간  
	
	public Comments() {}
	
	// 수정한 사람, 수정한 시간 미포함
	public Comments(String comment_no, String comment_email, String comment_user, String contents, String inputdate, String stmt_no) {
		this.comment_no = comment_no;
		this.comment_email = comment_email;
		this.comment_user = comment_user;
		this.contents = contents;
		this.inputdate = inputdate;
		this.stmt_no = stmt_no;
	}

	// 수정한 사람, 수정한 시간 포함
	public Comments(String comment_no, String comment_email, String comment_user, String contents, String inputdate, String stmt_no,
			String updater, String update_time) {
		this.comment_no = comment_no;
		this.comment_email = comment_email;
		this.comment_user = comment_user;
		this.contents = contents;
		this.inputdate = inputdate;
		this.stmt_no = stmt_no;
		this.updater = updater;
		this.update_time = update_time;
	}

	public String getComment_no() {
		return comment_no;
	}

	public void setComment_no(String comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_user() {
		return comment_user;
	}

	public void setComment_user(String comment_user) {
		this.comment_user = comment_user;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getStmt_no() {
		return stmt_no;
	}

	public void setStmt_no(String stmt_no) {
		this.stmt_no = stmt_no;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getComment_email() {
		return comment_email;
	}

	public void setComment_email(String comment_email) {
		this.comment_email = comment_email;
	}

	@Override
	public String toString() {
		return "Comments [comment_no=" + comment_no + ", comment_email=" + comment_email + ", comment_user="
				+ comment_user + ", contents=" + contents + ", inputdate=" + inputdate + ", stmt_no=" + stmt_no
				+ ", updater=" + updater + ", update_time=" + update_time + "]";
	}
	
	
	
	
	
	
	
}