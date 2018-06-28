package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

import libralies.ConnectDBLibrary;
import model.bean.Results;


public class ResultDao {

	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public int updateResult(Results result){
		conn=ConnectDBLibrary.getConnection();
		int kq=0;
		String sql = "insert into results(status, class_id, user_id) values(?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, result.getStatus());
			pst.setInt(2, result.getClassId());
			pst.setInt(3, result.getUserId());
			kq = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return kq;
		
	}	

}