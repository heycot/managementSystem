package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.CurrentUser;
import model.bean.ClassWaiting;
import model.bean.User;
import model.bo.ClassWatingBo;
import model.bo.UserBo;

/**
 * Servlet implementation class RegisterClassControllerAjax
 */
@WebServlet("/RegisterClassControllerAjax")
public class RegisterClassControllerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterClassControllerAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (CurrentUser.checkLogin(request, response)) {
			User user = CurrentUser.getUserCurrent(request, response);
			if (user.getRoleId() == 2) {
				
				ClassWatingBo classWatingBo = new ClassWatingBo();
				String classOpening = (String) request.getParameter("classOpening_id");
				int classOpening_id = Integer.valueOf(classOpening);
				ClassWaiting classWaiting =  classWatingBo.getClassWaitingById(classOpening_id);
				PrintWriter out = response.getWriter();
				ArrayList<ClassWaiting> classWaitingofTrainee = classWatingBo.getClassWaitingOfTrainee(user.getUserId());
				int class_id = classWatingBo.checkConflicRegisterClass(classWaiting, classWaitingofTrainee);
				if(class_id!=0){
					ClassWaiting classConflicted = classWatingBo.getClassWaitingById(class_id);
					out.println("<div class='alert alert-danger'>");
					out.println("<h4 style='font-size:20px; padding:10px 5px 10px;' class='modal-title'>Cann't register this Class</h4>");
					out.print("</div> <div class ='modal-body' >");
					out.println("<label style='font-size:15px; color: #343a40;; padding: 10px 5px 10px;' > Because of having conflig with class: "+ classConflicted.getClassName() +"</label>");
					out.println("</div> <div class='modal-footer'><button type='button' style=' background:#2e9ade; color: white; ' class ='btn btn-infor' data-dismiss='modal'>Close</button> </div>");
				
				} else {
					UserBo userBo = new UserBo();
					if(userBo.registedClass(user.getUserId(), classOpening_id)>0){
						ClassWaiting classregisted = classWatingBo.getClassWaitingById(classOpening_id);
						out.println("<div class='alert alert-success'>");
						out.println("<h4 style='font-size:20px; padding:10px 5px 10px;' class='modal-title'>Register Successfull! </h4>");
						out.print("</div> <div class ='modal-body' >");
						out.println("<label style='font-size:15px; color: #343a40;; padding: 10px 5px 10px;' > You registed class: "+ classregisted.getClassName() +"</label>");
						out.println("</div> <div class='modal-footer'><button type='button' style=' background:#2e9ade; color: white; ' class ='btn btn-infor' data-dismiss='modal'>Close</button> </div>");
					
						
					} else{
						out.println("Register failed");
					}
				}		
			
				
			}  else {
				response.sendRedirect(request.getContextPath() + "/badrequest");
				return;
			}
		} else {
			return;
		}
		
		
		
	}

}
//SELECT * FROM mcts.classes where class_id != all (select class_id from waiting where user_id =54) ;
