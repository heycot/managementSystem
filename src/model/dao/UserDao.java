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
		conn = ConnectDBLibrary.getConnection();
		List<User> users = new ArrayList<>();
		List<Ability> abilities = new ArrayList<>();
		try {
			String sql = "select u.* from users u where u.role_id = ? order by u.user_id DESC";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, roleId);
			rs = pst.executeQuery();
			while (rs.next()) {
				int userId = rs.getInt("user_id");
				String userName = rs.getString("username");
				String password = rs.getString("password");
				String fullName = rs.getString("fullname");
				Date dateOfBirth = rs.getDate("date_of_birth");
				Date createdAt = rs.getDate("created_at");
				String email = rs.getString("email");
				int gender = rs.getInt("gender");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				String notificationId = rs.getString("notification_id");
				String avatar = rs.getString("image");

				User user = new User(userId, userName, password, fullName, dateOfBirth, email, createdAt, roleId,
						gender, address, phone, notificationId, avatar);

				users.add(user);
			}

		} catch (SQLException e) {
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return users;
	}
	
	public User getUserByID(int userId) {
		conn = ConnectDBLibrary.getConnection();
		User user = new User();
		List<Ability> abilities = new ArrayList<>();
		try {
			String sql = "select u.* from users u where u.user_id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			rs = pst.executeQuery();
			while (rs.next()) {
				String userName = rs.getString("username");
				String password = rs.getString("password");
				String fullName = rs.getString("fullname");
				Date dateOfBirth = rs.getDate("date_of_birth");
				Date createdAt = rs.getDate("created_at");
				int roleId = rs.getInt("role_id");
				String email = rs.getString("email");
				int gender = rs.getInt("gender");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				String notificationId = rs.getString("notification_id");
				String avatar = rs.getString("image");

				user = new User(userId, userName, password, fullName, dateOfBirth, email, createdAt, roleId, gender,
						address, phone, notificationId, avatar);

			}

		} catch (SQLException e) {
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return user;
	}
	
	public User getUserByEmail(String email) {
		conn = ConnectDBLibrary.getConnection();
		List<Ability> abilities = new ArrayList<>();
		User user= new User();
		try {
			String sql = "select u.* from users u where u.email=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if (rs.next()) {
				int userId= rs.getInt("user_id");
				String userName = rs.getString("username");
				String password = rs.getString("password");
				String fullName = rs.getString("fullname");
				Date dateOfBirth = rs.getDate("date_of_birth");
				Date createdAt = rs.getDate("created_at");
				int roleId = rs.getInt("role_id");
				int gender = rs.getInt("gender");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				String notificationId = rs.getString("notification_id");
				String avatar = rs.getString("image");
				
				user = new User(userId, userName, password, fullName, dateOfBirth, email, createdAt, roleId, gender,
						address, phone, notificationId, avatar);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return user;
	}
	
	public int addTrainer(User trainer){
		conn = ConnectDBLibrary.getConnection();
		int kq = 0;
		try{
			String sql= "insert into users values(0,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
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
			pst.setInt(13, 1);
			
			kq=pst.executeUpdate();
			
		}
		catch(SQLException e){
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return kq;
	}
	
	public int editTrainer(User trainer){
		conn= ConnectDBLibrary.getConnection();
		int kq = 0;

		try{
			String sql= "update users set username=?, fullname=?, date_of_birth=?"
					+ " ,address=? , phone=? , image=? , password=? "
					+ " where user_id =?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, trainer.getUsername());
			pst.setString(2, trainer.getFullname());
			pst.setDate(3, trainer.getDateOfBirth());
			pst.setString(4, trainer.getAddress());
			pst.setString(5, trainer.getPhone());
			pst.setString(6, trainer.getAvatar());
			pst.setString(7, trainer.getPassword());
			pst.setInt(8, trainer.getUserId());
			
			kq=pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return kq;
	}
	
	public int getLastUserId(){
		conn = ConnectDBLibrary.getConnection();
		int lastUserId = 0;
		try{
			String sql="select max(user_id) from users";
			pst=conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				lastUserId=rs.getInt("max(user_id)"); 
			}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return lastUserId;
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
			
			String sql = "SELECT users.user_id as userid,fullname ,username, email, phone, classes.name FROM learning  INNER JOIN users on learning.user_id = users.user_id "
					+ " INNER JOIN classes ON classes.class_id = learning.class_id WHERE  learning.class_id = ? ";
			System.out.println(sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, class_id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				User user = new User();
				
				user.setFullname(rs.getString("fullname"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setUsername(rs.getString("username"));
				user.setUserId(rs.getInt("userid"));
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
			System.out.println("Loi nam o resultDao:" + e.getMessage());
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
		
		String sql = " SELECT classes.name as classname,rooms.name as roomname, courses.name as coursename, trainer_id,classes.class_id, classes.created_at, time_of_date, date_of_week ,count_lesson,fullname, username FROM classes "
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
				list.setUsername(rs.getString("username"));
				schedule.add(list);
				
				
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
		String sql = "select msg_id, messages.user_id, notification.title, messages.noti_id , messages.status , notification.content, notification.createdDate FROM messages  INNER JOIN users on messages.user_id = users.user_id  INNER JOIN notification ON notification.id = messages.noti_id  where messages.user_id= ? order by messages.msg_id DESC";
		try {
			System.out.println(sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user_id);
			rs = pst.executeQuery();
			while (rs.next()){
				MyMessages myMessages = new MyMessages();
				myMessages.setMsgId(rs.getInt("msg_id"));
				myMessages.setNotiId(rs.getInt("noti_id"));
				myMessages.setNotiContent(rs.getString("content"));
				myMessages.setStatus(rs.getInt("status"));
				myMessages.setTitle(rs.getString("title"));
				myMessages.setCreatedDate(rs.getDate("createdDate"));
				System.out.println(myMessages.getTitle());

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
		String sql = "select msg_id, messages.user_id , messages.noti_id ,notification.title, notification.createdDate, messages.status , notification.content FROM messages  INNER JOIN users on messages.user_id = users.user_id  INNER JOIN notification ON notification.id = messages.noti_id where messages.msg_id = ?";
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
				myMessages.setTitle(rs.getString("title"));
				myMessages.setCreatedDate(rs.getDate("createdDate"));
				return myMessages;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return messages;
		
	}
	public int changeStatusMessages(int msg_id){
		int nu=0;		
		conn=ConnectDBLibrary.getConnection();
		System.out.println(msg_id);
		String sql = "UPDATE messages SET status = 1 WHERE msg_id=?";
		System.out.println(sql);
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, msg_id);
			nu = pst.executeUpdate();
			System.out.println(nu);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return nu;		
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
	public boolean compareDuration(int class_id){
		boolean bl = false;
		conn=ConnectDBLibrary.getConnection();
		String sql1="SELECT count_lesson, course_id FROM classes WHERE class_id=? ";
	try {
		pst = conn.prepareStatement(sql1);
		pst.setInt(1, class_id);
		rs = pst.executeQuery();
		while (rs.next()) {
			int count_lesson = rs.getInt("count_lesson");
			int course_id = rs.getInt("course_id");
			try {
				String sql2="SELECT duration FROM courses WHERE course_id=?";
				PreparedStatement pst1 = conn.prepareStatement(sql2);
				pst1.setInt(1, course_id);	
				ResultSet rs1 = pst1.executeQuery();
				while(rs1.next()){
					int duration = rs1.getInt("duration");
					if(count_lesson==duration){
						bl=true;
						return bl;
					} else {
						bl=false;
					}
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return bl;

	}
	
	public ArrayList<Schedule> getClassOpening() {
		ArrayList<Schedule> listClassOpening = new ArrayList<>();
		String sql = "SELECT classes.class_id, classes.name, users.fullname, classes.date_of_week, classes.time_of_date, courses.duration FROM mcts.classes inner join courses on courses.course_id = classes.course_id inner join users on users.user_id= classes.trainer_id where classes.status=0";
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);			
			rs = pst.executeQuery();
			while(rs.next()) {
				Schedule classOpen = new Schedule();
				classOpen.setClassid(rs.getInt(1));
				classOpen.setNameclass(rs.getString(2));
				classOpen.setUsername(rs.getString(3));
				classOpen.setDateOfWeek(rs.getString(4));
				classOpen.setTimeOfDate(rs.getString(5));
				classOpen.setCountLession(rs.getInt(6));
				listClassOpening.add(classOpen);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return listClassOpening;
	}
	
	public int beExistWaitingClass(int user_is, int user_class){
		int result=0;
		String sql ="select * from waiting where user_id = ? and class_id =?";
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			result = rs.getRow();
			return result;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return result;
	}
	
	
	public int deleteTrainee(int traineeId) {
		int kq = 0;
		
		String sql = "delete from users where user_id = ?";
		
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, traineeId);
			kq = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return kq;
	}

	public int changeStatus(int traineeId, int status) {
		int kq = 0;
		
		String sql = "update users set status = ? where user_id = ?";
		
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, status);
			pst.setInt(2, traineeId);
			kq = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return kq;
	}

	
	public ArrayList<User> getTrainees(int traineeRoleId) {
		ArrayList<User> trainees = new ArrayList<>();
		String sql = "select * from users where role_id = ? order by user_id desc ";
		
		conn = ConnectDBLibrary.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, traineeRoleId);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				User user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getDate("date_of_birth"), 
									rs.getString("email"), rs.getDate("created_at"), rs.getInt("role_id"), rs.getInt("gender"), rs.getString("address"), rs.getString("phone"),
									rs.getString("notification_id"), rs.getString("image"), rs.getInt("status"));
				trainees.add(user);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return trainees;
	}

}
