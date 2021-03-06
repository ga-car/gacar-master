package com.Project.rentacar;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class RentacarService implements RentacarDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<RentacarModel> rentacarList() {
		return sqlSessionTemplate.selectList("rentacar.rentacarList");
	}

	@Override
	public List<RentacarModel> rentacarLatLng(SearchModel searchModel) {
		return sqlSessionTemplate.selectList("rentacar.rentacarLatLngSearchList", searchModel);
	}

	@Override
	public List<RentacarModel> rentacarLatLngDate(SearchModel searchModel) {
		return sqlSessionTemplate.selectList("rentacar.rentacarLatLngDateSearchList", searchModel);
	}

	@Override
	public RentacarModel rentacarOneView(String car_no) {
		return sqlSessionTemplate.selectOne("rentacar.rentacarSearchOne", car_no);
	}

	@Override
	public int insertReserve(ReserveModel reserveModel) {
		return sqlSessionTemplate.insert("reserve.insertReserve", reserveModel);
	}

	@Override
	public List<ReserveModel> reserveCarList(String car_no) {
		return sqlSessionTemplate.selectList("reserve.reserveCarList", car_no);
	}

	@Override
	public List<ReserveModel> reserveList(Object reserve_mem_no) {
		return sqlSessionTemplate.selectList("reserve.reserveList", reserve_mem_no);
	}

	@Override
	public int reserveDelete(ReserveModel reserveModel) {
		return sqlSessionTemplate.update("reserve.reserveDelete", reserveModel);

	}

	@Override
	public List<RentacarModel> rentacarSearchList(String car_addr) {
		return sqlSessionTemplate.selectList("rentacar.rentacarAddrSearchList", "%" + car_addr + "%");
	}

	@Override
	public List<RentacarModel> rentacarDateList(SearchModel searchModel) {
		return sqlSessionTemplate.selectList("rentacar.rentacarDateList", searchModel);
	}

}
