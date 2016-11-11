package com.Project.admin;

import java.util.List;

import com.Project.member.MemberModel;
import com.Project.rentacar.RentacarModel;

public interface AdminDAO {
	
	int insertRentacar(RentacarModel reatacarModel);

	List<RentacarModel> rentacarAdminList();
	
	//회원목록
		public List<MemberModel> memberList();
		public List<MemberModel> withdrawList();
		public List<MemberModel> totalList();
		
		//회원삭제
		public int deleteMem(String email);
		public int updateRestoreMem(String email);
		public Object adminUpdateMem(MemberModel mem);
		public Object adminUpdate(MemberModel mem);
		
		//회원검색
		public List<MemberModel> memberSearch1(String search);
		public List<MemberModel> memberSearch2(String search);
		
		public List<MemberModel> withdrawSearch1(String search);
		public List<MemberModel> withdrawSearch2(String search);
		
		//회원정렬
		public List<MemberModel> memberSort0();
		public List<MemberModel> memberSort1();
		
		public List<MemberModel> memberSort0(int searchNum, String search);
		public List<MemberModel> memberSort1(int searchNum, String search);
}
