package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import libralies.ConnectDBLibrary;
import model.bean.Roles;



public class RoleDao {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public List<Roles> getRoles(){
		conn = ConnectDBLibrary.getConnection();
		List<Roles> roles= new ArrayList<>();
		try{
			String sql= "select * from roles;";
			pst= conn.prepareStatement(sql);
			rs= pst.executeQuery();
			while(rs.next()){
				Roles role = new Roles(rs.getInt("role_id"),rs.getString("name"));
				roles.add(role);
			}
		}catch(SQLException e){
			System.out.println(e);
		}
		return roles;
	}

}
