package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Courses;
import model.bean.Majors;
import model.bo.CourseBo;
import model.bo.MajorBo;


public class AddCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MajorBo majorBo = new MajorBo();
		
		request.setAttribute("majors", majorBo.getMajors());
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/course/add.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CourseBo courseBo = new CourseBo();
			String message = "";
			
			Courses course = new Courses(0, Integer.parseInt(request.getParameter("major")), request.getParameter("name"), Integer.parseInt(request.getParameter("duration")), 1, Integer.parseInt(request.getParameter("kindOfCourse")) );
		
			if ( courseBo.checkValidateCourse(request.getParameter("name"), request.getParameter("major"), request.getParameter("duration"), request.getParameter("kindOfCourse")) == false) {

				message = "Please complate all information";
				responseWhenWrong(course, request, response, message);
				
			} else if (courseBo.checkCourseAlreadyExists(request.getParameter("name")) == true) {

				message = "This course is already exists in system";
				responseWhenWrong(course, request, response, message);
				
			} else {
				
				if ( courseBo.addCourse(course) > 0) {
					
					response.sendRedirect(request.getContextPath() + "/course/index?msg=1");
					return;
					
				} else {

					message = "Sorry! Can't add this course. please try again";
					responseWhenWrong(course, request, response, message);
				}
			}
		
		} catch( Exception e) {
			System.out.println(e.getMessage());
			System.out.println("exception add new course");
		}
	}
	
	
	public void responseWhenWrong( Courses course, HttpServletRequest request, HttpServletResponse response, String message) {

		try {
			MajorBo majorBo = new MajorBo();
			
			request.setAttribute("majors", majorBo.getMajors());
			request.setAttribute("course", course);
			request.setAttribute("error", message);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/course/add.jsp");
			rd.forward(request, response);
			
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
