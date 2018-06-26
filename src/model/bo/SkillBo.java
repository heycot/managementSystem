package model.bo;

import java.util.List;

import model.bean.Skills;
import model.dao.SkillDao;

public class SkillBo {
	public List<Skills> getSkills(){
		SkillDao skillDao= new SkillDao();
		return skillDao.getSkills();
	}

}
