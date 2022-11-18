package egovframework.example.vo;

import org.springframework.web.multipart.MultipartFile;

public class DonguNoticeVO {

	int idx;
	String title;
	String content;
	String writer;
	String noticeimg;
	String indate;
	int count;
	private MultipartFile uploadFile;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getNoticeimg() {
		return noticeimg;
	}
	public void setNoticeimg(String noticeimg) {
		this.noticeimg = noticeimg;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	/*
	@Override
	public String toString() {
		return idx + " " + title + " " + content + " " + writer + " "+ indate ;
	}*/
	
	
}
