package model.bo;

import java.util.ArrayList;

import model.bean.Majors;
import model.dao.MajorDao;

public class MajorBo {

	public ArrayList<Majors> getMajors() {
		MajorDao majorDao = new MajorDao();
		return majorDao.getMajors();
	}

}