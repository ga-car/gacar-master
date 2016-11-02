package com.Project.rentacar;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class RentacarService implements RentacarDao{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<RentacarModel> rentacarList() {
		return sqlSessionTemplate.selectList("rentacar.rentacarList"); 
	}
	

}
