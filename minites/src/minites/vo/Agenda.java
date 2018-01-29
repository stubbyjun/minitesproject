package minites.vo;

import java.io.Serializable;

public class Agenda implements Serializable {
/*
 * 
  agenda_no varchar2(100) primary key,								-- 안건 번호
  title varchar2(100) not null,										-- 안건 제목
  inputdate date default sysdate,									-- 안건 작성시간
  description varchar2(1000) not null,								-- 안건 내용
  meeting_no varchar2(100) REFERENCES meeting(meeting_no) not null,	-- 회의록 번호
  updater varchar2(100),											-- 수정한 사람
  update_time date default sysdate									-- 수정한 시간
d
 */
	private String agenda_no;							
	private String contents;									
	private String inputdate;				
	private String meeting_no;
	
	
	public Agenda(){}
	
	public Agenda(String agenda_no, String contents, String inputdate, String meeting_no) {
		this.agenda_no = agenda_no;
		this.contents = contents;
		this.inputdate = inputdate;
		this.meeting_no = meeting_no;
	}
	public Agenda(String agenda_no, String contents, String id) {
		// TODO Auto-genethis.agenda_no = agenda_no;
		this.contents = contents;
		this.agenda_no = agenda_no;
		this.meeting_no = id;
	}

	public String getAgenda_no() {
		return agenda_no;
	}
	public void setAgenda_no(String agenda_no) {
		this.agenda_no = agenda_no;
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
	public String getMeeting_no() {
		return meeting_no;
	}
	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}

	@Override
	public String toString() {
		return "Agenda [agenda_no=" + agenda_no + ", contents=" + contents + ", inputdate=" + inputdate
				+ ", meeting_no=" + meeting_no + "]";
	}
	
	
	
	
}