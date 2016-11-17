package com.Project.carpool;


import java.util.List;


public interface CarpoolDAO {

	List<CarpoolModel> carpoolList();
	
	int carpoolWrite(CarpoolModel CarpoolModel);
	
	CarpoolModel carpoolView(int no);
	
	int carpoolUpdateReadcount(int no);
	
	List<CarpoolModel> carpoolSearch0(String search);
	
	List<CarpoolModel> carpoolSearch1(String search);
	
	List<AttendModel> carpoolSearch2(String search);
	
	int carpoolModify(CarpoolModel CarpoolModel);
	
	int carpoolDelete(int no);
	
	int carpoolAttendIncrease(int no);
	
	int carpoolAttendDecrease(int no);
	
	int attendWrite(int no, String email);
	
	int attendOverlap(int no, String email);
	
	List<AttendModel> carpoolattendList();
	
	List<CarpoolModel> carpoolmypageList(String email);
	
	List<CarpoolModel> carpoolmypageattendList(String email);
	
	List<AttendModel> carpoolmypageapplyList(String email);
	
	int carpoolAttendDelete(String email, int no);
	
	int carpoolApplyDelete(String email, int no);
	
	String getNo(int no);
}