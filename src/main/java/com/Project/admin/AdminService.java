package com.Project.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.rentacar.RentacarModel;

@Service
public class AdminService implements AdminDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<RentacarModel> rentacarList() {
		return sqlSessionTemplate.selectList("admin.rentacarList"); 
	}

	@Override
	public int insertRentacar(RentacarModel reatacarModel) {
		return sqlSessionTemplate.insert("admin.insertRentacar", reatacarModel);
	}

}
