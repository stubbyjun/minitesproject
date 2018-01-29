package minites.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import minites.common.MybatisConfig;
import minites.vo.Agenda;
import minites.vo.Comments;
import minites.vo.Invite;
import minites.vo.Join;
import minites.vo.Meeting;
import minites.vo.Participants;
import minites.vo.Statements;
import minites.vo.Todo;
import minites.vo.Users;

public class MeetingDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	SqlSession session;
	int k=0;
	
	// 미팅 정보 가져오기
		public int getMeeting(String get_user) {
			int meeting_count = 0;
			try{
				session = factory.openSession();
				meeting_count = session.selectOne("MeetingMapper.meeting_info",get_user);
				//System.out.println(meeting_count);
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}
			return meeting_count;
		}

		public int getPartici(String get_user) {
			int partici_count = 0;
			try{
				session = factory.openSession();
				partici_count = session.selectOne("MeetingMapper.partici_info",get_user);
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}
			return partici_count;
		}

		/*public int getRuntime() {
			int runtime = 0;
			try{
				session = factory.openSession();
				runtime = session.selectOne("MeetingMapper.runtime_info");
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}
			return runtime;
		}*/

		public int getTodocount(String get_user) {
			int todo_count = 0;
			try{
				session = factory.openSession();
				todo_count = (int)session.selectOne("MeetingMapper.todo_info",get_user);
				//System.out.println(todo_count+"daotodocount");
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session != null)session.close();
			}
			return todo_count;
		}

	// 할 일 목록 가져오기
		public List<Todo> getTodoList(String get_user) {
			List<Todo> todolist = null;
			try {
				session = factory.openSession();
				todolist = session.selectList("MeetingMapper.todolist", get_user);
				//System.out.println("여기는 dao 투두리스트"+todolist);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return todolist;
		}
	// 할 일 dday넘은 것들만 가져오기
		public List<Todo> gettodolist2(String get_user) {
			List<Todo> todolist2 = null;
			try {
				session = factory.openSession();
				todolist2 = session.selectList("MeetingMapper.todolist2",get_user);
				//System.out.println(todolist+"여기는 dao");
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return todolist2;
		}	
	// 할 일 담당자 정보 가져오기
		public List<Participants> getTodo_userinfo(String todo_no) {
			List<Participants> participants = null;
			try {
				session = factory.openSession();
				participants = session.selectList("MeetingMapper.todo_userinfo", todo_no);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return participants;
		}
		
	// 할 일 삭제	
		public void deletetodo(String todo_no) {
			try {
				session = factory.openSession();
				session.delete("MeetingMapper.deletetodo", todo_no);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
		}
		
	// 오늘 마감인 할 일 갯 수 구하기		
		public int todaycount(String get_user){
			int todaycount = 0;
			try {
				session = factory.openSession();
				todaycount = session.selectOne("MeetingMapper.todaycount",get_user);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return todaycount;
		}
		
	// 앞으로 할 일 갯 수 구하기	
		public int futurecount(String get_user) {
			int futurecount = 0;
			try {
				session = factory.openSession();
				futurecount = session.selectOne("MeetingMapper.futurecount",get_user);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return futurecount;
		}
	
	// 지난 일 갯 수 구하기
		public int pastcount(String get_user) {
			int pastcount = 0;
			try {
				session = factory.openSession();
				pastcount = session.selectOne("MeetingMapper.pastcount",get_user);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return pastcount;
		}
		
	// 멤버 가입
		public void join_member(String user_name, String user_email) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_name", user_name);
			map.put("user_email", user_email);
			
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.join_member", map);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
		}
	
	// 가입한 회원인지 아닌지? 
		public Users searchUser(String user_email) {
			Users users = null;
			try{
				session = factory.openSession();
				users = session.selectOne("MeetingMapper.search_user",user_email);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return users;
		}

	// 멤버 추가정보
		public void member_info(String user_phone, String user_email) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_phone", user_phone);
			map.put("user_email", user_email);
			
			try{
				session = factory.openSession();
				session.update("MeetingMapper.member_info",map);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
		}
		
		// 회의 일정 추가
		public void insertschedule(Meeting meeting) {
System.out.println(4);
			try{
				session = factory.openSession();
				int i = session.insert("MeetingMapper.insertschedule",meeting);
				System.out.println(5);
				//System.out.println("★★★★★★★★★★★★추가되는 일정" + i+"개");
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
		}
		
		
		//타임라인 불러오기
		public List<Meeting> getTimelinelist(String get_user) {
			List<Meeting> timelinelist1 = null;
			List<Meeting> timelinelist2= null;
			List<Meeting> timelinelist = new ArrayList<Meeting>();
			try{
				session = factory.openSession();
				timelinelist1 = session.selectList("MeetingMapper.timelinelist",get_user);
				timelinelist2 = session.selectList("MeetingMapper.timelinelist_me",get_user);
				timelinelist.addAll(timelinelist1);
				timelinelist.addAll(timelinelist2);
				
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
			return timelinelist;
		
		}
		
		//오늘 미팅
		public List<Meeting> getTodaylist(String get_user) {
			List<Meeting> todaylist1 = null;
			List<Meeting> todaylist2 = null;
			List<Meeting> todaylist = new ArrayList<Meeting>();
			try{
				session = factory.openSession();
				todaylist1 = session.selectList("MeetingMapper.todaylist",get_user);
				todaylist2 = session.selectList("MeetingMapper.todaylist_me",get_user);
				todaylist.addAll(todaylist1);
				todaylist.addAll(todaylist2);
				
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
			return todaylist;
		}

		// 검색 조건, 검색어 없을 때 검색결과
		public List<Meeting> getAllresult(String get_user) {
			List<Meeting> meetingList = null;
			try{
				session = factory.openSession();
				meetingList = session.selectList("MeetingMapper.searchall", get_user);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return meetingList;
		}
		
		// 검색 조건, 검색어 있을 때 검색 결과
		public List<Meeting> getSearchresult(String searchtext, String searchcondition, String get_user) {
			//System.out.println("여기는 서치결과 dao");
			List<Meeting> meetingList = null;
			//System.out.println(searchcondition+"검색조건디에이오");
			HashMap<String, Object> map = new HashMap<>();
			map.put("searchtext", searchtext);
			//map.put("searhcondition", searchcondition);
			map.put("get_user", get_user);
			try{
				session = factory.openSession();
					if(searchcondition.equals("title")) {
						//System.out.println(searchcondition+"은 뭐냐");
						meetingList = session.selectList("MeetingMapper.searchtitle",map);
					} else if (searchcondition.equals("place")) {
						meetingList = session.selectList("MeetingMapper.searchplace",map);
					} else if (searchcondition.equals("a_title")) {//원래 a_contents (안건내용임) - 변경됨
						meetingList = session.selectList("MeetingMapper.searcha_title",map);
					} else if (searchcondition.equals("contents")) {
						meetingList = session.selectList("MeetingMapper.searchcontents",map);
					} 
				/*}*/
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return meetingList;
		}
		
		
		public List<Meeting> getTitlelist(String get_user) {
			List<Meeting> titlelist = null;
			try{
				session = factory.openSession();
				titlelist = session.selectList("MeetingMapper.titlelist",get_user);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(session != null) session.close();
			}
		
			return titlelist;			
		}

		
		// 안쓰는 듯..
		public Users getUserinfo(String get_user) {
			Users user = null;
				try{
					session = factory.openSession();
					user = session.selectOne("MeetingMapper.getUserinfo", get_user);
					session.commit();
					
				}catch (Exception e) {
					e.printStackTrace();
				} finally {
					if(session != null) session.close();
				}
				
			return user;
		}
		

		public void insert_partiemail(String string, String string2) {
			HashMap<Object,Object> map = new HashMap<Object, Object>();
			map.put("email", string);
			map.put("name", string2);
			
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.insert_partiemail", map);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}

		}
		
		// 미팅 번호 진짜 번호로 업데이트 
				public void updateMeeting(String mno, String id) {
					HashMap<String, Object> map = new HashMap<>();
					map.put("mno", mno);
					//System.out.println("dao쪽 mno"+mno);
					map.put("id", id);
			
					try{
						session = factory.openSession();
						session.update("MeetingMapper.updateMeeting", map);
						session.commit();
					}catch (Exception e) {
						e.printStackTrace();
					} finally {
						if(session != null) session.close();
					}
					
				}
				
				// 미팅에 골 추가
				public void updateGoal(String id, String goal) {
					HashMap<String, Object> map = new HashMap<>();
					map.put("goal", goal);
					map.put("id", id);
			
					try{
						session = factory.openSession();
						session.update("MeetingMapper.updateGoal", map);
						session.commit();
					}catch (Exception e) {
						e.printStackTrace();
					} finally {
						if(session != null) session.close();
					}
					
				}
				
		// 안건 추가
		public void insertAgenda(Agenda agenda) {
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.insertAgenda", agenda);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
		}
		
		// 발언 추가
		public void insertStatements(Statements statements) {
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.insertStatements", statements);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
		}
		
		// 할 일 추가
		public void insertTodo(Todo todo) {
			try{
				session = factory.openSession();
				//System.out.println("dao의 insertTodo"+todo);
				session.insert("MeetingMapper.insertTodo", todo);	
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
		}

		// 커멘트 추가
		public void insertComment(Comments comments) {
			try{
				session = factory.openSession();
				//System.out.println("dao의 insertComment"+comments);
				session.insert("MeetingMapper.insertComment", comments);
				
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
		}
		
		//참석자 자동완성 검색
		public List<Invite> addPerson(String email, String get_user) {
			List<Invite> inviteList=new ArrayList<Invite>();
			List<Invite> inviteList1=null;
			List<Invite> inviteList2=null;
			HashMap<String, Object> map = new HashMap<>();
			map.put("email", email);
			map.put("get_user", get_user);
			
			try{
				session = factory.openSession();
				
				inviteList1 = session.selectList("MeetingMapper.addPerson", map);
				inviteList2 = session.selectList("MeetingMapper.addPerson_email", map);
				inviteList.addAll(inviteList1);
				inviteList.addAll(inviteList2);
				session.commit();
				
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
			return inviteList;
		}
		
		// 미팅 내용 보러, 수정하러 들어가기 
		public Meeting getMeetingReview(String savedid) {
			Meeting meeting = null;
			try{
				session = factory.openSession();
				//System.out.println("DAO의 SAVEDID"+savedid);
				meeting = session.selectOne("MeetingMapper.getMeetingReview", savedid);
				//System.out.println("savedid로 찾은 meeting"+meeting);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
			return meeting;
			
		}

		//참석자 검색 후 추가
		public void insertperson(String email, String get_user, String meeting_no) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("email", email); //참석자 ID
			map.put("get_user", get_user);//USER_ID
			map.put("meeting_no", meeting_no);//미팅 넘버
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.insertperson", map);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
		}
		
		//참석자 리스트 가져오기
		public List<Join> joinList(String meeting_no) {
			List<Join> joinList=null;
			try{
				session = factory.openSession();
				
				joinList = session.selectList("MeetingMapper.joinList", meeting_no);
				session.commit();
				
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return joinList;
		}

		// 안건들 가져오기
		public List<Agenda> selectAgenda(String id) {
			List<Agenda> agendaList = null;
			try{
				session = factory.openSession();
				agendaList = session.selectList("MeetingMapper.selectAgenda", id);
				//System.out.println(id + "니가 dao에서 찾은 아젠다"+ agendaList);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
			return agendaList;
		}
		
		// 발언들 가져오기
		public List<Statements> selectStatements(String id) {
			List<Statements> statementsList = null;
				try{
					session = factory.openSession();
					statementsList = session.selectList("MeetingMapper.selectStatements", id);
					session.commit();			
				}catch (Exception e) {
					e.printStackTrace();
				} finally {
					if(session != null) session.close();
				}	
			return statementsList;
		}

		
		// 안건 업데이트
		public int updateAgenda(Agenda agenda) {
			int i = 0;
			try{
				session = factory.openSession();
				i = session.update("MeetingMapper.updateAgenda", agenda);
				//System.out.println(i+"어젠다 수정됨ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
			return i;
		}
		// 발언 내용 업데이트
		public void updateStatements(Statements statements) {
			try{
				session = factory.openSession();
				session.update("MeetingMapper.updateStatements", statements);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}
		// 커멘트 내용 업데이트
		public void updateComment(Comments comments) {
			try{
				session = factory.openSession();
				session.update("MeetingMapper.updateComment", comments);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}
		
		// 할 일 내용 업데이트
		public void updateTodo(Todo todo) {
			try{
				session = factory.openSession();
				session.update("MeetingMapper.updateTodo", todo);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}

		public Meeting showMinites(String meeting_no) {
			Meeting meeting = null;
			try{
				session = factory.openSession();
				meeting = session.selectOne("MeetingMapper.showMinites", meeting_no);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
			return meeting;
		}

		public void insertParticipants(Participants participants) {
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.insertParticipants", participants);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}

		public void insertJoin(Join joiner) {
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.insertJoin", joiner);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}

		public void insertinvite(String get_user, String email) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("get_user", get_user);
			map.put("email", email);
			
			//System.out.println("invite실행횟수: " +(k++));
			try{
				session = factory.openSession();
				session.insert("MeetingMapper.insertinvite", map);
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}

		public List<Invite> getFriendList(String get_user) {
			List<Invite> friendList = null;
			
				try{
					session = factory.openSession();
					friendList = session.selectList("MeetingMapper.getFriendList", get_user);
					session.commit();			
				}catch (Exception e) {
					e.printStackTrace();
				} finally {
					if(session != null) session.close();
				}	
			return friendList;
		}

		public void deleteTodos(String stmt_no) {
			//System.out.println("todo 다지워랑");
			try{
				session = factory.openSession();
				int i = session.delete("MeetingMapper.deleteTodos", stmt_no);
				//System.out.println(i+"커멘트 다지워짐");
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}

		public void deleteComments(String stmt_no) {
			//System.out.println("comment 다지워랑");
			try{
				session = factory.openSession();
				int i = session.delete("MeetingMapper.deleteComments", stmt_no);
				//System.out.println(i+"커멘트 다지워짐");
				session.commit();			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
		}

		
		public List<Invite> getInvitelist(String get_user) {
			List<Invite> invitelist = null;
			try{
				session = factory.openSession();
				invitelist = session.selectList("MeetingMapper.getInvitelist", get_user);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
			
			return invitelist;
		}
			
		// 투두 정보 가져오기
		public Todo getTodo(String todo_no) {
			Todo todo = null;
			try{
				session = factory.openSession();
				todo = session.selectOne("MeetingMapper.getTodo",todo_no);
				session.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}	
			return todo;
		}

	
				

}
		

