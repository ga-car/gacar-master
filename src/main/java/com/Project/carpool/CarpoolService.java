package com.Project.carpool;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.carpool.CarpoolDAO;
import com.Project.carpool.CarpoolModel;

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
	public List<CarpoolModel> carpoolSearch2(String search) {
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
	public int carpoolUpdateAttend(int no) {
		return sqlSessionTemplate.update("carpool.carpoolUpdateAttend",no); 
	}
	
}
