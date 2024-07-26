package model1.board;

import java.sql.Date;

public class BoardDTO {
	
	// Board 객체 처리용
	
	private String num;
	private String title;
	private String content;
	private String id;
	private Date postdate;
	private String visitcount;
	private String name; // memeber 테이블에 있는 작성자의 이름
	
	
	
	public BoardDTO() {
		
	}// 기본 생성자



	
	//메서드 (게터, 세터)
	public String getNum() {
		return num;
	}



	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", id=" + id + ", postdate="
				+ postdate + ", visitcount=" + visitcount + ", name=" + name + "]";
	}




	public void setNum(String num) {
		this.num = num;
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



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public Date getPostdate() {
		return postdate;
	}



	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}



	public String getVisitcount() {
		return visitcount;
	}



	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}
	

}
