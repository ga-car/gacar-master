package com.Project.member;

import java.util.List;

import com.Project.member.MemberModel;

public interface MemberDao {
	
	public Object insertMember(MemberModel mem);
	public MemberModel getMember(String email);

}
