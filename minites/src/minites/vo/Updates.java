package minites.vo;

public class Updates {
	
	/*  content_no varchar2(100) not null, -- 수정한 콘텐츠 종류
  		users varchar2(100) not null,		 -- 수정한 사람
  		inputdate date not null			 -- 수정한 시간;
  	*/
	private String content_no;	// 수정한 글 종류 및 번호
	private String users;	    // 수정한 사람
	private String inputdate;   // 수정날짜
	
	public Updates() {}

	public Updates(String content_no, String users, String inputdate) {
		this.content_no = content_no;
		this.users = users;
		this.inputdate = inputdate;
	}

	public String getContent_no() {
		return content_no;
	}

	public void setContent_no(String content_no) {
		this.content_no = content_no;
	}

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "Updates [content_no=" + content_no + ", users=" + users + ", inputdate=" + inputdate + "]";
	}
	
}
