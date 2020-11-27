package model;

/*
DTO클래스를 만들때는 테이블 정의서를 참조한다
기본적으로 테이블과 동일한 형태로 멤버변수를 정의하면 된다
멤버변수의 타입은 특별한 경우를 제외하고는 대부분 String으로 
정의한다. 꼭 필요한 경우에만 int,double로 정의한다.
*/
public class BbsDTO {
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postDate;
	private String visitcount;
	
	//회원테이블과 조인하여 이름을 가져오기 위해 DTO클래스에name컬럼을 추가한다.
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	//생성자는 기술하지 않는다. 
	//getter/setter만 기술한다. 
	public String getNum() {
		return num;
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
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	
	
}
