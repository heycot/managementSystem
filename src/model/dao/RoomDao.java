package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;

import libralies.ConnectDBLibrary;
import model.bean.Rooms;

public class RoomDao {

	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	public int addRoom(Rooms rooms) {
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		try{
			String sql = "insert into rooms value (0,?,?,?)";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, rooms.getName());
			pst.setInt(2, rooms.getCapacity());
			pst.setInt(3, rooms.getStatus());
			
			kq = pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return kq;
		
	}

	public ArrayList<Rooms> getRooms() {
		ArrayList<Rooms> listRooms = new ArrayList<Rooms>();
		String sql = "SELECT * from rooms";
		
		conn = ConnectDBLibrary.getConnection();
		try{
			pst = conn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while(rs.next()){
				Rooms room = new Rooms(rs.getInt("room_id"), rs.getString("name"), rs.getInt("capacity"), rs.getInt("status"));
				listRooms.add(room);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return listRooms;
		
	}
	
	public ArrayList<Rooms> getRoomList(){
		ArrayList<Rooms> roomlist = new ArrayList<Rooms>();
		try{
			conn = ConnectDBLibrary.getConnection();
			String sql = "SELECT name, capacity, status from rooms";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while (rs.next()){
				Rooms room = new Rooms();
				room.setName(rs.getString("name"));
				room.setCapacity(rs.getInt("capacity"));
				room.setStatus(rs.getInt("status"));
				
				roomlist.add(room);				
			}
		}catch (Exception e){
			
		}
		return roomlist;
	}
}