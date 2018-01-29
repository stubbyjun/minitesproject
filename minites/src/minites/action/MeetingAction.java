package minites.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.search.IntegerComparisonTerm;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
/*import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;*/
import com.opensymphony.xwork2.ActionSupport;

import minites.dao.MeetingDAO;
import minites.vo.Agenda;
import minites.vo.Comments;
import minites.vo.Invite;
import minites.vo.Meeting;
import minites.vo.Participants;
import minites.vo.Statements;
import minites.vo.Todo;
import minites.vo.Users;
//import sandbox.tables.pdftest3;

public class MeetingAction extends ActionSupport implements SessionAware {
	static Logger logger = Logger.getLogger(MeetingAction.class);
	private String id; // primary key 생성
	private String savedid;
	private String realid;
	
	private String todo_no;
	private Todo todo; // 할 일
	private Participants participants;
	private Meeting meeting; // 미팅
	private Users users;// 유저
	private Agenda agenda;
	private Statements statements;
	
	private Comments comments;
	private List<Todo> todoList; // 할 일 리스트
	private List<Todo> todoList2; // dday가 넘은 것들가져오는 리스트
	private List<Participants> participantlist;
	private List<Meeting> timelinelist; // 타임라인리스트
	private List<Meeting> todaylist; // 타임라인 리스트 - 오늘
	private List<Meeting> titlelist; // 제목 정렬
	private List<Meeting> meetingList;// 검색
	
	private List<Agenda> agendaList;
	private List<Statements> statementsList;
	private List<Invite> invitelist;
	
	
	private String searchtext;
	private String searchcondition;
	///// 미팅목록/////
	private int meeting_count; // 미팅갯수
	private int partici_count; // 참석자수
	private double runtime; // 미팅 소요시간
	private int todo_count; // 할 일 갯수

	///// 미팅 저장///////
	private List<String> commentObjects;
	private List<String> todoObjects;
	private List<String> agendaTexts;
	private List<String> sayTexts;
	// 골
	private String goal;

	// 미팅록에서 발언 추가 할 일 추가
	// String stmt_no;
	// String todo_user;
	// String contents;
	// String duedate;

	///// 할 일 갯 수/////
	String month;
	int todaycount;// 오늘 할 일 갯수
	int futurecount; // 앞으로 할 일 갯수
	int pastcount; // 지난 일 갯 수
	///// 미팅추가/////
	String meeting_no; // 미팅 번호
	String title; // 미팅제목
	String inputdate; // 미팅날짜
	String meeting_start; // 미팅시작시간
	String meeting_end; // 미팅끝나는 시간
	String place; // 미팅 장소
	String email; // 참가자 이메일
	String mstart;
	String mtime;
	String parti_email;

	String get_user; // 디비에서 권한가져와
	/*
	 * String parti_email;//참석자 이메일
	 */

	String name;
	String phone;
	String i_name;
	
	///// 구글 로그인 관련 정보/////
	String id_token;
	String user_name;
	String user_email;
	String user_id;
	String user_photo;
	String user_phone;
	String user_occupation;
	///
	String date_written;
	Map<String, Object> session;

	// 회의록
	// 작성---------------------------------------------------------------------------------------------------
	public String insert() {
		id = "M" + Long.toHexString(Double.doubleToLongBits(Math.random()));
		//System.out.println(id);
		// 세션에서 유저받아
		get_user = (String) session.get("user_email");
		//System.out.println("권한get_user:" + get_user);
		return SUCCESS;
	}

	// 로그인
	// 관련---------------------------------------------------------------------------------------------------
	public String join() {
		//System.out.println("액션조인들렸어!!");
		/// 구글 로그인 관련 정보///
		//System.out.println("id_token:" + id_token); // ID토큰
		//System.out.println("user_name:" + user_name); // 이름
		//System.out.println("user_email:" + user_email); // 이메일
		//System.out.println("user_id:" + user_id); // ID
		//System.out.println("user_photo:" + user_photo);// 정보

		MeetingDAO dao = new MeetingDAO();
		users = dao.searchUser(user_email);
		if (users != null) {
			if (users.getEmail().equals(user_email)) {
				//System.out.println("이미 존재하는 회원이야.");
				session.put("user_name", user_name);
				session.put("user_email", user_email);
				// session.put("user_id", user_id);
				// session.put("user_photo", user_photo);
			}
			return "login";
		} else {
			dao.join_member(user_name, user_email);
			//System.out.println("DB에 회원정보 저장해");
			session.put("user_name", user_name);
			session.put("user_email", user_email);
			// session.put("user_id", user_id);
			// session.put("user_photo", user_photo);
			return "join";
		}
	}

	// 메인관련---------------------------------------------------------------------------------------------------
	// 메인화면으로 가기(미팅목록)
	public String meetinglist() {
		//System.out.println("미팅목록으로가");
		MeetingDAO dao = new MeetingDAO();

		//System.out.println(session.size() + "dfdfdfd");

		if (session != null) {
			get_user = (String) session.get("user_email");
		}

		//System.out.println("권한get_uiuiuiiser:" + get_user);

		// 미팅갯수구하기
		meeting_count = new MeetingDAO().getMeeting(get_user);
		//System.out.println("미팅갯수:" + meeting_count);

		// 참석자수 구하기
		partici_count = new MeetingDAO().getPartici(get_user);
		//System.out.println("참석자수:" + partici_count);

		// 시간
		// runtime = new MeetingDAO().getRuntime(get_user);
		//System.out.println("소요시간" + runtime);

		// 남은 할일
		todo_count = new MeetingDAO().getTodocount(get_user);
		//System.out.println("남은 할 일 " + todo_count);

		// Timeline 리스트 가져오기
		timelinelist = new MeetingDAO().getTimelinelist(get_user);
		//System.out.println("타임라인리스트:" + timelinelist);
		todaylist = new MeetingDAO().getTodaylist(get_user);
		//System.out.println("투데이리스트:" + todaylist);

		// 가입정보
		//System.out.println("미팅목록 user_email:" + user_email);
		if (user_email == null) {
			user_email = (String) session.get("user_email"); // 세션에서 이메일 받아와
			users = dao.searchUser(user_email); // 이메일로 유저찾아
			if (users.getPhone() == null) { // 찾은 유저의 phone이 없을경우에는 업뎃해
				dao.member_info(user_phone, user_email); // 해당 유저의 email을 찾아서
															// phone업뎃!
				//System.out.println("user_phone:" + user_phone);
				//System.out.println("user_occupation:" + user_occupation);
				//System.out.println("user_email:" + user_email);
			}
		}
		///////////////
		/// 미팅추가 ///
		///////////////
		/*
		 * System.out.println("미팅제목"+title);
		 * System.out.println("미팅날짜"+inputdate);
		 * System.out.println("미팅시작시간"+meeting_start);
		 */
		
		
		
		//////오른쪽 사이드바//////
		get_user = (String)session.get("user_email");
		
		invitelist = dao.getInvitelist(get_user);
		
		//System.out.println("★"+invitelist);
		
		
		return SUCCESS;
	}

	// 메인화면 (캘린더)
	public String calendarlist() {
		//System.out.println("캘린더로가!");
		MeetingDAO dao = new MeetingDAO();
		get_user = (String) session.get("user_email");
		//System.out.println("권한get_user:" + get_user);

		// 미팅갯수구하기
		meeting_count = new MeetingDAO().getMeeting(get_user);
		//System.out.println("미팅갯수:" + meeting_count);

		// 참석자수 구하기
		partici_count = new MeetingDAO().getPartici(get_user);
		//System.out.println("참석자수:" + partici_count);

		// 시간
		// runtime = new MeetingDAO().getRuntime(get_user);
		//System.out.println("소요시간" + runtime);

		// 남은 할일
		todo_count = new MeetingDAO().getTodocount(get_user);
		//System.out.println("남은 할 일 " + todo_count);

		// 가입정보
		System.out.println("미팅목록 user_email:" + user_email);
		if (user_email == null) {
			user_email = (String) session.get("user_email"); // 세션에서 이메일 받아와
			users = dao.searchUser(user_email); // 이메일로 유저찾아
			if (users.getPhone() == null) { // 찾은 유저의 phone이 없을경우에는 업뎃해
				dao.member_info(user_phone, user_email); // 해당 유저의 email을 찾아서
															// phone업뎃!
				//System.out.println("user_phone:" + user_phone);
				//System.out.println("user_occupation:" + user_occupation);
				//System.out.println("user_email:" + user_email);
			}
		}
		
		//////오른쪽 사이드바//////
		get_user = (String)session.get("user_email");
		
		invitelist = dao.getInvitelist(get_user);
		
		//System.out.println("★"+invitelist);
		
		
		
		
		
		
		return SUCCESS;
	}

	// 일정 추가(db에)
	public String insertschedule() {
		id = "M" + Long.toHexString(Double.doubleToLongBits(Math.random()));
		meeting_no = id;// 임의 미팅 번호
		user_id = (String) session.get("user_email"); // 유저 이메일로

		System.out.println(1);
		session.put("mno", id);
		// 세션에서 유저받아
		get_user = (String) session.get("user_email");
		//System.out.println("권한get_user:" + get_user);

		// 참석자 이메일
		MeetingDAO dao = new MeetingDAO();
		session.put("mno2", meeting_no);
		/*String[] particiemail = parti_email.split(",");
		for (int i = 0; i < particiemail.length; i++) {
			System.out.println("email:" + particiemail[i]);
			dao.insert_partiemail(particiemail[i], "니지");
			
		}*/

		//
		meeting = new Meeting(meeting_no, title, user_id, meeting_start, meeting_end, place);
		System.out.println(3);
		new MeetingDAO().insertschedule(meeting);
System.out.println(6);
		return SUCCESS;
	}

	// 회의록 작성 폼으로
	public String writeminites() {
		//System.out.println("회의록작성폼");
		// DB넣어
		id = "M" + Long.toHexString(Double.doubleToLongBits(Math.random()));
		session.put("mno", id);	
		meeting_no = id;// 임의 미팅 번호
		user_id = (String) session.get("user_email"); // 유저 이메일로
		//System.out.println("회의록작성폼 title:" + title);
		//System.out.println("회의록작성폼  meeting_start:" + meeting_start);
		//System.out.println("회의록작성폼 meeting_end:" + meeting_end);
		//System.out.println("회의뢱작성폼 place:" + place);
		// 회의 시간 계산

		meeting = new Meeting(meeting_no, title, user_id, meeting_start, meeting_end, place);
		//System.out.println("추가되는 일정" + meeting);
		new MeetingDAO().insertschedule(meeting);
		date_written = meeting_start.substring(0, 10);

		return SUCCESS;
	}

	public String titlesort() {
		//System.out.println("미팅목록으로가");
		MeetingDAO dao = new MeetingDAO();
		// 세션에서 유저받아
		get_user = (String) session.get("user_email");
		//System.out.println("권한get_user:" + get_user);
		// 미팅갯수구하기
		meeting_count = new MeetingDAO().getMeeting(get_user);
		//System.out.println("미팅갯수:" + meeting_count);
		// 참석자수 구하기
		partici_count = new MeetingDAO().getPartici(get_user);
		//System.out.println("참석자수:" + partici_count);
		// 시간
		// runtime = new MeetingDAO().getRuntime(get_user);
		//System.out.println("소요시간" + runtime);
		// 남은 할일
		todo_count = new MeetingDAO().getTodocount(get_user);
		//System.out.println("남은 할 일 " + todo_count);
		// Timeline 리스트 가져오기
		/*
		 * timelinelist = new MeetingDAO().getTimelinelist();
		 * System.out.println("타임라인리스트:"+timelinelist);
		 */
		titlelist = new MeetingDAO().getTitlelist(get_user);
		//System.out.println("제목솔트:" + titlelist);
		todaylist = new MeetingDAO().getTodaylist(get_user);
		//System.out.println("투데이리스트:" + todaylist);

		// 가입정보
		//System.out.println("미팅목록 user_email:" + user_email);
		if (user_email == null) {
			user_email = (String) session.get("user_email"); // 세션에서 이메일 받아와
			users = dao.searchUser(user_email); // 이메일로 유저찾아
			if (users.getPhone() == null) { // 찾은 유저의 phone이 없을경우에는 업뎃해
				dao.member_info(user_phone, user_email); // 해당 유저의 email을 찾아서
															// phone업뎃!
				//System.out.println("user_phone:" + user_phone);
				//System.out.println("user_occupation:" + user_occupation);
				//System.out.println("user_email:" + user_email);
			}
		}
		return SUCCESS;
	}

	
	public String replaceid(){
		//System.out.println("replaceid 도착");
		String mno=(String)session.get("mno");
		new MeetingDAO().updateMeeting(mno,realid); 
		
		//System.out.println("***********************업데이트 되었나*********");
		
		return SUCCESS;
	}
	
	
	
// 미팅록 저장--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
public String saveMeeting(){

		session.put("meeting_no", id);//미팅넘버 세션에 저장
		// 미팅에 골 추가
		new MeetingDAO().updateGoal(id,goal); // 11월 7일 - 여기까진 잘 돌아감
	
		agendaList = new MeetingDAO().selectAgenda(id);
		statementsList = new MeetingDAO().selectStatements(id);
		
		if(agendaList.size() == 0 || statementsList.size() == 0){
			System.out.println("create여긴 agendaList가 0이거나 state~가 0인 곳"+agendaList.size()+"and"+statementsList.size());
			
			createForm();
			
		} else if(agendaTexts.size() != agendaList.size()){
			
			// 아젠다 텍스츠의 사이즈 와 아젠다 리스트의 사이즈를 비교해서 다를 경우 
			// = 아젠다가 추가 되었다.
			System.out.println("여긴 agendaText의 사이즈와 agendaList의 사이즈가 다를 때"+agendaTexts.size());
			
			//여기는 업데이트 
			for (int i = 0; i < agendaList.size(); i++) {
				String contents = agendaTexts.get(i);
				String agenda_no = id + i;
				String meeting_no = id;
				agenda = new Agenda(agenda_no, contents, meeting_no);
				new MeetingDAO().updateAgenda(agenda);
			}
			// 여기는 추가
			for (int i = agendaList.size(); i < agendaTexts.size(); i++) {
				String contents = agendaTexts.get(i);
				String agenda_no = id + i;
				String meeting_no = id;
			 System.out.println(meeting_no+"바뀐 미팅no");
				agenda = new Agenda(agenda_no, contents, meeting_no);
				if(agenda.getContents()!=null || agenda.getContents()!=" ") {
					new MeetingDAO().insertAgenda(agenda);
				}
			}
			
			for (int c = 0; c < statementsList.size(); c++) {
				
				Gson gson = new Gson();
				Statements statements = gson.fromJson(sayTexts.get(c), Statements.class);
				String stmt_no = id + c;
				new MeetingDAO().deleteTodos(stmt_no);
				new MeetingDAO().deleteComments(stmt_no);
			}
			
				if(commentObjects.size() > 0){
						// minites_comment 추가
					System.out.println("앞 커멘트 있음");
						for (int c = 0; c < commentObjects.size(); c++) {
							Gson gson = new Gson();
							Comments comments = gson.fromJson(commentObjects.get(c), Comments.class);
							
							comments.setComment_no(id + c);

							if (comments != null)new MeetingDAO().insertComment(comments);
						}
				}
				
				if(todoObjects.size() > 0){
						// minites_todo 추가
					
					System.out.println("앞투두 있음");
						for (int c = 0; c < todoObjects.size(); c++) {
							Gson gson = new Gson();
							Todo todo = gson.fromJson(todoObjects.get(c), Todo.class);

							todo.setTodo_no(id + c);

							if (todo != null)new MeetingDAO().insertTodo(todo);

						}
				}
			
		}else if((agendaTexts.size() == agendaList.size()) && (sayTexts.size() != statementsList.size())){
			//아젠다는 추가 안되었는데, 발언은 추가되었다.
			System.out.println("아젠다는 추가 안되었는데, 발언은 추가되었다.");	

			for (int c = 0; c < statementsList.size(); c++) {
					Gson gson = new Gson();
					Statements statements = gson.fromJson(sayTexts.get(c), Statements.class);
					String stmt_no = id + c;
					new MeetingDAO().deleteTodos(stmt_no);
					new MeetingDAO().deleteComments(stmt_no);
					String agenda_no = id + statements.getAgenda_no();
					String contents = statements.getContents();
					statements = new Statements(stmt_no, contents, agenda_no);
	
					new MeetingDAO().updateStatements(statements);
				}
				
				// minites_statesment 추가
				for (int c = statementsList.size() ; c < sayTexts.size() ; c++) {
					Gson gson = new Gson();
					Statements statements = gson.fromJson(sayTexts.get(c), Statements.class);
	
					String stmt_no = id + c;
	
					String agenda_no = id + statements.getAgenda_no();
					String contents = statements.getContents();
	
					statements = new Statements(stmt_no, contents, agenda_no);
					//System.out.println(statements);
	
					new MeetingDAO().insertStatements(statements);
					// statementsList.add(statements);
				}
				
				//System.out.println("추가된 발언 없음");
				for (int c = 0; c < statementsList.size(); c++) {
					
					Gson gson = new Gson();
					Statements statements = gson.fromJson(sayTexts.get(c), Statements.class);
					String stmt_no = id + c;
					new MeetingDAO().deleteTodos(stmt_no);
					new MeetingDAO().deleteComments(stmt_no);
				}
				
			
				if(commentObjects.size() > 0 ){
					// minites_comment 추가
					System.out.println("comment 있음");
					for (int c = 0; c < commentObjects.size(); c++) {
						Gson gson = new Gson();
						Comments comments = gson.fromJson(commentObjects.get(c), Comments.class);
						
						comments.setComment_no(id + c);
		
						if (comments != null)new MeetingDAO().insertComment(comments);
					}
				}
				
				if(todoObjects.size() > 0){
					// minites_todo 추가
					System.out.println("투두 있음");
					for (int c = 0; c < todoObjects.size(); c++) {
						Gson gson = new Gson();
						Todo todo = gson.fromJson(todoObjects.get(c), Todo.class);
		
		
						todo.setTodo_no(id + c);
		
						if (todo != null)new MeetingDAO().insertTodo(todo);
		
					}
				}
			
		} else { // 어젠다, 발언, 수정만 하는 경우
			
			updateForm();
		}

	return SUCCESS;
}

	public void createForm() {// 회의록 새로 만들기
		
		// 안건 추가
		for (int i = 0; i < agendaTexts.size(); i++) {
			String contents = agendaTexts.get(i);
			String agenda_no = id + i;
			String meeting_no = id;
			agenda = new Agenda(agenda_no, contents, meeting_no);
			
			if(agenda.getContents()!=null || agenda.getContents()!=" ") {
				new MeetingDAO().insertAgenda(agenda);
			}
		}

		// minites_statesment 추가
		for (int c = 0; c < sayTexts.size(); c++) {
			Gson gson = new Gson();
			Statements statements = gson.fromJson(sayTexts.get(c), Statements.class);

			String stmt_no = id + c;
			String agenda_no = id + statements.getAgenda_no();
			String contents = statements.getContents();

			statements = new Statements(stmt_no, contents, agenda_no);

			new MeetingDAO().insertStatements(statements);
		}

//--------------------문제있음11월8일-------------------------------------------------------------------------------------------------
		// minites_comment 추가
		for (int c = 0; c < commentObjects.size(); c++) {
			Gson gson = new Gson();
			Comments comments = gson.fromJson(commentObjects.get(c), Comments.class);

			comments.setComment_no(id + c);

			if (comments != null)new MeetingDAO().insertComment(comments);
		}

		// minites_todo 추가
		for (int c = 0; c < todoObjects.size(); c++) {
			Gson gson = new Gson();
			Todo todo = gson.fromJson(todoObjects.get(c), Todo.class);
			
			System.out.println("create수투우"+todo);

			todo.setTodo_no(id + c);
			if (todo != null)new MeetingDAO().insertTodo(todo);

		}
//--------------------------------------------------------------------------------------------------------------------------
	}

	public void updateForm() { // 회의록 수정하기
			// 안건 추가
				for (int i = 0; i < agendaTexts.size(); i++) {
					String contents = agendaTexts.get(i);
					String agenda_no = id + i;
					String meeting_no = id;
					agenda = new Agenda(agenda_no, contents, meeting_no);
					
					
					new MeetingDAO().updateAgenda(agenda);
				}

				// minites_statesment 추가
				for (int c = 0; c < sayTexts.size(); c++) {
					Gson gson = new Gson();
					Statements statements = gson.fromJson(sayTexts.get(c), Statements.class);
					String stmt_no = id + c;
					String agenda_no = id + statements.getAgenda_no();
					String contents = statements.getContents();
					statements = new Statements(stmt_no, contents, agenda_no);

					new MeetingDAO().updateStatements(statements);
				}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				// minites_comment 추가
				for (int c = 0; c < commentObjects.size(); c++) {
					Gson gson = new Gson();
					Comments comments = gson.fromJson(commentObjects.get(c), Comments.class);
										comments.setComment_no(id + c);
					
					
					
					if (comments != null){
						new MeetingDAO().updateComment(comments);
					}else{
						new MeetingDAO().insertComment(comments);
					}
				}

				// minites_todo 추가
				for (int c = 0; c < todoObjects.size(); c++) {
					Gson gson = new Gson();
					Todo todo = gson.fromJson(todoObjects.get(c), Todo.class);
					
					//todo.setTodo_email(todo.getTodo_user() + "@comments.com");
					System.out.println("업데이트쪽" + todo);
					
					
					 // if문 아무것도 실행안됨 11월8일		
					Todo todois =new MeetingDAO().getTodo(todo.getTodo_no());
					
					if (todois.getTodo_no()!=null){
						System.out.println("투두가 이미 있는 경우임 여기는");
						new MeetingDAO().updateTodo(todo);
					} else if (todois.getTodo_no()==null) {
						todo.setTodo_no(id + c);
						new MeetingDAO().insertTodo(todo);
					}
						
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------					
					
				}
	}

	// 할일
	// 관련---------------------------------------------------------------------------------------------------
	// 할 일 목록 가져오기
	public String todolist() {
		get_user = (String) session.get("user_email");
		todoList = new MeetingDAO().getTodoList(get_user);	
		
		todoList2 = new MeetingDAO().gettodolist2(get_user); // 할 일 dday넘은 것들만
													// 가져오기
		todaycount = new MeetingDAO().todaycount(get_user); // 오늘 할 일 갯수
		futurecount = new MeetingDAO().futurecount(get_user); // 앞으로 할 일 갯수
		pastcount = new MeetingDAO().pastcount(get_user); // 지난 일 갯 수
		return SUCCESS;
	}

	// 할 일 담당자 정보 가져오기
	public String todo_userinfo() {
		//System.out.println("json되나?" + todo_no);
		participantlist = new MeetingDAO().getTodo_userinfo(todo_no); // 파라미터 값은
																		// todo_no
		return SUCCESS;
	}
	
	// 삭제하기
	public String deletetodo() {
		new MeetingDAO().deletetodo(todo_no);
		//System.out.println("삭제됨");
		return SUCCESS;
	}

	// 검색
	// 관련---------------------------------------------------------------------------------------------------
	// 검색폼으로
	public String search() {
		get_user = (String) session.get("user_email");
		return SUCCESS;
	}

	// 검색 조건, 검색어 없을 때 검색결과
	public String searchAllresult() {
		get_user = (String) session.get("user_email");
		meetingList = new MeetingDAO().getAllresult(get_user);
		return SUCCESS;
	}

	// 검색 조건, 검색어 있을 때 검색결과
	public String searchresult() {
		get_user = (String) session.get("user_email");
		// System.out.println(searchtext);
		meetingList = new MeetingDAO().getSearchresult(searchtext, searchcondition, get_user);
		// System.out.println("미팅리스트검색조건있을 때"+meetingList);
		return SUCCESS;
	}

	// 초대
	// ------------------------------------------------------------------------------------------------------------------------------------------
	public String inviteMember() {
		//System.out.println("초대하러가!");
		return SUCCESS;
	}

	// 미팅 !-- 미팅 폼으로 들어가기 -->
	public String review() {
		//System.out.println(savedid + "action 의 savedid");
		session.put("dulaid",savedid);
		String first = savedid.substring(0, 1);
		//System.out.println(first);
		if(first.equals("M")){
			
			return "fail";
		}
		meeting = new MeetingDAO().getMeetingReview(savedid);
		
		//System.out.println("찾은 미팅ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+meeting);
		
		title = meeting.getTitle();
		date_written = (meeting.getMeeting_start()).substring(0, 10);

		return SUCCESS;
	}

	public String dulagagi() {
		meeting = new MeetingDAO().getMeetingReview((String)session.get("dulaid"));
		//System.out.println(""+meeting);
		
		title = meeting.getTitle();
		date_written = (meeting.getMeeting_start()).substring(0, 10);
		return SUCCESS;
	}
	
	
	
	
	
	
	
	
	///////////////////////////
	///// GETTER AND SETTER/////
	///////////////////////////
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTodo_no() {
		return todo_no;
	}

	public void setTodo_no(String todo_no) {
		this.todo_no = todo_no;
	}

	public Todo getTodo() {
		return todo;
	}

	public void setTodo(Todo todo) {
		this.todo = todo;
	}

	public Participants getParticipants() {
		return participants;
	}

	public void setParticipants(Participants participants) {
		this.participants = participants;
	}

	public List<Todo> getTodoList() {
		return todoList;
	}

	public void setTodoList(List<Todo> todoList) {
		this.todoList = todoList;
	}

	public List<Participants> getParticipantlist() {
		return participantlist;
	}

	public void setParticipantlist(List<Participants> participantlist) {
		this.participantlist = participantlist;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public int getMeeting_count() {
		return meeting_count;
	}

	public void setMeeting_count(int meeting_count) {
		this.meeting_count = meeting_count;
	}

	public int getPartici_count() {
		return partici_count;
	}

	public void setPartici_count(int partici_count) {
		this.partici_count = partici_count;
	}

	public double getRuntime() {
		return runtime;
	}

	public void setRuntime(double runtime) {
		this.runtime = runtime;
	}

	public int getTodo_count() {
		return todo_count;
	}

	public void setTodo_count(int todo_count) {
		this.todo_count = todo_count;
	}

	public int getTodaycount() {
		return todaycount;
	}

	public void setTodaycount(int todaycount) {
		this.todaycount = todaycount;
	}

	public int getFuturecount() {
		return futurecount;
	}

	public void setFuturecount(int futurecount) {
		this.futurecount = futurecount;
	}

	public int getPastcount() {
		return pastcount;
	}

	public void setPastcount(int pastcount) {
		this.pastcount = pastcount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getId_token() {
		return id_token;
	}

	public void setId_token(String id_token) {
		this.id_token = id_token;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_occupation() {
		return user_occupation;
	}

	public void setUser_occupation(String user_occupation) {
		this.user_occupation = user_occupation;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public Map getSession() {
		return session;
	}

	public String getMeeting_end() {
		return meeting_end;
	}

	public void setMeeting_end(String meeting_end) {
		this.meeting_end = meeting_end;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}

	public List<Meeting> getTimelinelist() {
		return timelinelist;
	}

	public void setTimelinelist(List<Meeting> timelinelist) {
		this.timelinelist = timelinelist;
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

	public List<Meeting> getTodaylist() {
		return todaylist;
	}

	public void setTodaylist(List<Meeting> todaylist) {
		this.todaylist = todaylist;
	}

	public List<Meeting> getMeetingList() {
		return meetingList;
	}

	public void setMeetingList(List<Meeting> meetingList) {
		this.meetingList = meetingList;
	}

	public String getSearchtext() {
		return searchtext;
	}

	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}

	public String getSearchcondition() {
		return searchcondition;
	}

	public void setSearchcondition(String searchcondition) {
		this.searchcondition = searchcondition;
	}

	public List<Meeting> getTitlelist() {
		return titlelist;
	}

	public void setTitlelist(List<Meeting> titlelist) {
		this.titlelist = titlelist;
	}

	public String getGet_user() {
		return get_user;
	}

	public void setGet_user(String get_user) {
		this.get_user = get_user;
	}

	public List<Todo> getTodoList2() {
		return todoList2;
	}

	public void setTodoList2(List<Todo> todoList2) {
		this.todoList2 = todoList2;
	}

	public String getDate_written() {
		return date_written;
	}

	public void setDate_written(String date_written) {
		this.date_written = date_written;
	}

	public Comments getComments() {
		return comments;
	}

	public void setComments(Comments comments) {
		this.comments = comments;
	}

	public List<String> getCommentObjects() {
		return commentObjects;
	}

	public void setCommentObjects(List<String> commentObjects) {
		this.commentObjects = commentObjects;
	}

	public List<String> getTodoObjects() {
		return todoObjects;
	}

	public void setTodoObjects(List<String> todoObjects) {
		this.todoObjects = todoObjects;
	}

	public List<String> getAgendaTexts() {
		return agendaTexts;
	}

	public void setAgendaTexts(List<String> agendaTexts) {
		this.agendaTexts = agendaTexts;
	}

	public List<String> getSayTexts() {
		return sayTexts;
	}

	public void setSayTexts(List<String> sayTexts) {
		this.sayTexts = sayTexts;
	}

	public String getParti_email() {
		return parti_email;
	}

	public void setParti_email(String parti_email) {
		this.parti_email = parti_email;
	}

	public Agenda getAgenda() {
		return agenda;
	}

	public void setAgenda(Agenda agenda) {
		this.agenda = agenda;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
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

	/*
	 * public String getStmt_no() { return stmt_no; } public void
	 * setStmt_no(String stmt_no) { this.stmt_no = stmt_no; } public String
	 * getTodo_user() { return todo_user; } public void setTodo_user(String
	 * todo_user) { this.todo_user = todo_user; } public String getContents() {
	 * return contents; } public void setContents(String contents) {
	 * this.contents = contents; } public String getDuedate() { return duedate;
	 * } public void setDuedate(String duedate) { this.duedate = duedate; }
	 */
	public String getSavedid() {
		return savedid;
	}

	public void setSavedid(String savedid) {
		this.savedid = savedid;
	}

	public Statements getStatements() {
		return statements;
	}

	public void setStatements(Statements statements) {
		this.statements = statements;
	}

	public List<Agenda> getAgendaList() {
		return agendaList;
	}

	public void setAgendaList(List<Agenda> agendaList) {
		this.agendaList = agendaList;
	}

	public List<Statements> getStatementsList() {
		return statementsList;
	}

	public void setStatementsList(List<Statements> statementsList) {
		this.statementsList = statementsList;
	}

	public String getRealid() {
		return realid;
	}

	public void setRealid(String realid) {
		this.realid = realid;
	}

	public List<Invite> getInvitelist() {
		return invitelist;
	}

	public void setInvitelist(List<Invite> invitelist) {
		this.invitelist = invitelist;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	

	
	
	
}
