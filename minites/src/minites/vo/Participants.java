package minites.vo;

public class Participants {
/*
  email varchar2(100) primary key,							-- 참여자 이메일
  name varchar2(50) not null,								-- 참여자 이름
  phone varchar2(50),										-- 참여자 전화번호
  photo varchar2(50),										-- 참여자 사진
  meeting_no varchar2(100) REFERENCES meeting(meeting_no)	-- 회의록 번호
 */
	private String todo_user;		// 참여자 이름(할 일 담당자)
	private String todo_email;	
	
	private String name;		// 참여자 이름
	private String phone;		// 참여자 전화번호
	private String photo;		// 참여자 사진
	private String meeting_no;	// 회의록 번호
	
	private String email; // 참여자 이메일
	
	private String todo_no;//할 일 번호
	
	public Participants() {}

	public Participants(String email, String name, String phone, String photo, String meeting_no) {
		this.todo_user = email;
		this.name = name;
		this.phone = phone;
		this.photo = photo;
		this.meeting_no = meeting_no;
	}

	// todo들어감
	public Participants(String email, String name, String phone, String photo, String meeting_no, String todo_no) {
		this.todo_user = email;
		this.name = name;
		this.phone = phone;
		this.photo = photo;
		this.meeting_no = meeting_no;
		this.todo_no = todo_no;
	}

	// 회의록에서 새로운 사람 추가
	public Participants(String email, String name, String phone, String meeting_no) {
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.meeting_no = meeting_no;
	}

	public String getTodo_no() {
		return todo_no;
	}

	public void setTodo_no(String todo_no) {
		this.todo_no = todo_no;
	}

	

	public String getTodo_user() {
		return todo_user;
	}

	public void setTodo_user(String todo_user) {
		this.todo_user = todo_user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}

	public String getTodo_email() {
		return todo_email;
	}

	public void setTodo_email(String todo_email) {
		this.todo_email = todo_email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Participants [email=" + email + ", name=" + name + ", phone=" + phone + ", photo=" + photo
				+ ", meeting_no=" + meeting_no + "]";
	}
	
	
	

}