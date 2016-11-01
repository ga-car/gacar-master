package com.Project.admin;

import java.util.List;

import com.Project.rentacar.RentacarModel;

public interface AdminDAO {
	
	List<RentacarModel> rentacarList();

	int insertRentacar(RentacarModel reatacarModel);
}
