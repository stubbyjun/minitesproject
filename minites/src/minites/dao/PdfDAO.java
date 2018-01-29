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

public class PdfDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	SqlSession session;
	
	
	//PDF에 뿌릴 정보 가져와
	
	//미팅
	public Meeting getPdf(String meeting_no) {
		Meeting meeting = null;
		try{
			session = factory.openSession();
			meeting = session.selectOne("PdfMapper.getpdf", meeting_no);
			session.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}

		return meeting;
	}

	
	//아젠다
	
	
	//발언리트스
	
	public List<Statements> getStmtlist(String agenda_no) {
		List<Statements> stmtlist = null;
		try{
			session = factory.openSession();
			stmtlist = session.selectList("PdfMapper.getStmt", agenda_no );
			session.commit();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}
		
		
		return stmtlist;
	}

	

	//할일리스트
	public List<Todo> getTodo(String stmt_no) {
		List<Todo> todolist = null;
		
		try{
			session = factory.openSession();
			todolist = session.selectList("PdfMapper.getTodo", stmt_no);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}		
		
		return todolist;
	}


	
	

	//코멘트
	public List<Comments> getComments(String stmt_no) {
		List<Comments> comments = null;
		try{
			session = factory.openSession();
			comments = session.selectList("PdfMapper.getComments", stmt_no);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}
		return comments;
	}


	public List<Agenda> getAdendalist(String meeting_no) {
		List<Agenda> alist = null;
		try{
			session = factory.openSession();
			alist = session.selectList("PdfMapper.getAgenda",meeting_no);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(session != null)session.close();
		}
		
		return alist;
	}



	

	
}