package bean;

public class Comment {
	private int C_B_Num;
	private String C_Name;
	private int C_PW;
	private String C_Content;
	private int C_BC_Num;
	private String C_Date;
	
	public int getC_B_Num() {
		return C_B_Num;
	}

	public void setC_B_Num(int c_B_Num) {
		C_B_Num = c_B_Num;
	}

	public String getC_Name() {
		return C_Name;
	}

	public void setC_Name(String c_Name) {
		C_Name = c_Name;
	}

	public int getC_PW() {
		return C_PW;
	}

	public void setC_PW(int c_PW) {
		C_PW = c_PW;
	}

	public String getC_Content() {
		return C_Content;
	}

	public void setC_Content(String c_Content) {
		C_Content = c_Content;
	}

	public int getC_BC_Num() {
		return C_BC_Num;
	}

	public void setC_BC_Num(int c_BC_Num) {
		C_BC_Num = c_BC_Num;
	}

	public String getC_Date() {
		return C_Date;
	}

	public void setC_Date(String c_Date) {
		C_Date = c_Date;
	}

	public Comment(int C_B_Num, String C_Name, int C_PW, String C_Content, int C_BC_Num) {
		this.C_B_Num = C_B_Num;
		this.C_Name = C_Name;
		this.C_PW = C_PW;
		this.C_Content = C_Content;
		this.C_BC_Num = C_BC_Num;
	}

	public Comment() {
		// TODO Auto-generated constructor stub
	}
}
