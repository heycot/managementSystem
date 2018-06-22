package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.FormatDateLibrary;
import libralies.MD5Library;
import model.bean.User;
import model.bo.UserBo;

@MultipartConfig
public class AddTraineeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddTraineeController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/trainees/addTrainee.jsp");
		rd.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println(request.getParameter("dateOfBirth"));
		User user = new User(0, request.getParameter("username"), request.getParameter("password"), request.getParameter("fullname"), FormatDateLibrary.ConvertStringToDateSQL(request.getParameter("dateOfBirth")) , request.getParameter("email"), FormatDateLibrary.ConvertDateUntilToDateSQL(new Date()), 2, Integer.parseInt(request.getParameter("gender")), request.getParameter("address"), request.getParameter("phone"), "", "");
		
		UserBo userBo = new UserBo();
		
		/* if ( userBo.checkTraineeInformation(request.getParameter("username"), request.getParameter("password"), request.getParameter("fullname"), request.getParameter("dateOfBirth") , request.getParameter("email"), request.getParameter("gender"), request.getParameter("address"), request.getParameter("phone")) == 0){
			 	System.out.println();
				request.setAttribute("error", "Please complete all information");
				request.setAttribute("trainee", user);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/trainees/addTrainee.jsp");
				rd.forward(request, response); 
				
		 }else */if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 0) {
			}else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 1) {

				request.setAttribute("trainee", user);
				request.setAttribute("error", "Please add file jpg, png, gif");
				RequestDispatcher rd = request.getRequestDispatcher("/admin/trainees/addTrainee.jsp");
				rd.forward(request, response); 
				
			} else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 2) {
			 	
				user.setAvatar(userBo.addTraineeAvatar(request.getPart("avatar"), request));
			}	

			user.setPassword(MD5Library.md5(user.getPassword()));
			//System.out.println("encode pass : " + hashed);
			if ( userBo.addTrainee(user) > 0) {
				response.sendRedirect(request.getContextPath() + "/trainee/index?msg=1");
			} else {
				request.setAttribute("trainee", user);
				request.setAttribute("error", "Can't add trainee. please try again later");
				RequestDispatcher rd = request.getRequestDispatcher("/admin/trainees/addTrainee.jsp");
				rd.forward(request, response); 
			}
				
		}

}
