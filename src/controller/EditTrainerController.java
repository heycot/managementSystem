package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import libralies.FormatDateLibrary;
import libralies.MD5Library;
import model.bean.Ability;
import model.bean.User;
import model.bo.AbilityBo;
import model.bo.UserBo;

@MultipartConfig
public class EditTrainerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserBo userBo = new UserBo();
		AbilityBo abilityBo = new AbilityBo();

		int userId = Integer.parseInt(request.getParameter("id"));
		User trainer = userBo.getTrainerById(userId);
		List<Ability> abilities = abilityBo.getAbilitiesByUserId(userId);

		request.setAttribute("trainer", trainer);
		request.setAttribute("abilities", abilities);

		request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserBo userBo = new UserBo();
		AbilityBo abilityBo = new AbilityBo();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
		int userID = Integer.parseInt(request.getParameter("user_id"));
		
		String userName = request.getParameter("username");
		String fullName = request.getParameter("fullname");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		Date dateOfBirth = FormatDateLibrary.ConvertStringToDateSQL(request.getParameter("dateOfBirth"));

		int skillId = Integer.parseInt(request.getParameter("skillId"));
		int experience = Integer.parseInt(request.getParameter("experience"));

		User trainer = userBo.getTrainerById(userID);
		trainer.setUsername(userName);
		trainer.setFullname(fullName);
		trainer.setGender(gender);
		trainer.setAddress(address);
		trainer.setPhone(phone);
		trainer.setDateOfBirth(dateOfBirth);
		

		List<Ability> abilities = abilityBo.getAbilitiesByUserId(userID);

		if (abilities != null & experience !=0) {
			boolean isExistingId = false;
			for (Ability ability : abilities) {
				if (ability.getSkillId() == skillId) {
					ability.setExperience(experience);
					abilityBo.editTrainerAbility(ability);
					isExistingId = true;
					break;
				}
			}
			if (!isExistingId) {
				Ability ability = new Ability(0, userID, skillId, experience, 0);
				abilityBo.addTrainerAbility(ability);
			}
		}
		
		if ( !"".equals(request.getParameter("oldpass"))) { 
			
			if (trainer.getPassword().equals(MD5Library.md5(request.getParameter("oldpass")))) {
				trainer.setPassword(MD5Library.md5(request.getParameter("newpass")));
			} else {
				request.setAttribute("error", " This current password is incorrect!");
				request.setAttribute("trainer", trainer);
				request.setAttribute("abilities", abilities);	
				request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);
				
			}
		} 
		
		
		if (userBo.checkUsernameAlreadyExistsEdit(userName, trainer.getUserId())) {
			System.out.println("check usernmae");
			request.setAttribute("trainer", trainer);
			request.setAttribute("abilities", abilities);

			request.setAttribute("error", " This username is already exists in system");
			request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);

		}
		
		System.out.println(request.getPart("avatar"));
		if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 0) {	
			System.out.println("no avatar new");
			trainer.setAvatar(trainer.getAvatar());

		} else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 1) {
			request.setAttribute("trainer", trainer);
			request.setAttribute("abilities", abilities);

			request.setAttribute("error", " Please add file jpg, png, gif");
			request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);
			
		} else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 2) {
			trainer.setAvatar(userBo.addTraineeAvatar(request.getPart("avatar"), request));
			System.out.println("=====" + trainer.getAvatar());
			
		}
		
		
		if (userBo.editTrainer(trainer) > 0) {
			response.sendRedirect(request.getContextPath() + "/trainer/index?msg=2");
		} else {
			request.setAttribute("trainer", trainer);
			request.setAttribute("abilities", abilities);

			request.setAttribute("error", " Can't edit trainer. Please try again later!");
			request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);
		}

		
	}
}


