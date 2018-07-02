package model.bo;

import java.io.File;
import java.util.ArrayList;

import model.bean.Rooms;
import model.dao.RoomDao;

public class RoomBo {
	
	RoomDao roomDao;
	
	public void addRooms(Rooms rooms){
		RoomDao roomDao = new RoomDao();
		
		roomDao.addRoom(rooms);
	}
	
	public boolean checkRoomnameAlreadyExistsEdit(String name) {
		roomDao = new RoomDao();
		ArrayList<Rooms> rooms = roomDao.getRooms();
		
		for(Rooms room: rooms){
			if(room.getName().equals(name)){
				return true;
			}
		}
		return false;
	}
	public ArrayList<Rooms> getRoomList(){
		roomDao = new RoomDao();
		return roomDao.getRoomList();
	}
}