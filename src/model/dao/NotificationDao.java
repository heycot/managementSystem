package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import libralies.ConnectDBLibrary;
import libralies.FormatDateLibrary;
import model.bean.Classes;
import model.bean.User;
public class NotificationDao {

	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public int addNotiTakedayoffS( String dateoff, String datechange,  String timechange ,String room, Classes classes , User trainer, int admin_id){

	// Create notification all of kind: 
	/*
	  All type of notification :
	  +Take day off of trainer: 
	  		when trainer take day off, System will create notification 
	  		-														- Thong bao cho management biet 
	  																- Thong bao cho trainee nghi hoc
	  																- 	Thong bao cho traineelich hoc bu
	  		when class open to register -> - Thong bao toi management rang da du so luong de mo
	  										- Sau khi admin dong y mo de dang ky , thong bao toi trainee bi fail khoa hoc do de trainee dk lai
	  										- 
	  																	
	  																
	 */
	//trainer gui toi management de duoc approve 

		int result = 0;
		String title = "Notice about request day off and replace learning plan";
		String nameTrainer = trainer.getFullname();
		String nameclasses = classes.getName();
		String content = "";

		content+= "The announcement of "+nameclasses+" will take day off on " + dateoff+". ";
		content+="Replace learning plan is " +datechange + ", at "+ timechange+ ", in "+room+". If you approve it. Please check List Request of Trainer " ;
		Date dateCurrent = 	FormatDateLibrary.ConvertDateUntilToDateSQL(new java.util.Date());

				//FormatDateLibrary.ConvertDateUntilToDateSQL(new Date());
		
		try {
			conn = ConnectDBLibrary.getConnection();

			String sql = "insert into notification(content,user_id,title, createdDate) values(?,?,?, ?)";
			pst =  conn.prepareStatement(sql);
			pst.setString(1, content);
			pst.setInt(2, admin_id);
			pst.setString(3, title);
			pst.setDate(4, (java.sql.Date) dateCurrent);

			result = pst.executeUpdate();
			String sql1 = "select * from notification order by id desc limit 1";
			pst = conn.prepareStatement(sql1);
			ResultSet result1 = pst.executeQuery();
			int notification_id =0;
			while(result1.next()){
				notification_id = result1.getInt("id");
			}
			if(notification_id!=0){
				String sql2 = "insert into messages(user_id,noti_id, status) values(?,?, ?)";
				pst = conn.prepareStatement(sql2);
				pst.setInt(1, admin_id);
				pst.setInt(2, notification_id);
				pst.setInt(3, 0);
				int result2 = pst.executeUpdate();
				if (result2 > 0) {
					System.out.println("Add messages of take day off successfull");
					
				}
			}
		}catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
				} finally {
					ConnectDBLibrary.close(rs, pst, conn);
				}
				
				return  result;
	}
	public int addRequestTakeaDayOff(String dateoff, String datechange,  String timechange , Classes classes , User trainer, int room_id){
		conn = ConnectDBLibrary.getConnection();
		int kq = 0;
		try{
			String sql= "insert into requestDayOff(class_id, trainer_id, date_off, date_change, time_change, room_id, status) values(?,?,?,?,?,?,?)";
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, classes.getClassId());
			pst.setInt(2, trainer.getUserId());
			pst.setString(3, dateoff);
			pst.setString(4, datechange );
			pst.setString(5, timechange);
			pst.setInt(6, room_id);
			pst.setInt(7, 0);
			
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


}
