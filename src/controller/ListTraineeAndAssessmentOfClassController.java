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
import model.bean.Results;
import model.bean.User;
import model.bo.ClassesBo;
import model.bo.ResultBo;
import model.bo.UserBo;

/**
 * Servlet implementation class ListTraineeOfClassController
 */
@WebServlet("/trainer/list")
public class ListTraineeAndAssessmentOfClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTraineeAndAssessmentOfClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBo  userBo = new UserBo();
		Results result =  new Results();
		
		int id = Integer.parseInt((String) request.getParameter("class_id"));
		String name = (String) request.getParameter("name");
		ArrayList<User> listUser = userBo.getTraineeOfClass(id);
		
		boolean clas = userBo.compareDuration(id);
		int assessment ;
		if(clas==true){
			assessment =1;
		} else{
		    assessment =0;
		}
		int check  = 0;
		if ( request.getParameter("check") != null) {
			check = Integer.parseInt(request.getParameter("check"));
		}
		
		request.setAttribute("listUser", listUser);
		request.setAttribute("id", String.valueOf(id));
		request.setAttribute("name", name);	
		request.setAttribute("assessment", String.valueOf(assessment));
		request.setAttribute("check", String.valueOf(check));
		
		RequestDispatcher rd=request.getRequestDispatcher("/admin/trainer/listtraineeofClass.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ResultBo resultBo = new ResultBo();
		ClassesBo classBo = new ClassesBo();
		UserBo  userBo = new UserBo();
		int resultInsert = 0;
		int check;
		int resultOfTrainee = 0;
		
		int classId = Integer.parseInt(request.getParameter("class_id"));
		ArrayList<User> trainees = userBo.getTraineeOfClass(classId);
		request.setAttribute("class_id", classId);
		String name= classBo.getNameClass(classId);
		System.out.println(name);
		request.setAttribute("name", name);	
		
		for (User trainee : trainees) {
			String nametraineeIdRadio =  "trainee" + String.valueOf(trainee.getUserId());
			if (request.getParameter( nametraineeIdRadio ) != null){
				resultOfTrainee = Integer.parseInt((String) request.getParameter(nametraineeIdRadio));
				
				System.out.println(resultOfTrainee);
				Results result = new Results(0, classId, trainee.getUserId(), resultOfTrainee);
				if ( resultBo.updateResult(result) > 0) {
					resultInsert++;
				}	
			}
			
			
		}
		if(resultInsert == trainees.size()){
			check=1;
			
			response.sendRedirect(request.getContextPath() + "/trainer/list?class_id=" + classId + "&name=" + name + "&check=" + check);
			return;
		} else {
			check = 0;
			
			response.sendRedirect(request.getContextPath() + "/trainer/list?class_id=" + classId + "&name=" + name + "&check=" + check);
			return;
		}
		
		

		
	}

}