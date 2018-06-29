package model.bo;

import model.bean.Classes;
import model.dao.ClassesDao;

public class ClassesBo {
	ClassesDao classDao;
	
	
	public String getNameClass(int classId){
		ClassesDao classDao = new ClassesDao();
		return classDao.getNameClass(classId);
		
	}
}