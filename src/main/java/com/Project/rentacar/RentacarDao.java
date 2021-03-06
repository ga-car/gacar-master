package com.Project.rentacar;

import java.util.List;

public interface RentacarDao {

	List<RentacarModel> rentacarList();

	List<RentacarModel> rentacarLatLng(SearchModel searchModel);

	List<RentacarModel> rentacarLatLngDate(SearchModel searchModel);

	RentacarModel rentacarOneView(String car_no);

	int insertReserve(ReserveModel reserveModel);

	List<ReserveModel> reserveCarList(String car_no);

	List<ReserveModel> reserveList(Object reserve_mem_no);

	List<RentacarModel> rentacarSearchList(String car_addr);

	int reserveDelete(ReserveModel reserveModel);

	List<RentacarModel> rentacarDateList(SearchModel searchModel);
}
