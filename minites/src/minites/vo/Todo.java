package minites.vo;

public class Todo {
/*
  todo_no varchar2(100) primary key,							   -- 할 일 번호
  stmt_no varchar2(100) REFERENCES statesments(stmt_no) not null,  -- 발언 번호
  todo_user varchar2(100) REFERENCES participants(email) not null, -- 할 일 담당자
  contents varchar2(1000),										   -- 할 일 내용
  inputdate date default sysdate,								   -- 할 일 작성시간
  duedate varchar2(50) not null, 								   -- 마감 날짜
  updater varchar2(100),                          				   -- 수정한 사람
  update_time date default sysdate								   -- 수정한 시간

 */
	
	private String todo_no;		// 할 일 번호
	private String stmt_no;		// 발언 번호
	private String todo_email; 	// 할 일 담당자 이메일
	private String todo_user;	// 할 일 담당자 이름
	private String contents;	// 할 일 내용
	private String inputdate;	// 할 일 작성시간
	private String duedate;		// 마감 날짜
	private String updater;		// 수정한 사람
	private String update_time;	// 수정한 시간
	
	// 할 일 목록 가져올때 쪼인하려고 만듬
	private String title;		// 회의제목
	private String a_contents;  // 안건내용
	private String name;   // 할 일 담당자 이름
	private String photo;  //  할 일 담당자 사진
	private int dday; // 디데이
	private String meeting_no;
	private String month;

	
	public Todo() {}


	// 할 일 목록 가져오기 위한 생성자
	public Todo(String contents, String duedate, String title, String a_contents, String name, String photo, int dday, String meeting_no) {
		this.contents = contents;
		this.duedate = duedate;
		this.title = title;
		this.a_contents = a_contents;
		this.name = name;
		this.photo = photo;
		this.dday = dday;
		this.meeting_no = meeting_no;
	}

	// 수정한 사람, 수정시간 미포함
	public Todo(String todo_no, String stmt_no, String todo_email, String todo_user, String contents, String inputdate, String duedate,
			String title, String a_contents, String name, String photo, int dday) {
		this.todo_no = todo_no;
		this.stmt_no = stmt_no;
		this.todo_email = todo_email;
		this.todo_user = todo_user;
		this.contents = contents;
		this.inputdate = inputdate;
		this.duedate = duedate;
		this.title = title;
		this.a_contents = a_contents;
		this.name = name;
		this.photo = photo;
		this.dday = dday;
	}

	// 수정한 사람, 수정시간 포함
	public Todo(String todo_no, String stmt_no, String todo_email, String todo_user, String contents, String inputdate, String duedate,
			String updater, String update_time, String title, String a_contents, String name, String photo, int dday) {
		this.todo_no = todo_no;
		this.stmt_no = stmt_no;
		this.todo_email = todo_email;
		this.todo_user = todo_user;
		this.contents = contents;
		this.inputdate = inputdate;
		this.duedate = duedate;
		this.updater = updater;
		this.update_time = update_time;
		this.title = title;
		this.a_contents = a_contents;
		this.name = name;
		this.photo = photo;
		this.dday = dday;
	}


	public String getTodo_no() {
		return todo_no;
	}


	public void setTodo_no(String todo_no) {
		this.todo_no = todo_no;
	}


	public String getStmt_no() {
		return stmt_no;
	}


	public void setStmt_no(String stmt_no) {
		this.stmt_no = stmt_no;
	}


	public String getTodo_user() {
		return todo_user;
	}


	public void setTodo_user(String todo_user) {
		this.todo_user = todo_user;
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


	public String getDuedate() {
		return duedate;
	}


	public void setDuedate(String duedate) {
		this.duedate = duedate;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}



	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	
	public String getA_contents() {
		return a_contents;
	}


	public void setA_contents(String a_contents) {
		this.a_contents = a_contents;
	}


	public String getTodo_email() {
		return todo_email;
	}


	public void setTodo_email(String todo_email) {
		this.todo_email = todo_email;
	}


	public String getMeeting_no() {
		return meeting_no;
	}


	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}


	public String getMonth() {
		return month;
	}


	public void setMonth(String month) {
		this.month = month;
	}


	public int getDday() {
		return dday;
	}


	public void setDday(int dday) {
		this.dday = dday;
	}




	@Override
	public String toString() {
		return "Todo [todo_no=" + todo_no + ", stmt_no=" + stmt_no + ", todo_email=" + todo_email + ", todo_user="
				+ todo_user + ", contents=" + contents + ", inputdate=" + inputdate + ", duedate=" + duedate
				+ ", updater=" + updater + ", update_time=" + update_time + ", title=" + title + ", a_contents="
				+ a_contents + ", name=" + name + ", photo=" + photo + ", dday=" + dday + "]";
	}




	

	

	
	
	
}
