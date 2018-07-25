package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.CurrentUser;
import model.bean.Rooms;
import model.bo.ClassesBo;
import model.bo.CourseBo;
import model.bo.MajorBo;
import model.bo.RoomBo;
import model.bo.UserBo;


public class AddClassesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClassesController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(CurrentUser.checkLogin(request, response) == true) {
			if (CurrentUser.getUserCurrent(request, response).getRoleId() == 3) {
				
				ClassesBo classBo = new ClassesBo();
				MajorBo majorBo =  new MajorBo();
				CourseBo courseBo = new CourseBo();
				UserBo userBo = new UserBo();
				RoomBo roomBo = new RoomBo();
				
				ArrayList<String> days = new ArrayList<>();
				days.add("2");
				ArrayList<Rooms> rooms = roomBo.getRooms();
				
				request.setAttribute("majors", majorBo.getMajors());
				request.setAttribute("courses", courseBo.getCoursesAnable());
				request.setAttribute("trainers", userBo.getTrainers());
				request.setAttribute("times", classBo.getFreeTime(rooms.get(0).getRoomId()));
				request.setAttribute("rooms", rooms);
				request.setAttribute("timeInWeek", classBo.getFreeTimeInDay(1, days, rooms.get(0).getRoomId()));

				RequestDispatcher rd = request.getRequestDispatcher("/admin/classes/add.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/badrequest");
				return;
			}
		}else {
			return;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
