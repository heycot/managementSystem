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
		// TODO Auto-generated method stub

		UserBo userBo = new UserBo();
		AbilityBo abilityBo = new AbilityBo();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");

		int userID = Integer.parseInt(request.getParameter("user_id"));

		String userName = request.getParameter("username");

		String oldPass = MD5Library.md5(request.getParameter("oldpass"));
		String password = MD5Library.md5(request.getParameter("newpass"));

		String fullName = request.getParameter("fullname");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String avatar = request.getParameter("avatar");
		Date dateOfBirth = FormatDateLibrary.ConvertStringToDateSQL(request.getParameter("dateOfBirth"));

		int skillId = Integer.parseInt(request.getParameter("skillId"));
		int experience = Integer.parseInt(request.getParameter("experience"));
		
		System.out.println(userID);
		System.out.println(userName);
		System.out.println(fullName);
		System.out.println(gender);
		System.out.println(address);
		System.out.println(phone);
		System.out.println(avatar);
		System.out.println(dateOfBirth);
		System.out.println("SkillID: "+skillId);
		System.out.println("Experience: "+experience);
		System.out.println(oldPass);

		User trainer = userBo.getTrainerById(userID);
		trainer.setUsername(userName);
		trainer.setPassword(password);
		trainer.setFullname(fullName);
		trainer.setGender(gender);
		trainer.setAddress(address);
		trainer.setPhone(phone);
		trainer.setDateOfBirth(dateOfBirth);
		if(avatar != null){
			trainer.setAvatar(avatar);		
		}

		List<Ability> abilities = abilityBo.getAbilitiesByUserId(userID);

		if (abilities != null && experience != 0) {
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

//		if (trainer.getPassword().equals(oldPass) && !oldPass.equals("d41d8cd98f00b204e9800998ecf8427e")) {
//			request.setAttribute("error", " This current password is incorrect!");
//			request.setAttribute("trainer", trainer);
//			request.setAttribute("abilities", abilities);
//
//			request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);
//		}
//		else{
//			trainer.setPassword(password);
//		}
//		
//		if (userBo.checkUsernameAlreadyExistsEdit(userName, trainer.getUserId())) {
//			request.setAttribute("trainer", trainer);
//			request.setAttribute("abilities", abilities);
//
//			request.setAttribute("error", " This username is already exists in system");
//			request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);
//
//		} else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 0) {
//
//		} else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 1) {
//
//			request.setAttribute("trainer", trainer);
//			request.setAttribute("abilities", abilities);
//			System.out.println("Fuck");
//
//
//			request.setAttribute("error", " Please add file jpg, png, gif");
//			request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request, response);
//		} else if (userBo.checkAddTraineeAvatar(request.getPart("avatar"), request) == 2) {
//			trainer.setAvatar(userBo.addTraineeAvatar(request.getPart("avatar"), request));
//		} else {
			if (userBo.editTrainer(trainer) != 0) {
				response.sendRedirect(request.getContextPath() + "/trainer/index");
			} else {
				request.setAttribute("trainer", trainer);
				request.setAttribute("abilities", abilities);

				request.setAttribute("error", " Can't edit trainer. Please try again later!");
				request.getRequestDispatcher("/admin/training_manager/edit_trainer_account.jsp").forward(request,
						response);
			}

		}
	}


