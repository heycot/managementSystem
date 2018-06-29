package model.bo;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.sun.org.apache.regexp.internal.recompile;

import libralies.fileLibrary;
import model.bean.Ability;
import model.bean.MyMessages;
import model.bean.Results;
import model.bean.Schedule;
import model.bean.ScheduleOfTrainee;
import model.bean.User;
import model.dao.AbilityDao;
import model.dao.UserDao;

public class UserBo {
	UserDao userDao;
	
	public int addTrainer(User trainer, Ability ability){
		userDao= new UserDao();
		AbilityDao abilityDao= new AbilityDao();
		
		int kq= userDao.addTrainer(trainer);
		ability.setUserId(userDao.getLastUserId());
		abilityDao.addTrainerAbility(ability);		
		return kq;
	}
	
	public int editTrainer(User trainer){
		userDao= new UserDao();		
		return userDao.editTrainer(trainer);
	}
	
	public User getTrainerById(int trainerId){
		userDao= new UserDao();
		User trainer= userDao.getUserByID(trainerId);
		return trainer;
	}
	
	public int getLastUserId(){
		userDao= new UserDao();
		return userDao.getLastUserId();
	}
	
	public List<User> getUsersByRoleId(int roleId){
		userDao= new UserDao();
		List<User> users= userDao.getUsersByRoleId(roleId);
		return users;
	}
	
	public List<User> getUsers(){
		userDao= new UserDao();
		List<User> users= userDao.getUsers();
		return users;
	}
	
	public ArrayList<Schedule> getTrainerSchedule(int user_id){
		userDao = new UserDao();
		return userDao.getTrainerSchedule(user_id);
	}
	
	
	public boolean checkTraineeInformation(String username, String pass, String fullname, String dateOfBirth, String email, String address, String phone) {
		System.out.println("username " + username);
		System.out.println("pass :" + pass + "fullname:" + fullname + "dateOfBirth :" + dateOfBirth + "email:"+ email + "address:"+ address +"phone:" + phone);
		if("".equals(username) || "".equals(pass) || "".equals(fullname) || "".equals(dateOfBirth) || "".equals(email) || "".equals(address) || "".equals(phone)) {
			System.out.println("false");
			return false;
		}else {
			return true;
		}
	}
	
	public int checkAddTraineeAvatar(Part part, HttpServletRequest request) {
		String fileName = fileLibrary.getFileName(part);
		if(fileName.isEmpty()) {
			return 0; // khong upload hinh anh
		}else {
			System.out.println(fileName);
			String[] hinhanh = fileName.split("[.]");
			if(!"jpg".equals(hinhanh[1]) && !"JPG".equals(hinhanh[1]) && !"png".equals(hinhanh[1]) && !"PNG".equals(hinhanh[1]) && !"gif".equals(hinhanh[1]) && !"GIF".equals(hinhanh[1])) {
				return 1; //khong dung dinh dang anh
			}else {
				return 2;
			}
		}
	}
	
	public String addTraineeAvatar(Part part, HttpServletRequest request) {
		String fileName = fileLibrary.getFileName(part);
		
		System.out.println(fileName);
		String[] hinhanh = fileName.split("[.]");
		
		long date = System.currentTimeMillis();
		fileName = date + "." + hinhanh[hinhanh.length - 1];
		System.out.println(fileName);
		
		String dirPath = request.getServletContext().getRealPath("/files");
		
		File file = new File(dirPath);
		if (!file.exists()) {
			file.mkdirs();
		}

		String filePath = dirPath + File.separator + fileName;
		try {
			part.write(filePath);
			System.out.println(dirPath);
			return fileName;
		} catch (IOException e) {
			e.printStackTrace();
			return "2";
		}
	}
	
	public boolean checkUsernameAlreadyExists(String username) {
		userDao = new UserDao();
		ArrayList<User> users = userDao.getUsers();
		
		for (User user : users) {
			if(user.getUsername().equals(username)) {
				return true;
			}
		}
		
		return false;
	}
	
	public boolean checkUsernameAlreadyExistsEdit(String username, int userId) {
		userDao = new UserDao();
		ArrayList<User> users = userDao.getUsers();
		
		for (User user : users) {
			if(user.getUsername().equals(username) && user.getUserId() != userId) {
				return true;
			}
		}
		
		return false;
	}
	
	public boolean checkEmailAlreadyExists(String email) {
		userDao = new UserDao();
		ArrayList<User> users = userDao.getUsers();
		
		for (User user : users) {
			if(user.getEmail().equals(email)) {
				return true;
			}
		}
		
		return false;
	}

	public int addTrainee(User user) {
		userDao = new UserDao();
		return userDao.addNewTrainee(user);
		
	}
	public User getTraineeById(int traineeId) {
		userDao = new UserDao();
		return userDao.getTraineeById(traineeId);
	}
	public int editTrainee(User trainee) {
		userDao = new UserDao();
		return userDao.editTrainee(trainee);
				
	}
	public ArrayList<ScheduleOfTrainee> getClassOfTrainee(int user_id){
		userDao = new UserDao();
		return userDao.getClassesOfTrainee(user_id);
	}
	
	public ArrayList<User> getTraineeOfClass(int class_id){
		userDao = new UserDao();
		return userDao.getTraineeOfClass(class_id);
	}
	
	public ArrayList<Results> getResultOfTrainee(int user_id) {
		userDao = new UserDao();
		return userDao.getResultOfTrainee(user_id);
	}
	public User getTraineeItem(int user_id){
		userDao= new UserDao();
		return userDao.getUserItem(user_id);
	}
	public ArrayList<MyMessages> getMessagesOfTrainee( int user_id){
		userDao= new UserDao();
		return userDao.getMessagesOfTrainee(user_id);
	}
	public MyMessages getMessageDetail(int msg_id){
		userDao = new UserDao();
		return userDao.getMessageDetail(msg_id);
	}
	public boolean compareDuration(int class_id){
		userDao= new UserDao();
		return userDao.compareDuration(class_id);
	}
	public int changeStatusOfMessages(int msg_id){
		userDao = new UserDao();
		return userDao.changeStatusMessages(msg_id);
		
	}
	public ArrayList<Schedule> getClassOpening() {
		userDao = new UserDao();
		return userDao.getClassOpening();
	}
}

