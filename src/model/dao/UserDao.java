package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.ConnectionPoolDataSource;

import com.mysql.fabric.xmlrpc.base.Array;
import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;
import com.sun.org.apache.regexp.internal.recompile;

import libralies.ConnectDBLibrary;
import model.bean.Ability;
import model.bean.MyMessages;
import model.bean.Results;
import model.bean.Schedule;
import model.bean.ScheduleOfTrainee;
import model.bean.Skills;
import model.bean.User;

public class UserDao {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public List<User> getUsersByRoleId(int roleId){
		conn= ConnectDBLibrary.getConnection();
		List<User> users = new ArrayList<>();
		List<Ability> abilities= new ArrayList<>();
		try{
			String sql= "select u.*, s.name, a.* from users u "
					+ "left join ability a on u.user_id = a.user_id"
					+ "left join skills s on s.skill_id= a.skill_id "
					+ "where u.role_id = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, roleId);
			rs = pst.executeQuery();
			while(rs.next()){
				int userId= rs.getInt("user_id");
				String userName= rs.getString("username");
				String password= rs.getString("password");
				String fullName= rs.getString("fullname");
				Date dateOfBirth=rs.getDate("date_of_birth");
				Date createdAt=rs.getDate("created_at");
				String email= rs.getString("email");
				int gender= rs.getInt("gender");
				String address= rs.getString("address");
				String phone= rs.getString("phone");
				String notificationId= rs.getString("notification_id");
				String avatar= rs.getString("image");
				
				if(roleId ==2 ){
					User user= new User(userId, userName, password, fullName,dateOfBirth, email, createdAt, roleId, gender, address, phone, notificationId, avatar);
					Ability ability= new Ability();
					abilities.add(ability);
					user.setAbilities(abilities);
					users.add(user);
				}
				else{
					int abilityId= rs.getInt("ability_id");
					int skillId= rs.getInt("skill_id");
					int experience= rs.getInt("experience");
					int courseId= rs.getInt("course_id");
					
					User user= new User(userId, userName, password, fullName,
							dateOfBirth, email, createdAt, roleId, gender, address, 
							phone, notificationId, avatar);
					Ability ability= new Ability(abilityId, userId, skillId, experience, courseId);
					abilities.add(ability);
					user.setAbilities(abilities);
					users.add(user);
				}
			}
			
		}catch(SQLException e){
			System.out.println(e);
		}
		return users;
	}
	
	public User getUserByID(int userId){
		conn= ConnectDBLibrary.getConnection();
		User user= new User();
		List<Ability> abilities= new ArrayList<>();
		try{
			String sql= "select u.*, s.name, a.* from users u "
					+ "join ability a on u.user_id = a.user_id"
					+ " join skills s on s.skill_id= a.skill_id "
					+ "where u.user_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
			while(rs.next()){
				String userName= rs.getString("username");
				String password= rs.getString("password");
				String fullName= rs.getString("fullname");
				Date dateOfBirth=rs.getDate("date_of_birth");
				Date createdAt=rs.getDate("created_at");
				int roleId= rs.getInt("role_id");
				String email= rs.getString("email");
				int gender= rs.getInt("gender");
				String address= rs.getString("address");
				String phone= rs.getString("phone");
				String notificationId= rs.getString("notification_id");
				String avatar= rs.getString("image");
				
				if(roleId !=2 ){
					int abilityId= rs.getInt("ability_id");
					int skillId= rs.getInt("skill_id");
					int experience= rs.getInt("experience");
					int courseId= rs.getInt("course_id");
					user= new User(userId, userName, password, fullName,
							dateOfBirth, email, createdAt, roleId, gender, address, 
							phone, notificationId, avatar);
					Ability ability= new Ability(abilityId, userId, skillId, experience, courseId);
					abilities.add(ability);
					user.setAbilities(abilities);
				}
				else{
					user= new User(userId, userName, password, fullName,
							dateOfBirth, email, createdAt, roleId, gender, address, 
							phone, notificationId, avatar);
				}

			}
			
		}catch(SQLException e){
			System.out.println(e);
		}
		return user;
	}
	
	public void addTrainer(User trainer){
		conn = ConnectDBLibrary.getConnection();
		try{
			String sql= "insert into users values(0,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, trainer.getUsername());
			pst.setString(2, trainer.getPassword());
			pst.setString(3, trainer.getFullname());
			pst.setDate(4, trainer.getDateOfBirth());
			pst.setDate(5, trainer.getCreatedDate());
			pst.setString(6,  trainer.getEmail());
			pst.setInt(7, trainer.getGender());
			pst.setString(8, trainer.getAddress());
			pst.setString(9,trainer.getPhone());
			pst.setInt(10, trainer.getRoleId());
			pst.setString(11, trainer.getNotificationId());
			pst.setString(12, trainer.getAvatar());
			
			pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		}
	}
	
	public void editTrainer(User trainer){
		conn= ConnectDBLibrary.getConnection();
		try{
			String sql= "update users set fullname=? and date_of_birth=?"
					+ " and address=? and phone=? and avata=?"
					+ "where user_id =? ;";
			pst=conn.prepareStatement(sql);
			pst.setString(1, trainer.getFullname());
			pst.setDate(2, trainer.getDateOfBirth());
			pst.setString(3, trainer.getAddress());
			pst.setString(4, trainer.getPhone());
			pst.setString(5, trainer.getAvatar());
			pst.setInt(6, trainer.getRoleId());
			
			pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		}
	}
	
	public int getLastTrainerId(){
		conn = ConnectDBLibrary.getConnection();
		int lastTrainerId = 0;
		try{
			String sql="select max(user_id) from users where role_id = 1";
			pst=conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				lastTrainerId=rs.getInt("max(user_id)"); 
			}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		return lastTrainerId;
	}

	
	public List<User> getItems(){
		return null;
	}
	
	public User getItemById(int id) {
		return null;
	}
	
	public User getItemByUserNameAndPassword(String username, String password) {
		return null;
	}
	
	public int addItem(User user) {
		return 0;
	}
	
	public int editItem(User user) {
		return 0;
	}
	
	public int deleteItem(int id) {
		return 0;
	}
	
	public int addNewTrainee(User user) {
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		
		String sql = "insert into users(username, password, fullname, date_of_birth, created_at, email, gender, address, phone, role_id, notification_id, image) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getFullname());
			pst.setDate(4, user.getDateOfBirth());
			pst.setDate(5, user.getCreatedDate());
			pst.setString(6, user.getEmail());
			pst.setInt(7, user.getGender());
			pst.setString(8, user.getAddress());
			pst.setString(9, user.getPhone());
			pst.setInt(10, user.getRoleId());
			pst.setString(11, user.getNotificationId());
			pst.setString(12, user.getAvatar());
			
			kq = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return kq;
		
	}

	public User getTraineeById(int traineeId) {
		User trainee = new User();
		String sql = "select * from users where user_id = ?";
		
		
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, traineeId);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				trainee = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getDate("date_of_birth"), rs.getString("email"), rs.getDate("created_at"), rs.getInt("role_id"), rs.getInt("gender"), rs.getString("address"), rs.getString("phone"), rs.getString("notification_id"), rs.getString("image"));
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return trainee;
	}

	public int editTrainee(User trainee) {
		int kq = 0;
		
		String sql = "update users set fullname = ?, address = ?, gender = ?, phone = ?, date_of_birth = ?, password = ?, image = ?";
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, trainee.getFullname());
			pst.setString(2, trainee.getAddress());
			pst.setInt(3, trainee.getGender());
			pst.setString(4, trainee.getPhone());
			pst.setDate(5, trainee.getDateOfBirth());
			pst.setString(6, trainee.getPassword());
			pst.setString(7, trainee.getAvatar());
			
			kq = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return kq;
	}
	
	public User getUserItem(int user_id){
		User trainee= new User();
		try {
			conn = ConnectDBLibrary.getConnection();			
			String sql = "select * from users where user_id= ? ";
			System.out.println(sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user_id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				trainee.setUserId(rs.getInt(1));
				trainee.setUsername(rs.getString(2));
				trainee.setPassword(rs.getString(3));
				trainee.setFullname(rs.getString(4));
				trainee.setDateOfBirth(rs.getDate(5));
				trainee.setCreatedDate(rs.getDate(6));
				trainee.setEmail(rs.getString(7));
				trainee.setGender(rs.getInt(8));
				trainee.setAddress(rs.getString(9));
				trainee.setPhone(rs.getString(10));
				
			}
		
			}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return trainee;
	}
	public ArrayList<User> getTraineeOfClass(int class_id){
		ArrayList<User> listUser = new ArrayList<User>();
		try {
			conn = ConnectDBLibrary.getConnection();
			System.out.println("Connect 2!");
			
			String sql = "SELECT fullname ,phone FROM learning  INNER JOIN users on learning.user_id = users.user_id  WHERE  learning.class_id = ? ";
			System.out.println(sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, class_id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				User user = new User();
				user.setFullname(rs.getString(1));
				user.setPhone(rs.getString(2));
				
				listUser.add(user);			
			}
			System.out.println(listUser.size());
			for (User u1 : listUser){
				System.out.println("Cac hoc sinh lay duoc: ");
              	System.out.print(u1.getFullname());
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listUser;
	}
	
	public String getFullName(int user_id){
		String fullname ="";

		try {
			conn = ConnectDBLibrary.getConnection();
			System.out.println("Connect 2!");
			
			String sql = "Select * from users where user_id = ?";
			System.out.println(sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user_id);
			rs = pst.executeQuery();
			while (rs.next()){
				fullname = rs.getString(1);
				return fullname;
			}
		}
		 catch (Exception e) {
		}
			 
			return fullname;
			
		
	}
	public ArrayList<Results> getResultOfTrainee (int user_id){
		ArrayList<Results> listResult = new ArrayList<Results>();
		try {
			conn = ConnectDBLibrary.getConnection();
			System.out.println("Connect 2!");
			
			String sql = "select results.class_id , classes.name , results.status from results , classes where results.class_id = classes.class_id and user_id= ? ";
			System.out.println(sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user_id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				Results results = new Results();
				results.setClassId(rs.getInt(1));
				results.setClassName(rs.getString(2));
				results.setStatus(rs.getInt(3));
				
				listResult.add(results);		
			}		
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listResult;
	}
		
	public ArrayList<ScheduleOfTrainee> getClassesOfTrainee( int user_id ){
		
		ArrayList<ScheduleOfTrainee> listClasses = new ArrayList<ScheduleOfTrainee>();
		try {
			conn = ConnectDBLibrary.getConnection();
			System.out.println("Connect 2!");
			
			String sql = "SELECT classes.class_id, classes.name, trainer_id ,time_of_date, date_of_week , count_lesson, room_id FROM learning  INNER JOIN classes on learning.class_id = classes.class_id INNER JOIN users ON users.user_id = learning.user_id WHERE learning.user_id = ?";
			System.out.println(sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user_id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				ScheduleOfTrainee scheduleOfTrainee = new ScheduleOfTrainee();
				scheduleOfTrainee.setClassid(rs.getInt(1));
				scheduleOfTrainee.setNameClass(rs.getString(2));
				int idTrainer = rs.getInt(3);
				String fullnameTrainer ="";

				
				try {
					String sql1 = "Select fullname from users where user_id = ?";
					System.out.println(sql1);
					PreparedStatement pst1 = conn.prepareStatement(sql1);
					pst1.setInt(1, idTrainer);
					ResultSet rs1 = pst1.executeQuery();
					if (rs1.next()) {
						fullnameTrainer = rs1.getString(1);
						scheduleOfTrainee.setNameTrainer(fullnameTrainer);
					}
						
					
				} catch (Exception e) {
					scheduleOfTrainee.setNameTrainer(String.valueOf(idTrainer));
				}
				int idRoom = rs.getInt(7);
				String nameRoom ="";
				scheduleOfTrainee.setNameRoom(String.valueOf(idRoom));

				try {
					String sql2 = "Select name from rooms where room_id = ?";
					System.out.println(sql2);
					PreparedStatement pst2 = conn.prepareStatement(sql2);
					pst2.setInt(1, idRoom);
					ResultSet rs2 = pst2.executeQuery();
					
					if (rs2.next()) {
						nameRoom = rs2.getString(1);
						scheduleOfTrainee.setNameRoom(nameRoom);
					}
						
					
				} catch (Exception e) {
					scheduleOfTrainee.setNameRoom(String.valueOf(idRoom));
				}
				
				
				scheduleOfTrainee.setTimeofday(rs.getString(4));
				scheduleOfTrainee.setCountLession(rs.getInt(6));
				
				
				String str = rs.getString(5);
				String s =""; 
          	 	String arr[] =str.split(",");
              	 for(int i=0; i<arr.length;i++){
              		 switch(arr[i]){
              		 case "2":
              		 {
              			 s+="Mon";
              			 break;
              		 }
              		 case "3":
              		 {
              			 s+="Tue";
              			break;
              		 }
              		 case "4":
              		 {
              			 s+="Wed";
              			break;
              		 }
              		case "5":
              		 {
              			 s+="Thu";
              			break;
              		 }
              		case "6":
              		 {
              			 s+="Fri";
              			break;
              		 }
              		case "7":
              		 {
              			 s+="Sat";
              			break;
              		 }
              		case "8":
              		 {
              			 s+="Sun";
              			break;
              		 }
              	    default:
              	    {
              	        
              	    }
              		 }
              		 if (i< (arr.length-1)) {
              			 s+=",";
              		 }
              		 else {
              			 s+=".";
              		 }
          	 	}
				scheduleOfTrainee.setDateofweek(s);
				
				listClasses.add(scheduleOfTrainee);				
			}
			System.out.println(listClasses.size());
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return listClasses;
	}
	public ArrayList<Schedule> getTrainerSchedule(int user_id){
		conn=ConnectDBLibrary.getConnection();
		ArrayList<Schedule> schedule= new ArrayList<>();
		
		String sql = " SELECT classes.name as classname,rooms.name as roomname, courses.name as coursename, trainer_id,classes.class_id, classes.created_at, time_of_date, date_of_week ,count_lesson,fullname FROM classes "
					+ "INNER JOIN courses ON courses.course_id = classes.course_id "
					+ "INNER JOIN users ON users.user_id = classes.trainer_id "
					+ "INNER JOIN rooms ON rooms.room_id = classes.room_id  WHERE  classes.trainer_id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user_id);
			rs = pst.executeQuery();
			while (rs.next()) {
			Schedule list = new Schedule();
				list.setClassid(rs.getInt("class_id"));
				list.setTrainerId(rs.getInt("trainer_id"));
				list.setFullname(rs.getString("fullname"));
				list.setNameclass(rs.getString("classname"));
				list.setCountLession(rs.getInt("count_lesson"));
				list.setCreateAt(rs.getDate("created_at"));
				list.setDateOfWeek(rs.getString("date_of_week"));
				list.setTimeOfDate(rs.getString("time_of_date"));
				list.setCourse(rs.getString("coursename"));
				list.setNameroom(rs.getString("roomname"));
				schedule.add(list);
				int dem = schedule.size();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			
			 	
			
		}
		
		
		return schedule;
	}
	public ArrayList<MyMessages> getMessagesOfTrainee(int user_id){
		ArrayList<MyMessages> listMessages = new ArrayList<>();
		conn=ConnectDBLibrary.getConnection();
		String sql = "select msg_id, messages.user_id , messages.noti_id , status , notification.content FROM messages  INNER JOIN users on messages.user_id = users.user_id  INNER JOIN notification ON notification.id = messages.noti_id where messages.user_id= ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user_id);
			rs = pst.executeQuery();
			while (rs.next()){
				MyMessages myMessages = new MyMessages();
				myMessages.setMsgId(rs.getInt("msg_id"));
				myMessages.setNotiId(rs.getInt("noti_id"));
				myMessages.setNotiContent(rs.getString("content"));
				myMessages.setStatus(rs.getInt("status"));
				listMessages.add(myMessages);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
				
		
		}
		return listMessages;
		
		
		
	
	}
	public MyMessages getMessageDetail(int msg_id) {
		MyMessages messages = new MyMessages();
		conn=ConnectDBLibrary.getConnection();
		String sql = "select msg_id, messages.user_id , messages.noti_id , status , notification.content FROM messages  INNER JOIN users on messages.user_id = users.user_id  INNER JOIN notification ON notification.id = messages.noti_id where messages.msg_id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, msg_id);
			rs = pst.executeQuery();
			while (rs.next()){
				MyMessages myMessages = new MyMessages();
				myMessages.setMsgId(rs.getInt("msg_id"));
				myMessages.setNotiId(rs.getInt("noti_id"));
				myMessages.setNotiContent(rs.getString("content"));
				myMessages.setStatus(rs.getInt("status"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return messages;
		
	}

	public ArrayList<User> getUsers() {
		ArrayList<User> users = new ArrayList<>();
		String sql = "select * from users";
		
		
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				User user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getDate("date_of_birth"), rs.getString("email"), rs.getDate("created_at"), rs.getInt("role_id"), rs.getInt("gender"), rs.getString("address"), rs.getString("phone"), rs.getString("notification_id"), rs.getString("image"));
				users.add(user);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return users;
	}

}
