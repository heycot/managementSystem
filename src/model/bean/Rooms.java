package model.bean;

public class Rooms {
	private int roomId;
	private String name;
	private int capacity;
	private int status;
	
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Rooms(int room_id, String name, int capacity, int status) {
		super();
		this.roomId = room_id;
		this.name = name;
		this.capacity = capacity;
		this.status = status;
	}
	public Rooms() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
