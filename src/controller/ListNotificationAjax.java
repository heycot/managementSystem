package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.MyMessages;
import model.bo.UserBo;

/**
 * Servlet implementation class ListNotificationAjax
 */
@WebServlet("/ListNotificationAjax")
public class ListNotificationAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserBo userBo;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListNotificationAjax() {
        super();
        userBo = new UserBo();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ArrayList<MyMessages> listMessage = new ArrayList<>();
//		listMessage = userBo.getMessagesOfTrainee(4);
//		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		ArrayList<MyMessages> listMsg =  userBo.getMessagesOfTrainee(4);
		PrintWriter out = response.getWriter();
		int countrows =0 ;		
		if (listMsg.size()!=0) {
			out.print("<li>Notification</> "+" ("+listMsg.size()+")");
			
		
			for (MyMessages myMessages: listMsg){
				countrows++;
				if (countrows==7) {
					break;
				}
				
				if(myMessages.getStatus()==0){
					out.print("<li style='background-color: rgb(212, 237, 218)'><a href='/managementSystem/trainee/detailnoti?msg_id="+myMessages.getMsgId()+"'><span class='image'><img src='<%= request.getContextPath()%>/templates/images/img.jpg' alt='Profile Image' /></span>"
							+ "<span>"
							
									+ "</span>"
									+ "<span class='message'>"
											+ myMessages.getNotiContent()
											+ " </span></a></li>");
					}
				else {
					out.print("<li><a href='/managementSystem/trainee/detailnoti?msg_id="+myMessages.getMsgId()+"'><span class='image'><img src='<%= request.getContextPath()%>/templates/images/img.jpg' alt='Profile Image' /></span>"
							+ "<span>"
							
									+ "</span>"
									+ "<span class='message'>"
											+ myMessages.getNotiContent()
											+ " </span></a></li>");
				}
				
			}
			out.println(" <li>"
					+ "<div class='text-center'>"
							+ "<a href='/managementSystem/trainee/listDetailNoti'>"
							+ "<strong>See All Notification</strong>"
							+ " <i class='fa fa-angle-right'></i>"
									+ "</a>"
									+ "</div></li>");
		
		}
		else {
			out.println("<li>No Notification</li>");
		}
		

}
}

