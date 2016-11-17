package com.Project.admin;

import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.member.MemberModel;
import com.Project.rentacar.RentacarModel;
import com.Project.rentacar.ReserveModel;

@Service
public class AdminService implements AdminDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// 차등록
	@Override
	public List<RentacarModel> rentacarAdminList() {
		return sqlSessionTemplate.selectList("rentacar.rentacarAdminList");
	}

	@Override
	public int insertRentacar(RentacarModel reatacarModel) {
		return sqlSessionTemplate.insert("rentacar.insertRentacar", reatacarModel);
	}
	@Override
	public int modifyRentacar(RentacarModel rentacarModel) {
		return sqlSessionTemplate.update("rentacar.modifyRentacar", rentacarModel);
	}
	@Override
	public int deleteRentacar(String car_no) {
		return sqlSessionTemplate.update("rentacar.deleteRentacar", car_no); 
	}

	@Override
	public List<ReserveModel> reserveAdminList() {
		return sqlSessionTemplate.selectList("reserve.reserveAdminList");
	}

	@Override
	public ReserveModel reserveAdminModify(int reserve_no) {
		return sqlSessionTemplate.selectOne("reserve.reserveAdminOne", reserve_no);
	}

	@Override
	public RentacarModel rentacarAdminOne(String car_no) {
		return sqlSessionTemplate.selectOne("rentacar.rentacarSearchOne", car_no);
	}

	@Override
	public int reserveDelete(int reserve_no) {
		return sqlSessionTemplate.update("reserve.reserveAdminDelete", reserve_no);
	}

	// 회원목록 출력
	@Override
	public List<MemberModel> memberList() {
		return sqlSessionTemplate.selectList("member.memberList");
	}

	public List<MemberModel> withdrawList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.withdrawList");
	}

	// 회원 삭제
	public int deleteMem(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("member.deleteMember", email);

	}

	public int updateRestoreMem(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("member.updateRestoreMem", email);

	}

	// 회원수정
	@Override
	public Object adminUpdateMem(MemberModel mem) {
		return sqlSessionTemplate.update("member.adminUpdateMem", mem);
	}

	@Override
	public Object adminUpdate(MemberModel mem) {
		return sqlSessionTemplate.update("member.adminUpdate", mem);
	}

	// 회원이름으로 검색
	@Override
	public List<MemberModel> memberSearch1(String search) {
		return sqlSessionTemplate.selectList("member.memberSearch1", "%" + search + "%");
	}

	@Override
	public List<MemberModel> memberSearch2(String search) {
		return sqlSessionTemplate.selectList("member.memberSearch2", "%" + search + "%");
	}

	/* 1110수정 */
	@Override
	public List<MemberModel> withdrawSearch1(String search) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.withdrawSearch1", "%" + search + "%");
	}

	@Override
	public List<MemberModel> withdrawSearch2(String search) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.withdrawSearch2", "%" + search + "%");
	}

	@Override
	public List<MemberModel> totalList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.totalList");
	}

	public List<MemberModel> memberSort0() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.memberSort0");
	}

	public List<MemberModel> memberSort1() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.memberSort1");
	}

	public List<MemberModel> memberSort0(int searchNum, String search) {
		// TODO Auto-generated method stub
		if (searchNum == 1)
			return sqlSessionTemplate.selectList("member.memberSearch3", "%" + search + "%");
		else
			return sqlSessionTemplate.selectList("member.memberSearch4", "%" + search + "%");
	}

	public List<MemberModel> memberSort1(int searchNum, String search) {
		// TODO Auto-generated method stub
		if (searchNum == 1)
			return sqlSessionTemplate.selectList("member.memberSearch5", "%" + search + "%");
		else
			return sqlSessionTemplate.selectList("member.memberSearch6", "%" + search + "%");
	}

}
