package com.care.WebPage.IDao;

import java.util.List;
import java.util.Map;

import com.care.WebPage.DTO.Login;
import com.care.WebPage.DTO.Member;
import com.care.WebPage.DTO.Zipcode;

public interface MemberDao {
	public int isExistId(String id);
	public List<Zipcode> searchZipcode(String addr);
	public void insertMember(Member member);
	public void insertMemberPostCode(Member member);
	public String findInfoProc(Map<String, String> map);
	public int loginProc(Login login);
}
