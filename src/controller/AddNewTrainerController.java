package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.FormatDateLibrary;
import libralies.MD5Library;
import model.bean.Ability;
import model.bean.User;
import model.bo.UserBo;

@MultipartConfig
public class AddNewTrainerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/admin/training_manager/add_trainer_account.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserBo userBo= new UserBo();
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
		
		String email= request.getParameter("email");
		String userName= request.getParameter("username");
		String password= MD5Library.md5(request.getParameter("password"));
		String fullName= request.getParameter("fullname");
		int gender= Integer.parseInt(request.getParameter("gender"));
		String address= request.getParameter("address");
		String phone= request.getParameter("phone");
		String avatar= request.getParameter("avatar");
		Date dateOfBirth= FormatDateLibrary.ConvertStringToDateSQL(request.getParameter("dateOfBirth"));
		Date createdDate= FormatDateLibrary.ConvertDateUntilToDateSQL(new java.util.Date());
		int skillId=Integer.parseInt(request.getParameter("skillId"));
		int experience = Integer.parseInt(request.getParameter("experience"));
		
		User trainer = new User(0, userName, password, fullName, dateOfBirth,
				email, createdDate, 1, gender, address, phone, "", avatar);
		
		Ability ability= new Ability(0,userBo.getLastUserId()+1, skillId, experience, 0);
		
		if (userBo.checkEmailAlreadyExists(email)) {
			request.setAttribute("error", " This email is already exists in system!");
			request.getRequestDispatcher("/admin/training_manager/add_trainer_account.jsp").forward(request, response);
		}
		else if (userBo.checkUsernameAlreadyExists(userName)) {
			request.setAttribute("error", " This username is already exists in system!");
			request.getRequestDispatcher("/admin/training_manager/add_trainer_account.jsp").forward(request, response);
		}
		else {
			if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 0) {
					trainer.setAvatar("default.jpg");
			}else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 1) {
				request.setAttribute("error", " Please add file jpg, png, gif");
				request.getRequestDispatcher("/admin/training_manager/add_trainer_account.jsp").forward(request, response);
			}else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 2) {
				trainer.setAvatar(userBo.addTraineeAvatar(request.getPart("avatar"), request));
			}
			
			if (userBo.addTrainer(trainer, ability) > 0) {
				response.sendRedirect(request.getContextPath() + "/trainer/index");
			} else {
				request.setAttribute("error", " Can't add trainee. please try again later");
				request.getRequestDispatcher("/admin/training_manager/add_trainer_account.jsp").forward(request, response);
			}

		}	
		
	}

}
