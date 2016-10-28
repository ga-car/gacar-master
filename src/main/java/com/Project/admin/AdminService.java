package com.Project.admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.Project.rentacar.RentacarModel;

public class AdminService implements AdminDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertRentacar(RentacarModel reatacarModel) {
		return sqlSessionTemplate.insert("admin.insertRentacar", reatacarModel);
	}
}
