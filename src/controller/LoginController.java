package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import libralies.MD5Library;
import model.bean.User;
import model.bo.UserBo;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/admin/auth/login1.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBo userBo= new UserBo();
		String email =  request.getParameter("email").trim();
		User user= userBo.getUserByEmail(email);
		
		String pass =  MD5Library.md5(request.getParameter("password"));	
		
		if(pass.equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/trainer/index");
		}
		else{
			response.sendRedirect(request.getContextPath()+"/login");
			
		}
	}

}
