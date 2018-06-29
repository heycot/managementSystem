package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import libralies.ConnectDBLibrary;
import model.bean.Classes;
import model.bean.Courses;
import model.bean.User;

public class ClassesDao {

	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public String getNameClass(int classId){
		conn= ConnectDBLibrary.getConnection();
		String classname = "";
		try{
			
			String sql= "select * from classes WHERE class_id = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, classId);
			rs = pst.executeQuery();
			while(rs.next()) {
				classname = rs.getString("name");
				
		}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		return classname;
	}
	

}