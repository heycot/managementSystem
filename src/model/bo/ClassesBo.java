package model.bo;

import java.util.ArrayList;

import model.bean.Classes;
import model.bean.TimeClass;
import model.dao.ClassesDao;

public class ClassesBo {

	public ArrayList<Classes> getClasseseByCourseId(int courseId) {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.getClasseseByCourseId(courseId);
	}
	
	public String getNameClass(int classId){
		ClassesDao classDao = new ClassesDao();
		return classDao.getNameClass(classId);
		
	}
	
	public int updateStatusClass(int Class){
		ClassesDao classDao = new ClassesDao();
		return classDao.updateStatusClass(Class);
	}

	public ArrayList<Classes> getClassese() {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.getClassese();
	}

	public ArrayList<Classes> getClasseseWaiting() {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.getClasseseWaiting();
	}

	public ArrayList<Classes> getClasseseOpenning() {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.getClasseseOpenning();
	}

	public ArrayList<Classes> getClasseseFinished() {

		ClassesDao classDao = new ClassesDao();
		
		return classDao.getClasseseFinished();
	}

	public int changeStatus(int classId, int status) {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.changeStatus(classId, status);
	}

	public ArrayList<Integer> getTraineeWaitingByClass(int classId) {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.getTraineeWaitingByClass(classId);
	}

	public int delTraieeWaitting(int classId) {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.delTraieeWaitting(classId);
	}

	public int addTraineeLearning(Integer integer, int classId) {
		ClassesDao classDao = new ClassesDao();
		
		return classDao.addTraineeLearning(integer, classId);
	}
	
	public ArrayList<TimeClass> getFreeTime(int roomId){
		ClassesDao classDao = new ClassesDao();
		
		ArrayList<TimeClass> timeFrees = new ArrayList<>();
		ArrayList<TimeClass> times = classDao.getTimeClass();
		
		int i = 0;
		for ( int day = 2; day < 8; day++) {
			for (TimeClass time : times) {
				if (classDao.checkTimeAlready(time.getTimeOfDate(), String.valueOf(day), roomId) == false) {

					TimeClass timefree = new TimeClass(i, time.getTimeOfDate(), day, time.getDuration());
					if ( checkTime(timeFrees, time.getTimeOfDate()) == false) {
						timeFrees.add(timefree);
					}
					i++;
				}
			}
		}
		
		return timeFrees;
	}
	
	public ArrayList<TimeClass> getFreeTimeInDay(int duration, ArrayList<String> days, int roomId) {
		ClassesDao classDao = new ClassesDao();
		
		ArrayList<TimeClass> timeFrees = new ArrayList<>();
		ArrayList<TimeClass> times = classDao.getTimeClassByDuration(duration);
		ArrayList<TimeClass> timeBusy = new ArrayList<>();
		
		
		int i = 0;
		for (String day: days) {
			for (TimeClass time : times) {
				if (classDao.checkTimeAlready(time.getTimeOfDate(), String.valueOf(day), roomId)) {

					TimeClass timebusy = new TimeClass(i, time.getTimeOfDate(), day, time.getDuration());
					if ( checkTime(timeFrees, time.getTimeOfDate()) == false) {
						timeBusy.add(timebusy);
					}
					i++;
				}
			}
		}
		
		for(TimeClass time : times ) {
			if( checkTime(timeBusy, time.getTimeOfDate()) == false) {
				timeFrees.add(time);
			}
		}
		
		return timeFrees;
	}
	
	/*public ArrayList<TimeClass> getFreeTimeOfRoom(int roomId, ArrayList<String> days) {
		ClassesDao classDao = new ClassesDao();

		ArrayList<TimeClass> timeFrees = new ArrayList<>();
		ArrayList<TimeClass> times = classDao.getTimeClass();
		ArrayList<TimeClass> timeBusy = new ArrayList<>();
		
		
		int i = 0;
		for (String day: days) {
			for (TimeClass time : times) {
				if (classDao.checkTimeAlreadyInRoom(roomId)) {

					TimeClass timebusy = new TimeClass(i, time.getTimeOfDate(), day, time.getDuration());
					if ( checkTime(timeFrees, time.getTimeOfDate()) == false) {
						timeBusy.add(timebusy);
					}
					i++;
				}
			}
		}
		
		for(TimeClass time : times ) {
			if( checkTime(timeBusy, time.getTimeOfDate()) == false) {
				timeFrees.add(time);
			}
		}
		
		return times;
	}*/
	
	public boolean checkTime(ArrayList<TimeClass> times, String time) {
		for (TimeClass timeClass : times) {
			if ( timeClass.getTimeOfDate().equals(time)) {
				return true;
			}
		}
		return false;
	}


}