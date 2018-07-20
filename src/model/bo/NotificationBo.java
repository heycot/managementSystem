package model.bo;
import model.bean.Classes;
import model.bean.RequestTakDayOff;
import model.bean.User;
import model.dao.NotificationDao;

public class NotificationBo {
	NotificationDao notificationDao;
	public int addNotiTakedayoffS( String dateoff, String datechange,  String timechange , String room, Classes classes , User trainer, int admin_id){
		notificationDao = new NotificationDao();
		return notificationDao.addNotiTakedayoffS(dateoff, datechange, timechange,room, classes, trainer, admin_id);
	}
	public int addRequestTakeaDayOff(String dateoff, String datechange,  String timechange , Classes classes , User trainer, int room_id){
		notificationDao = new NotificationDao();
		return notificationDao.addRequestTakeaDayOff(dateoff, datechange, timechange, classes, trainer, room_id);
	}
	public int addNotiRequestBeApproveSendToTrainer(RequestTakDayOff dayOff){
		notificationDao = new NotificationDao();
		return notificationDao.addNotiRequestBeApproveSendToTrainer(dayOff);
	}
	
	public int addNotiRequestTakeDateOffToTraineeOffClass(RequestTakDayOff dayOff){
		notificationDao = new NotificationDao();
		return notificationDao.addNotiRequestTakeDateOffToTraineeOffClass(dayOff);
	}
	
	public int changeStatusAllMessagesOfUser(int user_id){
		notificationDao = new NotificationDao();
		return notificationDao.changeStatusAllMessagesOfUser(user_id);
}
}
