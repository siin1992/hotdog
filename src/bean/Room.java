package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Room {
	private String R_Name;
	private int R_Price;
	private String R_Image;
	private int R_Limit;
	private String R_Exp;
	
	public Room(String R_Name, int R_Price, String R_Image, int R_Limit, String R_Exp) {
		this.R_Name = R_Name;
		this.R_Price = R_Price;
		this.R_Image = R_Image;
		this.R_Limit = R_Limit;
		this.R_Exp = R_Exp;
	}
	
	public Room() {
	}

	public String getR_Name() {
		return R_Name;
	}

	public void setR_Name(String r_Name) {
		R_Name = r_Name;
	}

	public int getR_Price() {
		return R_Price;
	}

	public void setR_Price(int r_Price) {
		R_Price = r_Price;
	}

	public String getR_Image() {
		return R_Image;
	}

	public void setR_Image(String r_Image) {
		R_Image = r_Image;
	}

	public int getR_Limit() {
		return R_Limit;
	}

	public void setR_Limit(int r_Limit) {
		R_Limit = r_Limit;
	}

	public String getR_Exp() {
		return R_Exp;
	}

	public void setR_Exp(String r_Exp) {
		R_Exp = r_Exp;
	}
	
}