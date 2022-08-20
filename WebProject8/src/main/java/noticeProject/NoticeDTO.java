package noticeProject;

import java.sql.Date;

public class NoticeDTO {
	private int no;  //공지사항 번호
	private String title; //공지사항 제목
	private Date date; //공지사항 날짜
	private String contents; //공지사항 내용
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
