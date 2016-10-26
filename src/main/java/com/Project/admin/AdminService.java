package com.Project.admin;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.Project.notify.NotifyModel;
import com.Project.rentacar.RentacarModel;

public class AdminService implements AdminDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//�۸��
	@Override
	public List<RentacarModel> RentacarList() {
		return sqlSessionTemplate.selectList("admin.rentacarList"); 
	}

	//�۾���
	@Override
	public int insertRentacar(RentacarModel reatacarModel) {
		return sqlSessionTemplate.insert("admin.insertRentacar", reatacarModel);
	}
}
