package minites.common;

import java.io.*;
import java.net.URLEncoder;

import com.opensymphony.xwork2.ActionSupport;

//import test.board.Board;
//import test.board.BoardDAO;

public class FileDownLoadAction extends ActionSupport {
	private int boardnum; // 파일이 첨부된 글 번호
	
	private String contentType;
	private String contentDisposition;
	private InputStream inputStream;
	private long contentLength;
	private String fileLocation;
	private File file;
	
	public String execute(){
		//System.out.println("file다운로드 준비");
		try {
			file = new File(fileLocation);
			inputStream = new FileInputStream(file);
			//System.out.println(file);
			// 파일 크기 대입
			contentLength = file.length();
			try {
				// 저장할때 표시될 원래 이름
				contentDisposition = "attachment;filename="
				+ URLEncoder.encode(file.getName(), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	
}
