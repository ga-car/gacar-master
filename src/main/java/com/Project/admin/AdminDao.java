package com.Project.admin;

import java.util.List;

import com.Project.rentacar.RentacarModel;

public interface AdminDao {

	int insertRentacar(RentacarModel reatacarModel);

	List<RentacarModel> RentacarList();

}
