package minites.vo;

public class Statements {
/*
  stmt_no varchar2(100) primary key,							-- 발언 번호
  email varchar2(100) not null,									-- 발언자 이메일
  contents clob,												-- 발언 내용
  inputdate date default sysdate,								-- 발언 작성날짜
  agenda_no varchar2(100) REFERENCES agenda(agenda_no) not null,-- 안건 번호
  updater varchar2(100),										-- 수정한 사람
  update_time date default sysdate								-- 수정한 시간
 */
	private String stmt_no;							
	private String contents;											
	private String inputdate;							
	private String agenda_no;
	
	public Statements() {}
	
	public Statements(String stmt_no, String contents, String inputdate, String agenda_no) {
		this.stmt_no = stmt_no;
		this.contents = contents;
		this.inputdate = inputdate;
		this.agenda_no = agenda_no;
	}




	public Statements(String stmt_no, String contents, String agenda_no) {
		this.stmt_no = stmt_no;
		this.contents = contents;
		this.agenda_no = agenda_no;
	}

	public String getStmt_no() {
		return stmt_no;
	}
	public void setStmt_no(String stmt_no) {
		this.stmt_no = stmt_no;
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
	public String getAgenda_no() {
		return agenda_no;
	}
	public void setAgenda_no(String agenda_no) {
		this.agenda_no = agenda_no;
	}

	@Override
	public String toString() {
		return "Statements [stmt_no=" + stmt_no + ", contents=" + contents + ", inputdate=" + inputdate + ", agenda_no="
				+ agenda_no + "]";
	}
	
	
	
}