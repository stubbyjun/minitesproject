package minites.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import minites.dao.StatDAO;
import minites.vo.Stat;
import sun.util.logging.resources.logging;



public class StatAction extends ActionSupport implements SessionAware {
	private Map session;
	private String user_email;
	
	private List<Stat> month_total_list; //이번 달 토탈; 총 횟수, 총 건수, 총 몇명, 총 시간
	private List<Stat> month_graph_list; //이번 달 그래프; 월, 횟수, 시간
	
	private List<Stat> week_total_list; //이번 주 토탈; 회, 건, 명, 시간(분)
	private List<Stat> week_graph_list; //이번 주 그래프; 주, 횟수, 시간

	private List<Stat> agendaList;//안건 별 그래프; 월, 타이틀, 횟수, 시간
	private List<Stat> month_table_list; //이번 달 테이블 정보
	
	private String src;
	
	public String statPage(){
		user_email=(String) session.get("user_email");
		
		return SUCCESS;
	}
	
	//이번 달 테이블 정보
	public List<Stat> tableinfo(String user_email){
		StatDAO dao = new StatDAO();
		month_table_list=dao.month_table_list(user_email);
		
		return month_table_list;
	}
	
	//지난 달 통계
	public String lastmonth(){
		System.out.println("지난 달 통계에 왔습니다.");
		String last=src.substring(0,src.length()-1);
		int lastmonth=Integer.parseInt(last)-1;
				
		user_email=(String) session.get("user_email");
		month_total_list=lastmonth_Stat(user_email,lastmonth);
		month_graph_list=month_Graph(user_email);
		week_total_list=week_Stat(user_email);
		week_graph_list=week_Graph(user_email);
		agendaList=agenda_Graph(user_email);
		return SUCCESS;
	}
	
	//지난 달 - 총 정보 가져오기
	private List<Stat> lastmonth_Stat(String user_email, int lastmonth) {
		StatDAO dao = new StatDAO();
		month_total_list=dao.lastmonth_Stat(user_email,lastmonth);
		return month_total_list;
	}

	//다음 달 통계
	public String nextmonth(){
			
		String next=src.substring(0,src.length()-1);
		int nextmonth=Integer.parseInt(next)+1;
				
		user_email=(String) session.get("user_email");
		
		month_total_list= nextmonth_Stat(user_email,nextmonth);
		month_graph_list= month_Graph(user_email);
		week_total_list= week_Stat(user_email);
		week_graph_list= week_Graph(user_email);
		agendaList= agenda_Graph(user_email);
		return SUCCESS;
	}
	
	//다음 달 - 총 정보 가져오기
	private List<Stat> nextmonth_Stat(String user_email2, int nextmonth) {
		StatDAO dao = new StatDAO();
		month_total_list=dao.nextmonth_Stat(user_email,nextmonth);
		return month_total_list;
	}

	//지난 주 통계
	public String lastweek(){
		System.out.println("지난 주 통계");
		System.out.println("src: "+src);
		user_email=(String) session.get("user_email");
		month_total_list=month_Stat(user_email);
		month_graph_list=month_Graph(user_email);
		week_total_list=week_Stat(user_email);
		week_graph_list=week_Graph(user_email);
		agendaList=agenda_Graph(user_email);
		return SUCCESS;
	}
	
	//다음 주 통계
	public String nextweek(){
		System.out.println("다음 주 통계");
		System.out.println("src: "+src);
		user_email=(String) session.get("user_email");
		month_total_list=month_Stat(user_email);
		month_graph_list=month_Graph(user_email);
		week_total_list=week_Stat(user_email);
		week_graph_list=week_Graph(user_email);
		agendaList=agenda_Graph(user_email);
		return SUCCESS;
	}
	
	//통계 가져오기
	public String thisMonthList(){
		user_email=(String) session.get("user_email");
		month_total_list=month_Stat(user_email);
		month_graph_list=month_Graph(user_email);
		week_total_list=week_Stat(user_email);
		week_graph_list=week_Graph(user_email);
		agendaList=agenda_Graph(user_email);
		month_table_list=tableinfo(user_email);//이번 달 테이블
		return SUCCESS;
	}
	

	//이번 달 - 총 횟수
	public List<Stat> month_Stat(String user_email){
		StatDAO dao = new StatDAO();
		month_total_list=dao.month_Stat(user_email);
		return month_total_list;
	}
	
	//이번 달 - 그래프
	public List<Stat> month_Graph(String user_email){
		StatDAO dao = new StatDAO();
		month_graph_list=dao.month_Graph(user_email);
		return month_graph_list;
	}
	
	//이번 주 - 총 횟수
	public List<Stat> week_Stat(String user_email){
		StatDAO dao = new StatDAO();
		week_total_list=dao.week_Stat(user_email);
		return week_total_list;
	}
	
	//이번 주 - 그래프
	public List<Stat> week_Graph(String user_email){
		StatDAO dao = new StatDAO();
		
		week_graph_list=dao.week_Graph(user_email);
		return week_graph_list;
	}
	
	//안건별 - 그래프
	public List<Stat> agenda_Graph(String user_email){
		StatDAO dao = new StatDAO();
		
		agendaList=dao.agenda_Graph(user_email);
		return agendaList;
	}
	
	
	public List<Stat> getAgendaList() {
		return agendaList;
	}


	public void setAgendaList(List<Stat> agendaList) {
		this.agendaList = agendaList;
	}


	public List<Stat> getMonth_total_list() {
		return month_total_list;
	}


	public void setMonth_total_list(List<Stat> month_total_list) {
		this.month_total_list = month_total_list;
	}


	public List<Stat> getMonth_graph_list() {
		return month_graph_list;
	}


	public void setMonth_graph_list(List<Stat> month_graph_list) {
		this.month_graph_list = month_graph_list;
	}


	public List<Stat> getWeek_total_list() {
		return week_total_list;
	}


	public void setWeek_total_list(List<Stat> week_total_list) {
		this.week_total_list = week_total_list;
	}


	public List<Stat> getWeek_graph_list() {
		return week_graph_list;
	}


	public void setWeek_graph_list(List<Stat> week_graph_list) {
		this.week_graph_list = week_graph_list;
	}


	@Override
	public String toString() {
		return "StatAction [month_total_list=" + month_total_list + ", month_graph_list=" + month_graph_list
				+ ", week_total_list=" + week_total_list + ", week_graph_list=" + week_graph_list + "]";
	}


	@Override
	public void setSession(Map<String, Object> arg0) {
		 session = arg0;		
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public List<Stat> getMonth_table_list() {
		return month_table_list;
	}

	public void setMonth_table_list(List<Stat> month_table_list) {
		this.month_table_list = month_table_list;
	}

	
	
}
