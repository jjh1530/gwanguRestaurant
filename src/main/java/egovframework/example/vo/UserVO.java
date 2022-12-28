package egovframework.example.vo;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {

	private String userid;
	private String userpass;
	private String username;
	private int userage;
	private String useremail;
	private String useryn;
	private String registerDate;
	private String filename;
	private String userPhone;
	private MultipartFile uploadFile;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseryn() {
		return useryn;
	}
	public void setUseryn(String useryn) {
		this.useryn = useryn;
	}
	public int getUserage() {
		return userage;
	}
	public void setUserage(int userage) {
		this.userage = userage;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpass=" + userpass + ", username=" + username + ", userage=" + userage
				+ ", useremail=" + useremail + ", useryn=" + useryn + ", registerDate=" + registerDate + ", filename="
				+ filename + ", userPhone=" + userPhone + ", uploadFile=" + uploadFile + "]";
	}
	

}
