package com.Project.carpool;


import java.util.List;

public interface CarpoolDAO {

	List<CarpoolModel> carpoolList();
	
	int carpoolWrite(CarpoolModel CarpoolModel);
	
	CarpoolModel carpoolView(int no);
	
	int carpoolUpdateReadcount(int no);
	
	List<CarpoolModel> carpoolSearch0(String search);
	
	List<CarpoolModel> carpoolSearch1(String search);
	
	List<CarpoolModel> carpoolSearch2(String search);
	
	int carpoolModify(CarpoolModel CarpoolModel);
	
	int carpoolDelete(int no);
	
	int carpoolUpdateAttend(int no);
	
	int attendWrite(int no, String name);
	
	int attendOverlap(int no, String name);
}