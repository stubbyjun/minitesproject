package minites.vo;

public class Meeting {
/*
  MEETING_no varchar2(100) primary key,					-- 회의록 번호
  title varchar2(100) not null,							-- 회의제목
  user_id VARCHAR2(50) REFERENCES users(email) not null,-- 사용자 이메일
  inputdate date default sysdate,						-- 작성 날짜
  meeting_start varchar2(50) not null,					-- 회의 시작시간
  meeting_end varchar2(50) not null,					-- 회의 끝난시간
  runtime number,										-- 회의시간
  goal varchar2(200),									-- 회의목표
  place varchar2(200),									-- 회의장소
  updater varchar2(100),								-- 수정한 사람
  update_time date default sysdate						-- 수정한 시간

 */
	
	private String meeting_no;		// 회의록 번호
	private String title;			// 회의제목
	private String user_id;			// 사용자 이메일
	private String inputdate;		// 작성 날짜
	private String meeting_start;	// 회의 시작시간
	private String meeting_end;		// 회의 끝난시간
	private double runtime;			// 회의시간
	private String goal;			// 회의목표
	private String place; 			// 회의 장소				
	private String updater; 		// 수정한 사람				
	private String update_time;		// 수정한 시간 		
	private String mstart; //날짜
	private String mtime; //날짜
	
	
	public Meeting() {}

	
	// 일정 등록
	public Meeting(String meeting_no, String title, String user_id, String meeting_start, String meeting_end,
			String place) {
		this.meeting_no = meeting_no;
		this.title = title;
		this.user_id = user_id;
		this.meeting_start = meeting_start;
		this.meeting_end = meeting_end;
		this.place = place;
	}
	
	// 수정한 사람, 수정한 시간 미포함
	public Meeting(String meeting_no, String title, String user_id, String inputdate, String meeting_start,
			String meeting_end, double runtime, String goal, String place) {
		this.meeting_no = meeting_no;
		this.title = title;
		this.user_id = user_id;
		this.inputdate = inputdate;
		this.meeting_start = meeting_start;
		this.meeting_end = meeting_end;
		this.runtime = runtime;
		this.goal = goal;
		this.place = place;
	}


	// 수정한 사람, 수정한 시간 포함
	public Meeting(String meeting_no, String title, String user_id, String inputdate, String meeting_start,
			String meeting_end, double runtime, String goal, String place, String updater, String update_time) {
		this.meeting_no = meeting_no;
		this.title = title;
		this.user_id = user_id;
		this.inputdate = inputdate;
		this.meeting_start = meeting_start;
		this.meeting_end = meeting_end;
		this.runtime = runtime;
		this.goal = goal;
		this.place = place;
		this.updater = updater;
		this.update_time = update_time;
	}




	public Meeting(String title, String meeting_start, String meeting_end, String place) {
		this.title = title;
		this.meeting_start = meeting_start;
		this.meeting_end = meeting_end;
		this.place = place;
	}


	public String getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getMeeting_start() {
		return meeting_start;
	}

	public void setMeeting_start(String meeting_start) {
		this.meeting_start = meeting_start;
	}

	public String getMeeting_end() {
		return meeting_end;
	}

	public void setMeeting_end(String meeting_end) {
		this.meeting_end = meeting_end;
	}

	public double getRuntime() {
		return runtime;
	}

	public void setRuntime(double runtime) {
		this.runtime = runtime;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
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

	
	
	public String getMstart() {
		return mstart;
	}


	public void setMstart(String mstart) {
		this.mstart = mstart;
	}


	public String getMtime() {
		return mtime;
	}


	public void setMtime(String mtime) {
		this.mtime = mtime;
	}


	@Override
	public String toString() {
		return "Meeting [meeting_no=" + meeting_no + ", title=" + title + ", user_id=" + user_id + ", inputdate="
				+ inputdate + ", meeting_start=" + meeting_start + ", meeting_end=" + meeting_end + ", runtime="
				+ runtime + ", goal=" + goal + "]";
	}

	
	
	
}
