package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.TimeClass;
import model.bo.ClassesBo;


public class GetFreeTimeInDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public GetFreeTimeInDateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println("free time");
		try {
			int duration = 1;
			int roomId = 0;
			ArrayList<String> dayOfWeek = new ArrayList<>();
			
			if ( request.getParameter("duration") != null) {
				String durationStr = request.getParameter("duration");
				duration = Integer.parseInt(durationStr.substring(8));
			}
			
			if ( request.getParameter("roomId") != null) {
				roomId = Integer.parseInt(request.getParameter("roomId"));
				System.out.println("room id = " + roomId);
			}
			
			if ( request.getParameter("daySend") != null) {
				String days = request.getParameter("daySend");
				String[] dayArr = days.split(",");
				
				if(dayArr.length <= 1) {
					dayOfWeek.add("0");
				} else {

					for (String string : dayArr) {
						dayOfWeek.add(string);
					}
				}
			}
			
			
			ClassesBo classBo = new ClassesBo();
			ArrayList<TimeClass> times = classBo.getFreeTimeInDay(duration, dayOfWeek, roomId);
			
			String timeclass = " <div id='duration" + duration +"'  class='time red'> " ;
			for (TimeClass timeClass : times) {
				timeclass += "<input type='radio' name='time' value='" + timeClass.getTimeOfDate() + "' /> " + timeClass.getTimeOfDate() + "<br/>" ;
			}
			timeclass += "</div>";
			
			out.println(timeclass);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
