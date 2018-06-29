package model.bo;

import model.bean.Results;
import model.dao.ResultDao;
import model.dao.UserDao;

public class ResultBo {
	ResultDao resultDao;
	
	public int updateResult(Results result){
		resultDao = new ResultDao();
		return resultDao.updateResult(result);
	}

}