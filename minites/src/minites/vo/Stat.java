package minites.vo;


public class Stat {
	//이번 달 - 총 횟수
	private String total_count_month;  //총 미팅 횟수
	private String total_time_month;   //총 미팅 시간(분)
	private String total_title_month;  //총 안건
	private String total_person_month; //총 만난 사람
	private String year_month;		   //년도
	private String month_month;		   //월
	
	private String starttime;			//시작시간
	private String endtime;				//종료시간
	private String inputdate;			//미팅 날짜
	private String title;				//안건
	private String place;				//장소
	private String PARTICIPANTS_ID;		//참석자
	
	//이번 달 - 그래프
	private String graph_month;			//X축 월
	private String graph_count_month; //막대그래프 Y축 총 미팅 횟수
	private String graph_time_month;  //꺾은선그래프 Y축 총 미팅 시간
	
	//이번 주 - 총 횟수
	private String total_count_week;  //총 미팅 횟수
	private String total_time_week;   //총 미팅 시간(분)
	private String total_title_week;  //총 안건
	private String total_person_week; //총 만난 사람
	private String month_week;		  //월
	private String week_week;		  //몇 째주 표시
	
	//이번 주 - 그래프
	private String graph_we;		  //X축 요일
	private String graph_count_week;  //막대그래프 Y축 총 미팅 횟수
	private String graph_time_week;   //꺾은선그래프 Y축 총 미팅 시간
	
	//안건 별 - 추가예정
	private String month_agenda;	//월 
	private String title_agenda;	//X축 타이틀 
	private String count_agenda;	//Y축 횟수
	private String runtime_agenda;  //Y축 합계시간
	
	public Stat() {
		super();
	}
	
	
	

	public String getRuntime_agenda() {
		return runtime_agenda;
	}




	public String getPARTICIPANTS_ID() {
		return PARTICIPANTS_ID;
	}




	public void setPARTICIPANTS_ID(String pARTICIPANTS_ID) {
		PARTICIPANTS_ID = pARTICIPANTS_ID;
	}




	public void setRuntime_agenda(String runtime_agenda) {
		this.runtime_agenda = runtime_agenda;
	}

	


	public String getPlace() {
		return place;
	}




	public void setPlace(String place) {
		this.place = place;
	}




	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getMonth_agenda() {
		return month_agenda;
	}



	public void setMonth_agenda(String month_agenda) {
		this.month_agenda = month_agenda;
	}



	public String getTitle_agenda() {
		return title_agenda;
	}



	public void setTitle_agenda(String title_agenda) {
		this.title_agenda = title_agenda;
	}



	public String getCount_agenda() {
		return count_agenda;
	}



	public void setCount_agenda(String count_agenda) {
		this.count_agenda = count_agenda;
	}



	public String getInputdate() {
		return inputdate;
	}




	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}




	public String getTotal_count_month() {
		return total_count_month;
	}

	public void setTotal_count_month(String total_count_month) {
		this.total_count_month = total_count_month;
	}

	public String getTotal_time_month() {
		return total_time_month;
	}

	public void setTotal_time_month(String total_time_month) {
		this.total_time_month = total_time_month;
	}

	public String getTotal_title_month() {
		return total_title_month;
	}

	public void setTotal_title_month(String total_title_month) {
		this.total_title_month = total_title_month;
	}

	public String getTotal_person_month() {
		return total_person_month;
	}

	public void setTotal_person_month(String total_person_month) {
		this.total_person_month = total_person_month;
	}

	public String getYear_month() {
		return year_month;
	}

	public void setYear_month(String year_month) {
		this.year_month = year_month;
	}

	public String getMonth_month() {
		return month_month;
	}

	public void setMonth_month(String month_month) {
		this.month_month = month_month;
	}

	public String getGraph_month() {
		return graph_month;
	}

	public void setGraph_month(String graph_month) {
		this.graph_month = graph_month;
	}

	public String getGraph_count_month() {
		return graph_count_month;
	}

	public void setGraph_count_month(String graph_count_month) {
		this.graph_count_month = graph_count_month;
	}

	public String getGraph_time_month() {
		return graph_time_month;
	}

	public void setGraph_time_month(String graph_time_month) {
		this.graph_time_month = graph_time_month;
	}

	public String getTotal_count_week() {
		return total_count_week;
	}

	public void setTotal_count_week(String total_count_week) {
		this.total_count_week = total_count_week;
	}

	public String getTotal_time_week() {
		return total_time_week;
	}

	public void setTotal_time_week(String total_time_week) {
		this.total_time_week = total_time_week;
	}

	public String getTotal_title_week() {
		return total_title_week;
	}

	public void setTotal_title_week(String total_title_week) {
		this.total_title_week = total_title_week;
	}

	public String getTotal_person_week() {
		return total_person_week;
	}

	public void setTotal_person_week(String total_person_week) {
		this.total_person_week = total_person_week;
	}

	public String getMonth_week() {
		return month_week;
	}

	public void setMonth_week(String month_week) {
		this.month_week = month_week;
	}

	public String getWeek_week() {
		return week_week;
	}

	public void setWeek_week(String week_week) {
		this.week_week = week_week;
	}



	public String getGraph_count_week() {
		return graph_count_week;
	}

	public void setGraph_count_week(String graph_count_week) {
		this.graph_count_week = graph_count_week;
	}

	public String getGraph_time_week() {
		return graph_time_week;
	}

	public void setGraph_time_week(String graph_time_week) {
		this.graph_time_week = graph_time_week;
	}

	public String getGraph_we() {
		return graph_we;
	}

	public void setGraph_we(String graph_we) {
		this.graph_we = graph_we;
	}

	



	public String getStarttime() {
		return starttime;
	}




	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}




	public String getEndtime() {
		return endtime;
	}




	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}




	@Override
	public String toString() {
		return "Stat [total_count_week=" + total_count_week + ", total_time_week=" + total_time_week
				+ ", total_title_week=" + total_title_week + ", total_person_week=" + total_person_week
				+ ", month_week=" + month_week + ", week_week=" + week_week + "]";
	}

	
	



	

	
	
	
	
	
	
	
	
	
	
	
}
