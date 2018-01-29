package minites.vo;

public class Invite {
/*
  invite_no number primary key,											-- 초대 번호
  user_id varchar2(100) REFERENCES users(email) not null, 				-- 사용자 이메일
  participants_id varchar2(100) REFERENCES participants(email) not null -- 참여자 이메일

 */
	private String i_name;
	private int invite_no;			// 초대 번호
	private String user_id;			// 사용자 이메일
	private String participants_id; //참여자 이메일
	
	
	public String getI_name() {
		return i_name;
	}


	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	
	public Invite(){}
	
	
	public Invite(int invite_no, String user_id, String participants_id) {
		this.invite_no = invite_no;
		this.user_id = user_id;
		this.participants_id = participants_id;
	}
	
	
	public Invite(String user_id, String participants_id) {
		this.user_id = user_id;
		this.participants_id = participants_id;
	}


	public int getInvite_no() {
		return invite_no;
	}
	public void setInvite_no(int invite_no) {
		this.invite_no = invite_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getParticipants_id() {
		return participants_id;
	}
	public void setParticipants_id(String participants_id) {
		this.participants_id = participants_id;
	}

	
	
	


	@Override
	public String toString() {
		return "Invite [invite_no=" + invite_no + ", user_id=" + user_id + ", participants_id=" + participants_id
				+ ", getInvite_no()=" + getInvite_no() + ", getUser_id()=" + getUser_id() + ", getParticipants_id()="
				+ getParticipants_id() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}