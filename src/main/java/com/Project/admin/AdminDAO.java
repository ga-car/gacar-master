package com.Project.admin;

import java.util.List;

import com.Project.member.MemberModel;
import com.Project.rentacar.RentacarModel;
import com.Project.rentacar.ReserveModel;

public interface AdminDAO {

	int insertRentacar(RentacarModel reatacarModel);

	List<RentacarModel> rentacarAdminList();

	List<ReserveModel> reserveAdminList();

	ReserveModel reserveAdminModify(int reserve_no);

	RentacarModel rentacarAdminOne(String car_no);

	// 회원목록
	public List<MemberModel> memberList();

	public List<MemberModel> withdrawList();

	// 회원삭제
	public int deleteMem(String email);

	public int updateRestoreMem(String email);

	public Object adminUpdateMem(MemberModel mem);

	public Object adminUpdate(MemberModel mem);

	// 회원검색
	List<MemberModel> memberSearch1(String search);

	List<MemberModel> memberSearch2(String search);

}
