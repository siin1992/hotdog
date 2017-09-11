package bean;

public class Board {
	private String B_Name;
	private String B_PW;
	private String B_Title;
	private String B_Content;
	private String B_File;	
	private String B_Date;
	private int B_Category;
	private int B_Num;
	private int B_ViewCnt;
	
	
	
	public Board() {
		
	}

	public Board(String B_Name, String B_PW, String B_Title, String B_Content,  int B_Category) {
		this.B_Name = B_Name;
		this.B_PW = B_PW;
		this.B_Title = B_Title;
		this.B_Content = B_Content;
		//this.B_File = B_File;
		this.B_Category = B_Category;
	}
	
	public String getB_Name() {
		return B_Name;
	}
	public void setB_Name(String B_Name) {
		this.B_Name = B_Name;
	}
	public String getB_PW() {
		return B_PW;
	}
	public void setB_PW(String B_PW) {
		this.B_PW = B_PW;
	}
	public String getB_Title() {
		return B_Title;
	}
	public void setB_Title(String B_Title) {
		this.B_Title = B_Title;
	}
	public String getB_Content() {
		return B_Content;
	}
	public void setB_Content(String B_Content) {
		this.B_Content = B_Content;
	}
	public String getB_File() {
		return B_File;
	}
	public void setB_File(String B_File) {
		this.B_File = B_File;
	}

	public String getB_Date() {
		return B_Date;
	}

	public void setB_Date(String b_Date) {
		B_Date = b_Date;
	}
	
	public int getB_Category() {
		return B_Category;
	}

	public void setB_Category(int b_Category) {
		B_Category = b_Category;
	}

	public int getB_Num() {
		return B_Num;
	}

	public void setB_Num(int b_Num) {
		B_Num = b_Num;
	}

	public int getB_ViewCnt() {
		return B_ViewCnt;
	}

	public void setB_ViewCnt(int b_ViewCnt) {
		B_ViewCnt = b_ViewCnt;
	}
	
}
