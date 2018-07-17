package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.CurrentUser;
import model.bean.Skills;
import model.bo.SkillBo;

/**
 * Servlet implementation class DeleteSkillsController
 */
@WebServlet("/DeleteSkills")
public class DeleteSkillsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteSkillsController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*if (CurrentUser.checkLogin(request, response)){
			if(CurrentUser.getUserCurrent(request, response).getRoleId()==3){
				try {
					
					SkillBo skill = new SkillBo();
					
					int skillId = 0;
					if(request.getParameter("name") != null){
						skillId = 
					}
				}
			}
		}*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			SkillBo skillBo = new SkillBo();
			
			int result = 0;
			//boolean check = false;
			//String name = "";
			
			List<Skills> skills = skillBo.getSkills();
			
			for(Skills skill: skills){
				String skillId = (String.valueOf(skill.getSkillId()));
				if(skillId.equals(request.getParameter("skill"+skill.getSkillId()))){
					skillBo.deleteSkills(skill.getSkillId());
						result++;
					}
					/*else if (skillBo.deleteSkills(skill.getSkillId()) == -1){
						name += skill.getName() + " ";
						check = true;
					}*/
				
			}
			
			/*if(check == true){
				response.sendRedirect(request.getContextPath() + "/Skills?msg=5&name=" + name);
				return;
			} else {*/
				if(result>0){
					response.sendRedirect(request.getContextPath() + "/Skills?msg=4");
					return;
				} else{
					response.sendRedirect(request.getContextPath() + "/Skills?msg=0");
					return;
				}
			//}
			
			
		} catch(Exception e){
			System.out.println(e.getMessage());
			response.sendRedirect(request.getContextPath() + "/badrequest");
			return;
		}
	}

}
