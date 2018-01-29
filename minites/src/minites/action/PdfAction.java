package minites.action;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.itextpdf.awt.geom.Rectangle;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;

import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionSupport;

import minites.dao.MeetingDAO;
import minites.dao.PdfDAO;
import minites.vo.Agenda;
import minites.vo.Comments;
import minites.vo.Meeting;
import minites.vo.Statements;
import minites.vo.Todo;
import pdf.Style;


public class PdfAction extends ActionSupport implements SessionAware{
	private static Map<String, Object> session;
	String meeting_no; //미팅 넘버를 가져와서 검색해
	String form_no; //폼넘버를 가져와서 분기처리!
	String file;
	Meeting meeting; //미팅객체
	Agenda agenda; //안건
	Statements stmt; //발언
	
	Todo todo; //할일
	Comments comments; //의견
	
	List<Statements> stmtlist;
	List<Todo> todolist;
	HttpServletResponse response;

	
	public String pdfout() {
		//System.out.println("아 옘병할!!!!!!!!!!!!!!!!");
		//System.out.println("meeting_no:" + meeting_no);
		
		
		PdfDAO dao = new PdfDAO();

		//미팅구해와
		meeting = dao.getPdf(meeting_no);
		session.put("meeting", meeting);
		//System.out.println("액션미팅:" + meeting);
		
		
		
		//아젠다 불러옴 
		List<Agenda> agendalist = dao.getAdendalist(meeting_no);
		session.put("alist", agendalist);
		
		
		
		///// step 1 문서 생성 /////
		Document document = new Document();
		document.setPageSize(PageSize.A4);

		
		///// step 2 /////
		// 파일 및 파일 명 생성 
		// 파일명 중복ㄴㄴ
		int i = 0;
		int j = 0;
		i = (int) (Math.random() * 10);
		j++;

		String fileName = "pdfFile" + i + "_minites";
		file = "D:/" + fileName + ".pdf";


		
		
		
		/////경로설정/////
		
		try {
			PdfWriter.getInstance(document, new FileOutputStream(file));
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		///// step 3 /////
		//파일 열기
		document.open();

		///// step 4 create PDF contents /////
		try {
			if(form_no.equals("1")){
				document.add(PdfAction.createTable());
			}else{
				document.add(PdfAction.createTable2());
			}
			
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		///// step 5 /////
		document.close();
		// 파일 닫기 

		//System.out.println("PDF Created!");
		
		return SUCCESS;	
	}

	public static PdfPTable createTable() throws DocumentException, IOException {
		//폼 1 
		
		
		//미팅
		Meeting meeting = (Meeting) session.get("meeting");
		


		///// 한글 폰트/////
		BaseFont objBaseFont = BaseFont.createFont("c:/windows/fonts/MALGUN.TTF", BaseFont.IDENTITY_H,
				BaseFont.EMBEDDED);

		Font font = new Font(objBaseFont, 12);
		Font font_32 = new Font(objBaseFont, 32);
		Font font_28 = new Font(objBaseFont, 28);
		Font font_24 = new Font(objBaseFont, 24);

		///// 테이블 구조 만들기 /////
		PdfPTable table = new PdfPTable(new float[] { 1, 1, 1, 1, 1, 1 });
		table.setTotalWidth(500f);
		table.setLockedWidth(true);

		PdfPCell cell = new PdfPCell(new Phrase("회 의 록", font_28));

		/* table.addCell(createValueCell1("미팅날짜",font)); */
		

		// 회의록
		cell = new PdfPCell(new Paragraph("회 의 록", font_24));
		cell.setFixedHeight(30);
		cell.setColspan(6);
		table.addCell(cell);
		
		// row1 일시, 장소, 런타임 
		cell = new PdfPCell(new Paragraph("미팅날짜", font));
		cell.setFixedHeight(40);
		table.addCell(cell);

		String meetingDate = meeting.getMeeting_start();
		String newMeetingDate = meetingDate.substring(0, 10);
		String newMeetingHour = meetingDate.substring(11,19);
		String newMettingInput = newMeetingDate + "\n" + newMeetingHour;		
		cell = new PdfPCell(new Paragraph(newMettingInput, font));
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph("장소", font));
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph(meeting.getPlace(), font));
		table.addCell(cell);
		
		cell = new PdfPCell(new Paragraph("런타임", font));
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph("AM 10 : 30" + "\n" + "AM 12 : 00", font));
		table.addCell(cell);

		// row2 제목 
		cell = new PdfPCell(new Paragraph("제목", font));
		cell.setFixedHeight(30);
		cell.setColspan(1);
		table.addCell(cell);
		
		cell = new PdfPCell(new Paragraph(meeting.getTitle(), font));
		cell.setColspan(5);
		table.addCell(cell);

		// row3 목표

		cell = new PdfPCell(new Paragraph("미팅목표", font));
		cell.setFixedHeight(30);
		table.addCell(cell);
		cell.setColspan(1);
		
		cell = new PdfPCell(new Paragraph(meeting.getGoal(), font));
		cell.setColspan(5);
		table.addCell(cell);
		

		// row4-1 내용 제목 부분 
		cell = new PdfPCell(new Paragraph("미팅내용", font));
		cell.setFixedHeight(500);
		cell.setColspan(1);
		table.addCell(cell);
		 

			// inner Table 작성 
			
			PdfPTable innerTable = new PdfPTable(new float[] { 1, 1, 1, 1, 1, 1, 1, 1});
			innerTable.setTotalWidth(410f);
			innerTable.setLockedWidth(true);
			
			List<Agenda> agendalist = (List<Agenda>) session.get("alist");
			//System.out.println("아젠다 리스트 크기 : " + agendalist.size());
			for(int i = 0 ;i<agendalist.size();i++){
				
				// 어젠다 내용 가져오기.
				Agenda agendaTemp = agendalist.get(i);
				String agenda_no = agendaTemp.getAgenda_no();
				String agenda_contents = agendaTemp.getContents();
				//System.out.println("agenda_no " + i + " : " + agenda_no);
				// 안건 등록
						cell = new PdfPCell(new Paragraph("▷안건", font));
						cell.setBorder(0);
						cell.setFixedHeight(20);
						innerTable.addCell(cell);
						
						String agendaText = (i+1) +")" + agenda_contents;
								
						cell = new PdfPCell(new Paragraph(agendaText, font));
						cell.setBorder(0);
						cell.setColspan(7);
						innerTable.addCell(cell);
				
				//발언  리스트 불러옴 
				PdfDAO dao = new PdfDAO();
				List<Statements> stmtlist = dao.getStmtlist(agenda_no);
				//System.out.println("stmtlist.size() : " + stmtlist.size());
				if(stmtlist.size() > 0){	
					for(int c = 0 ; c < stmtlist.size() ; c++){
						
						//발언 내용 가져오기.
						Statements stmtTemp = stmtlist.get(c);
						String stmt_no = stmtTemp.getStmt_no();
						String stmt_contents = stmtTemp.getContents();
						//System.out.println("stmt_no "+c+ " : " + stmt_no);
						
						//발언 등록
							cell = new PdfPCell(new Paragraph("", font));
							cell.setFixedHeight(20);
							cell.setBorder(0);
							innerTable.addCell(cell);
							
							cell = new PdfPCell(new Paragraph("▶발언", font));
							cell.setFixedHeight(20);
							cell.setBorder(0);
							innerTable.addCell(cell);
							
							String stmtText = (c+1) + ")" + stmt_contents;
							
							cell = new PdfPCell(new Paragraph(stmtText, font));
							cell.setColspan(6);
							cell.setBorder(0);
							innerTable.addCell(cell);
						
						//TODO 리스트 불러옴
						List<Todo> todolist = dao.getTodo(stmt_no);
						//System.out.println("todolist.size() : " + todolist.size());
						if(todolist.size() > 0){
						for(int d = 0 ; d < todolist.size() ; d++){
							Todo todoTemp = todolist.get(d);
							
							// 할일 내용 가져오기 
							String todo_no = todoTemp.getTodo_no();
							String todo_user = todoTemp.getTodo_user();
							String todo_duedate = todoTemp.getDuedate();
							String todo_contents = todoTemp.getContents();
							//System.out.println("todo_no "+d+ " : " + todo_no);
							
							
							//할일 등록
							cell = new PdfPCell(new Paragraph("", font));
							cell.setFixedHeight(20);
							cell.setColspan(2);
							cell.setBorder(0);
							innerTable.addCell(cell);
							
							cell = new PdfPCell(new Paragraph("◎할일", font));
							cell.setFixedHeight(20);
							cell.setBorder(0);
							innerTable.addCell(cell);
							
							String todoText = "·"+ todo_user + " : " + todo_contents + "  ·마감일 : " + todo_duedate;
							
							cell = new PdfPCell(new Paragraph(todoText, font));
							cell.setColspan(6);
							cell.setBorder(0);
							innerTable.addCell(cell);
						}
						}
						
						
						
						//커멘트 리스트 불러옴
						//System.out.println("커멘트 리스트를 불러오장");
						List<Comments> commentslist = dao.getComments(stmt_no);
						//System.out.println("commentslist.size() : " + commentslist.size());
						if(commentslist.size() > 0){
						for(int d = 0 ; d < commentslist.size() ; d++){
							Comments commentsTemp = commentslist.get(d);
							//커멘트 내용 불러오기
							String comments_no = commentsTemp.getComment_no();
							String comments_user = commentsTemp.getComment_user();
							String comments_contents = commentsTemp.getContents();
							
							//System.out.println("comments_no "+d+ " : " + comments_no);
							
							//코멘트 등록
							
							cell = new PdfPCell(new Paragraph("", font));
							cell.setFixedHeight(20);
							cell.setColspan(2);
							cell.setBorder(0);
							innerTable.addCell(cell);
							
							cell = new PdfPCell(new Paragraph("◇의견", font));
							cell.setFixedHeight(20);
							cell.setBorder(0);
							innerTable.addCell(cell);
							
							String commentText = "·" + comments_user + " : " + comments_contents;
							
							cell = new PdfPCell(new Paragraph(commentText, font));
							cell.setColspan(6);
							cell.setBorder(0);
							innerTable.addCell(cell);
						}
						}
					}
						
			}
			}
			
		// row4-2 내용 실제 내용
		
		cell = new PdfPCell(innerTable);
		cell.setColspan(5);
		table.addCell(cell);
				
			
		


		return table;
	}

	
	
	
	//////////////////////////////////
	///							   ///
	///		 	테이블 2만들기!		   ///
	///							   ///
	//////////////////////////////////
	
	
	
	public static PdfPTable createTable2() throws DocumentException, IOException {

		Meeting meeting = (Meeting) session.get("meeting");

		// 지은폰트

		///// 폰트/////
		BaseFont objBaseFont = BaseFont.createFont("c:/windows/fonts/MALGUN.TTF", BaseFont.IDENTITY_H,
				BaseFont.EMBEDDED);

		Font font = new Font(objBaseFont, 12);
		Font font_32 = new Font(objBaseFont, 32);
		Font font_24 = new Font(objBaseFont, 24);

		PdfPTable table = new PdfPTable(new float[] { 1, 3, 1, 2, 1, 2 });
		table.setTotalWidth(500f);
		table.setLockedWidth(true);

		PdfPCell cell = null;
		
		// 회의록!
		cell = new PdfPCell(new Paragraph("회의록",font_24));
		cell.setColspan(6);
		cell.setFixedHeight(30);
		cell.setGrayFill(0.9f);
		table.addCell(cell);

		// table1- row1 일시, 장소
		cell = new PdfPCell(new Paragraph("미팅"+ "\n" +"날짜",font));
		cell.setFixedHeight(30);
		cell.setGrayFill(0.9f);
		table.addCell(cell);

		String meetingDate = meeting.getMeeting_start();
		String newMeetingDate = meetingDate.substring(0, 10);
		String newMeetingHour = meetingDate.substring(11,19);
		String newMettingInput = newMeetingDate + "\n" + newMeetingHour;		
		cell = new PdfPCell(new Paragraph(newMettingInput, font));
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph("장소",font));
		cell.setFixedHeight(30);
		cell.setGrayFill(0.9f);
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph(meeting.getPlace(),font));
		cell.setFixedHeight(30);
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph("런타임",font));
		cell.setFixedHeight(30);
		cell.setGrayFill(0.9f);
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph("AM 10 : 30" + "\n" + "AM 12 : 00",font));
		cell.setFixedHeight(30);
		table.addCell(cell);

		// table1- row2 참석자
		cell = new PdfPCell(new Paragraph("제목",font));
		cell.setFixedHeight(30);
		cell.setGrayFill(0.9f);
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph(meeting.getTitle(),font));
		cell.setColspan(5);
		table.addCell(cell);

		// row3 - 공백
		cell = new PdfPCell(new Paragraph(" "));
		cell.setColspan(6);
		table.addCell(cell);

		// row4 - 회의 안건
		cell = new PdfPCell(new Paragraph("미팅"+ "\n" +"목표",font));
		cell.setFixedHeight(30);
		cell.setGrayFill(0.9f);
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph(meeting.getGoal(),font));
		cell.setColspan(5);
		table.addCell(cell);

		// row5 - 공백
		cell = new PdfPCell(new Paragraph(" "));
		cell.setColspan(6);
		table.addCell(cell);

		// row6 - 회의내용
		cell = new PdfPCell(new Paragraph("미팅"+ "\n" +"내용",font));
		cell.setFixedHeight(400);
		cell.setGrayFill(0.9f);
		cell.setRowspan(2);
		table.addCell(cell);

		cell = new PdfPCell(new Paragraph("Context",font));
		cell.setColspan(5);
		table.addCell(cell);
		
	
		// inner Table 작성 
		
					PdfPTable innerTable = new PdfPTable(new float[] { 1, 1, 1, 1, 1, 1, 1, 1});
					innerTable.setTotalWidth(410f);
					innerTable.setLockedWidth(true);
					
					List<Agenda> agendalist = (List<Agenda>) session.get("alist");
					//System.out.println("아젠다 리스트 크기 : " + agendalist.size());
					for(int i = 0 ;i<agendalist.size();i++){
						
						// 어젠다 내용 가져오기.
						Agenda agendaTemp = agendalist.get(i);
						String agenda_no = agendaTemp.getAgenda_no();
						String agenda_contents = agendaTemp.getContents();
						//System.out.println("agenda_no " + i + " : " + agenda_no);
						// 안건 등록
								cell = new PdfPCell(new Paragraph("▷안건", font));
								cell.setBorder(0);
								cell.setFixedHeight(20);
								innerTable.addCell(cell);
								
								String agendaText = (i+1) +")" + agenda_contents;
										
								cell = new PdfPCell(new Paragraph(agendaText, font));
								cell.setBorder(0);
								cell.setColspan(7);
								innerTable.addCell(cell);
						
						//발언  리스트 불러옴 
						PdfDAO dao = new PdfDAO();
						List<Statements> stmtlist = dao.getStmtlist(agenda_no);
						//System.out.println("stmtlist.size() : " + stmtlist.size());
						if(stmtlist.size() > 0){	
							for(int c = 0 ; c < stmtlist.size() ; c++){
								
								//발언 내용 가져오기.
								Statements stmtTemp = stmtlist.get(c);
								String stmt_no = stmtTemp.getStmt_no();
								String stmt_contents = stmtTemp.getContents();
								//System.out.println("stmt_no "+c+ " : " + stmt_no);
								
								//발언 등록
									cell = new PdfPCell(new Paragraph("", font));
									cell.setFixedHeight(20);
									cell.setBorder(0);
									innerTable.addCell(cell);
									
									cell = new PdfPCell(new Paragraph("▶발언", font));
									cell.setFixedHeight(20);
									cell.setBorder(0);
									innerTable.addCell(cell);
									
									String stmtText = (c+1) + ")" + stmt_contents;
									
									cell = new PdfPCell(new Paragraph(stmtText, font));
									cell.setColspan(6);
									cell.setBorder(0);
									innerTable.addCell(cell);
								
								//TODO 리스트 불러옴
								List<Todo> todolist = dao.getTodo(stmt_no);
								//System.out.println("todolist.size() : " + todolist.size());
								if(todolist.size() > 0){
								for(int d = 0 ; d < todolist.size() ; d++){
									Todo todoTemp = todolist.get(d);
									
									// 할일 내용 가져오기 
									String todo_no = todoTemp.getTodo_no();
									String todo_user = todoTemp.getTodo_user();
									String todo_duedate = todoTemp.getDuedate();
									String todo_contents = todoTemp.getContents();
									//System.out.println("todo_no "+d+ " : " + todo_no);
									
									
									//할일 등록
									cell = new PdfPCell(new Paragraph("", font));
									cell.setFixedHeight(20);
									cell.setColspan(2);
									cell.setBorder(0);
									innerTable.addCell(cell);
									
									cell = new PdfPCell(new Paragraph("◎할일", font));
									cell.setFixedHeight(20);
									cell.setBorder(0);
									innerTable.addCell(cell);
									
									String todoText = "·"+ todo_user + " : " + todo_contents + "  ·마감일 : " + todo_duedate;
									
									cell = new PdfPCell(new Paragraph(todoText, font));
									cell.setColspan(6);
									cell.setBorder(0);
									innerTable.addCell(cell);
								}
								}
		
								
								//커멘트 리스트 불러옴
								//System.out.println("커멘트 리스트를 불러오장");
								List<Comments> commentslist = dao.getComments(stmt_no);
								//System.out.println("commentslist.size() : " + commentslist.size());
								if(commentslist.size() > 0){
								for(int d = 0 ; d < commentslist.size() ; d++){
									Comments commentsTemp = commentslist.get(d);
									//커멘트 내용 불러오기
									String comments_no = commentsTemp.getComment_no();
									String comments_user = commentsTemp.getComment_user();
									String comments_contents = commentsTemp.getContents();
									
									//System.out.println("comments_no "+d+ " : " + comments_no);
									
									//코멘트 등록
									
									cell = new PdfPCell(new Paragraph("", font));
									cell.setFixedHeight(20);
									cell.setColspan(2);
									cell.setBorder(0);
									innerTable.addCell(cell);
									
									cell = new PdfPCell(new Paragraph("◇의견", font));
									cell.setFixedHeight(20);
									cell.setBorder(0);
									innerTable.addCell(cell);
									
									String commentText = "·" + comments_user + " : " + comments_contents;
									
									cell = new PdfPCell(new Paragraph(commentText, font));
									cell.setColspan(6);
									cell.setBorder(0);
									innerTable.addCell(cell);
								}
							}
						}
								
					}
				}
					
				
										
		// row6 내용 실제 내용
		cell = new PdfPCell(innerTable);
		cell.setColspan(5);
		table.addCell(cell);	



		return table;
	}

	// create cells
	private static PdfPCell createLabelCell(String text) throws DocumentException, IOException {
		// font
		// Font font = new Font(FontFamily.HELVETICA, 8, Font.BOLD,
		// BaseColor.DARK_GRAY);

		BaseFont objBaseFont = BaseFont.createFont("c:/windows/fonts/MALGUN.TTF", BaseFont.IDENTITY_H,
				BaseFont.EMBEDDED);
		Font font = new Font(objBaseFont, 12);
		// create cell
		PdfPCell cell = new PdfPCell(new Phrase(text, font));

		// set style
		Style.labelCellStyle(cell);
		return cell;
	}

	// create cells
	private static PdfPCell createValueCell(String text) throws DocumentException, IOException {
		// font
		// Font font = new Font(FontFamily.HELVETICA, 8, Font.NORMAL,
		// BaseColor.BLACK);
		BaseFont objBaseFont = BaseFont.createFont("c:/windows/fonts/MALGUN.TTF", BaseFont.IDENTITY_H,
				BaseFont.EMBEDDED);
		Font font = new Font(objBaseFont, 12);
		// create cell
		PdfPCell cell = new PdfPCell(new Phrase(text, font));

		// set style
		Style.valueCellStyle(cell);
		return cell;
	}

	private static PdfPCell createValueCell1(String text) throws DocumentException, IOException {
		// font
		// Font font = new Font(FontFamily.HELVETICA, 8, Font.NORMAL,
		// BaseColor.BLACK);
		BaseFont objBaseFont = BaseFont.createFont("c:/windows/fonts/MALGUN.TTF", BaseFont.IDENTITY_H,
				BaseFont.EMBEDDED);
		Font font = new Font(objBaseFont, 12);
		// create cell
		PdfPCell cell = new PdfPCell(new Phrase(text, font));

		// set style
		Style.valueCellStyle1(cell);
		return cell;
	}

	private static PdfPCell createValueCell2(String text) throws DocumentException, IOException {
		// font
		// Font font = new Font(FontFamily.HELVETICA, 8, Font.NORMAL,
		// BaseColor.BLACK);
		BaseFont objBaseFont = BaseFont.createFont("c:/windows/fonts/MALGUN.TTF", BaseFont.IDENTITY_H,
				BaseFont.EMBEDDED);
		Font font = new Font(objBaseFont, 20);
		// create cell
		PdfPCell cell = new PdfPCell(new Phrase(text, font));

		// set style
		Style.valueCellStyle1(cell);
		return cell;
	}
	

	
	///////////////////
	//				 //
	// Getter$Setter //
	//				 //	
	///////////////////
	
	

	public String getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(String meeting_no) {
		this.meeting_no = meeting_no;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}
	
	
	
	public Agenda getAgenda() {
		return agenda;
	}



	public void setAgenda(Agenda agenda) {
		this.agenda = agenda;
	}



	public Statements getStmt() {
		return stmt;
	}



	public void setStmt(Statements stmt) {
		this.stmt = stmt;
	}



	public Todo getTodo() {
		return todo;
	}



	public void setTodo(Todo todo) {
		this.todo = todo;
	}



	public Comments getComments() {
		return comments;
	}



	public void setComments(Comments comments) {
		this.comments = comments;
	}



	public String getForm_no() {
		return form_no;
	}

	public void setForm_no(String form_no) {
		this.form_no = form_no;
	}

	
	public List<Statements> getStmtlist() {
		return stmtlist;
	}

	public void setStmtlist(List<Statements> stmtlist) {
		this.stmtlist = stmtlist;
	}
	

	public List<Todo> getTodolist() {
		return todolist;
	}

	public void setTodolist(List<Todo> todolist) {
		this.todolist = todolist;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}


	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	
		

}
