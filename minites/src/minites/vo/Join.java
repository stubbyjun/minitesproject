package minites.vo;

public class Join {
/*
  join_no number primary key,											-- 참가 번호
  participants_id varchar2(100) REFERENCES participants(email) not null,-- 참가자 이메일
  user_id varchar2(100) REFERENCES users(email) not null,				-- 사용자 이메일
  meeting_no varchar2(100) REFERENCES meeting(meeting_no) not null		-- 회의록 번호

 */
	/*select j.participants_id, p.name, p.phone*/	
	
	private int join_no;			// 참가 번호
	private String user_id;			// 개최자
	private String meeting_no;		// 회의록 번호
	private String participants_id; //참석자 이메일
	private String name; //참석자 이름
	private String phone; //참석자 폰번호
	
	private String email;
	
	public Join() {}

	public Join(String user_id, String meeting_no, String participants_id) {
		this.user_id = user_id;
		this.meeting_no = meeting_no;
		this.participants_id = participants_id;
		
	}
	
	
	public Join(int join_no, String user_id, String meeting_no, String participants_id) {
		this.join_no = join_no;
		this.user_id = user_id;
		this.meeting_no = meeting_no;
		this.participants_id = participants_id;
	}





	public int getJoin_no() {
		return join_no;
	}

	public void setJoin_no(int join_no) {
		this.join_no = join_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}

	public String getParticipants_id() {
		return participants_id;
	}

	public void setParticipants_id(String participants_id) {
		this.participants_id = participants_id;
	}

	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	@Override
	public String toString() {
		return "Join [join_no=" + join_no + ", user_id=" + user_id + ", meeting_no=" + meeting_no + ", participants_id="
				+ participants_id + ", name=" + name + ", phone=" + phone + ", email=" + email + "]";
	}

	
	
}