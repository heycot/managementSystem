package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Classes;
import model.bean.User;
import model.bo.UserBo;

/**
 * Servlet implementation class ListTraineeOfClassController
 */
@WebServlet("/trainer/list")
public class ListTraineeAndAssessmentOfClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserBo  userBo;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTraineeAndAssessmentOfClassController() {
        super();
        userBo = new UserBo();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String class_id = (String) request.getParameter("class_id");
		int id = Integer.parseInt(class_id);
		ArrayList<User> listUser = userBo.getTraineeOfClass(id);
		request.setAttribute("listUser", listUser);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/trainer/listtraineeofClass.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
