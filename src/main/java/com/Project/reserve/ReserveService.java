package com.Project.reserve;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class ReserveService implements ReserveDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertReserve(ReserveModel reserveModel) {
		return sqlSessionTemplate.insert("reserve.insertReserve", reserveModel);
	}

}
