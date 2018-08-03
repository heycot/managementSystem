package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.CurrentUser;
import libralies.FormatDateLibrary;
import model.bean.Classes;
import model.bean.Rooms;
import model.bo.ClassesBo;
import model.bo.CourseBo;
import model.bo.MajorBo;
import model.bo.RoomBo;
import model.bo.UserBo;


public class ReOpenClassesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReOpenClassesController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(CurrentUser.checkLogin(request, response) == true) {
			if (CurrentUser.getUserCurrent(request, response).getRoleId() == 3) {
				
				try {
					ClassesBo classBo = new ClassesBo();
					MajorBo majorBo =  new MajorBo();
					CourseBo courseBo = new CourseBo();
					UserBo userBo = new UserBo();
					RoomBo roomBo = new RoomBo();
					
					ArrayList<String> days = new ArrayList<>();
					days.add("2");
					ArrayList<Rooms> rooms = roomBo.getRoomsEnable();
					int id = Integer.parseInt(request.getParameter("id"));
					Classes classRe = classBo.getClassById(id);
					
					request.setAttribute("class", classRe);
					request.setAttribute("rooms", rooms);
					request.setAttribute("trainer", userBo.getTrainerByIdCourse(classRe.getCourseId()));

					RequestDispatcher rd = request.getRequestDispatcher("/admin/classes/reopen.jsp");
					rd.forward(request, response);
				} catch (Exception e) {

					response.sendRedirect(request.getContextPath() + "/badrequest");
					return;
				}
				
			} else {
				response.sendRedirect(request.getContextPath() + "/badrequest");
				return;
			}
		}else {
			return;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			ClassesBo classBo = new ClassesBo();
			
			int classId = Integer.parseInt(request.getParameter("id").trim());
			Classes classRe = classBo.getClassById(classId);
			
			String className = request.getParameter("name").trim();
			int trainerId = Integer.parseInt(request.getParameter("trainer").trim());
			int roomId = Integer.parseInt(request.getParameter("room").trim());
			String dateOfWeek = "";
			String[] days = {"monday", "tuesday", "wednesday", "thursday", "friday"};
			for (String string : days) {
				if ( request.getParameter(string) != null) {
					dateOfWeek += request.getParameter(string) + ",";
				}
			}
			String timeOfDate = request.getParameter("time").trim();
			
			classRe.setName(className);
			classRe.setTrainerId(trainerId);
			classRe.setRoomId(roomId);
			classRe.setTimeOfDate(timeOfDate);
			classRe.setDateOfWeek(dateOfWeek);
			
			if (classBo.reopenClass(classRe) > 0) {

				response.sendRedirect(request.getContextPath() + "/classes/index?msg=5");
				return;
				
			} else {
				
				request.setAttribute("class", classRe);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/classes/reopen.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			response.sendRedirect(request.getContextPath() + "/badrequest");
		}
	}

}
