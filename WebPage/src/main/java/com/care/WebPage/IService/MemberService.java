package com.care.WebPage.IService;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.support.SessionStatus;

import com.care.WebPage.DTO.Login;
import com.care.WebPage.DTO.Member;
import com.care.WebPage.DTO.Zipcode;

public interface MemberService {
	public String isExistId(Member member, Map<String, Object> sInfo);
	public String reqAuthNum(Member member, Map<String, Object> sInfo);
	public String authNumConfirm(
			Map<String, Object> sInfo, String reqAuthNum);
	public List<Zipcode> searchZipcode(String addr);
	public boolean memberProc(Member member, Map<String, Object> sInfo);
	public String findInfoProc(String id,String email);
	public boolean loginProc(Login login);
}






