package minites.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import minites.dao.MeetingDAO;
import minites.vo.Invite;
import minites.vo.Join;
import minites.vo.Participants;
import minites.vo.Users;

public class AddPersonAction extends ActionSupport implements SessionAware{
	
	String email;
	List<Invite> inviteList;
	String get_user;
	Map session;
	String meeting_no;
	List<Join> joinList;
	List<Participants> slavelist;
	Participants participants;
	String phone;
	String name;
	Join joiner;
	
	
	//자동완성검색
	public String addPerson(){
		MeetingDAO dao = new MeetingDAO();
		get_user = (String) session.get("user_email");
		inviteList=dao.addPerson(email,get_user);
		
		return SUCCESS;
	}
	
	//친구추가 join table에 정보 추가
	public String insertperson(){
		
		MeetingDAO dao = new MeetingDAO();
		get_user = (String) session.get("user_email");
		//System.out.println("참석자 추가:"+meeting_no);
		
		if(meeting_no!=null&&get_user!=null&&email!=null){
			//System.out.println("참석자 추가 성공 :"+meeting_no);
			dao.insertperson(email,get_user,meeting_no);//email: Participants_id
			
			return SUCCESS;
		}else{

			return SUCCESS;
		}
	}
	
	//참석자 리스트 가져오기 join table
	
	public String joinList(){
		slavelist = new ArrayList<>();
		MeetingDAO dao = new MeetingDAO();
			
		if(meeting_no!=null){
		// 미팅 넘버가 널이 아니다. 이미 만들어진 미팅에 초대 되었을 경우.		
				joinList=dao.joinList(meeting_no);
				
				for(Join j: joinList) {
					Participants part = new Participants();
					part.setEmail(j.getParticipants_id());
					part.setName(j.getName());
					slavelist.add(part);
				}
				
				get_user = (String) session.get("user_email");

				if(get_user != null){
					Users user = dao.getUserinfo(get_user);
					Participants inviter = new Participants();	
						inviter.setName(user.getName());
						inviter.setEmail(user.getEmail());
					slavelist.add(inviter);
				}
		}else{ 
			//미팅 넘버가 널이다. 새로 만들어진 미팅이다.
			
		}
			
			return SUCCESS;
			
	}
		

	public String createPartici() {
		MeetingDAO dao = new MeetingDAO();
		
		participants = new Participants(email, name, phone, meeting_no);
		dao.insertParticipants(participants);
		
		String get_user = (String)session.get("user_email");
	
		joiner =  new Join(get_user, meeting_no, email);

		dao.insertJoin(joiner);

		inviteList = dao.getFriendList(get_user);
			if(inviteList.size()!=0){
		
				boolean check = false;
				
				for(Invite i : inviteList) {
					//System.out.println("포문 안 ");
					if(!(i.getParticipants_id().equals(email))){
						check=true;
					}
				}
				
				if(check==true){
					//System.out.println("체크가 트루일때");
					dao.insertinvite(get_user,email);
				}
			} else {
				//System.out.println("인바이트 리스틍ㅇㅇㅇ"+get_user+"이메일은"+email);
				dao.insertinvite(get_user,email);
			}
				
		
		return SUCCESS;
	}

	
	public List<Invite> getInviteList() {
		return inviteList;
	}

	public void setInviteList(List<Invite> inviteList) {
		this.inviteList = inviteList;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
		
	public String getGet_user() {
		return get_user;
	}

	public void setGet_user(String get_user) {
		this.get_user = get_user;
	}

	public String getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;		
	}

	public List<Join> getJoinList() {
		return joinList;
	}

	public void setJoinList(List<Join> joinList) {
		this.joinList = joinList;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Participants getParticipants() {
		return participants;
	}

	public void setParticipants(Participants participants) {
		this.participants = participants;
	}

	public Join getJoiner() {
		return joiner;
	}

	public void setJoiner(Join joiner) {
		this.joiner = joiner;
	}

	public List<Participants> getSlavelist() {
		return slavelist;
	}

	public void setSlavelist(List<Participants> slavelist) {
		this.slavelist = slavelist;
	}
	
		
}
