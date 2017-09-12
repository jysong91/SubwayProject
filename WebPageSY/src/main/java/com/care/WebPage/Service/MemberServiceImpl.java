package com.care.WebPage.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.WebPage.DTO.Member;
import com.care.WebPage.IDAO.MemberDao;
import com.care.WebPage.IService.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int idChkProc2(Member member) {
		return memberDao.idChkProc(member.getId());
	}

	@Override
	public String authProc() {
		String authNum = String.format("%04d", (int)(Math.random()*10000)); 
//		인증번호 이메일 전송..
		return authNum;
	}

}
