package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Roles;
import model.bo.RoleBo;

@WebServlet("/trainer/add")
public class AddNewTrainerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/admin/training_manager/add_trainer_account.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");
		String userName= request.getParameter("username");
		String password= request.getParameter("password");
		String fullName= request.getParameter("fullname");
		String gender= request.getParameter("gender");
		String address= request.getParameter("address");
		String phone= request.getParameter("phone");
		String dateOfBirth= request.getParameter("dateOfBirth");
		
		
		
	}

}
