package com.Project.admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.Project.rentacar.RentacarModel;

public class AdminService implements AdminDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Object insertRentacar(RentacarModel reatacarModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("rentacar.insertpet", reatacarModel);
	}
}
