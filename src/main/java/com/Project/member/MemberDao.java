package com.Project.member;

import java.util.List;

import com.Project.member.MemberModel;
import com.Project.member.ZipcodeModel;

public interface MemberDao {

	public Object insertMember(MemberModel mem);

	public MemberModel getMember(String email);

	public List<ZipcodeModel> zipcodeCheck(ZipcodeModel zipcodeModel) throws Exception;

	public MemberModel login(MemberModel mem);

	public MemberModel emailFind(MemberModel mem);

	public MemberModel pwFind(MemberModel mem);

	public Object updateDelMem(String email);

	public Object updateMember(MemberModel mem);
	
	public Object updateAccess(String email);
}
