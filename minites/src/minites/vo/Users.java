package minites.vo;

public class Users {
/*
  email varchar2(100) primary key,    -- 이메일
  name varchar2(50) not null,         -- 이름
  phone varchar2(50),				  -- 전화번호
  photo varchar2(50)				  -- 사진
 */
	private String email;	// 이메일
	private String name;	// 이름
	private String phone;	// 전화번호
	private String photo;	// 파일업로드
	
	public Users() {}
	
	public Users(String email, String name, String phone, String photo) {
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.photo = photo;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
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
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "Users [email=" + email + ", name=" + name + ", phone=" + phone + ", photo=" + photo + "]";
	}
	
	
	
}
