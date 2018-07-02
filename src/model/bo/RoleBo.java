package model.bo;

import java.util.List;

import model.bean.Roles;
import model.dao.RoleDao;

public class RoleBo {
	public List<Roles> getRoles(){
		RoleDao roleDao = new RoleDao();
		return roleDao.getRoles();
	}

}
