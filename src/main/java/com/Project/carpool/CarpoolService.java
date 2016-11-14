package com.Project.carpool;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.carpool.CarpoolDAO;
import com.Project.carpool.CarpoolModel;
import com.Project.carpool.AttendModel;

@Service
public class CarpoolService implements CarpoolDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CarpoolModel> carpoolList() {
		return sqlSessionTemplate.selectList("carpool.carpoolList");
	}

	@Override
	public int carpoolWrite(CarpoolModel carpoolModel) {
		return sqlSessionTemplate.insert("carpool.carpoolWrite", carpoolModel);
	}

	@Override
	public CarpoolModel carpoolView(int no) {
		return sqlSessionTemplate.selectOne("carpool.carpoolView",no); 
	}

	@Override
	public int carpoolUpdateReadcount(int no) {
		return sqlSessionTemplate.update("carpool.carpoolUpdateReadcount",no); 
	}

	@Override
	public List<CarpoolModel> carpoolSearch0(String search) {
		return sqlSessionTemplate.selectList("carpool.carpoolSearch0", "%"+search+"%"); 
	}

	@Override
	public List<CarpoolModel> carpoolSearch1(String search) {
		return sqlSessionTemplate.selectList("carpool.carpoolSearch1", "%"+search+"%"); 
	}

	@Override
	public List<AttendModel> carpoolSearch2(String search) {
		return sqlSessionTemplate.selectList("carpool.carpoolSearch2", "%"+search+"%"); 
	}

	@Override
	public int carpoolModify(CarpoolModel carpoolModel) {
		return sqlSessionTemplate.update("carpool.carpoolModify",carpoolModel); 
	}

	@Override
	public int carpoolDelete(int no) {
		return sqlSessionTemplate.update("carpool.carpoolDelete",no); 
	}
	
	@Override
	public int carpoolAttendIncrease(int no) {
		return sqlSessionTemplate.update("carpool.carpoolAttendIncrease",no); 
	}
	
	@Override
	public int carpoolAttendDecrease(int no) {
		return sqlSessionTemplate.update("carpool.carpoolAttendDecrease",no); 
	}
	
	
	@Override
	public int attendWrite(int no, String email) {
		AttendModel attendModel = new AttendModel();
		attendModel.setEmail(email);
		attendModel.setNo(no);
		return sqlSessionTemplate.insert("carpool.attendWrite", attendModel);
	}
	
	@Override
	public int attendOverlap(int no, String email)
	{
		AttendModel attendModel = new AttendModel();
		attendModel.setEmail(email);
		attendModel.setNo(no);
		return sqlSessionTemplate.selectList("carpool.attendOverlap", attendModel).size();
	}
	
	@Override
	public List<AttendModel> carpoolattendList() {
		return sqlSessionTemplate.selectList("carpool.carpoolAttendList");
	}
	
	@Override
	public List<CarpoolModel> carpoolmypageList(String email) {
		return sqlSessionTemplate.selectList("carpool.carpoolmypageList",email);
	}
	
	@Override
	public List<CarpoolModel> carpoolmypageattendList(String email) {
		return sqlSessionTemplate.selectList("carpool.carpoolmypageattnedList",email);
	}
	
	@Override
	public List<AttendModel> carpoolmypageapplyList(String email) {
		return sqlSessionTemplate.selectList("carpool.carpoolmypageapplyList", email);
	}
	
	@Override
	public int carpoolAttendDelete(String email, int no) {
		AttendModel attendModel = new AttendModel();
		attendModel.setEmail(email);
		attendModel.setNo(no);
		return sqlSessionTemplate.update("carpool.carpoolAttendDelete",attendModel); 
	}
	
	@Override
	public int carpoolApplyDelete(String email, int no) {
		AttendModel attendModel = new AttendModel();
		attendModel.setEmail(email);
		attendModel.setNo(no);
		return sqlSessionTemplate.update("carpool.carpoolApplyDelete",attendModel); 
	}
	
	@Override
	public String getNo(int no) {
		return sqlSessionTemplate.selectOne("carpool.getNo", no); 
	}
	
	

}
