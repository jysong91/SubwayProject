package com.care.WebPage.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import com.care.WebPage.DTO.Login;
import com.care.WebPage.DTO.Member;
import com.care.WebPage.DTO.Zipcode;
import com.care.WebPage.IDao.MemberDao;
import com.care.WebPage.IService.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	final String NOEXISTID = "��� ������ ���̵� �Դϴ�.";
	final String EXISTID = "�ߺ��� ���̵��Դϴ�.";
	final String AUTHCONFIRMOK = "���� ����";
	final String AUTHCONFIRMFAILD = "���� ����";
	@Override
	public String isExistId(Member member, 
			Map<String, Object> sInfo) {
		if(memberDao.isExistId(member.getId())==0){
			sInfo.put("checkedID", member.getId());
			return NOEXISTID;
		}
		return EXISTID;
	}
	@Override
	public String reqAuthNum(Member member, Map<String, Object> sInfo) {
		String authNum = String.format("%04d", 
				(int)(Math.random()*10000));
		sInfo.put("authNum", authNum);
		//������ȣ �̸��� ����
		//member.getEmail()
		return authNum;
	}
	@Override
	public String authNumConfirm(
			Map<String, Object> sInfo, String reqAuthNum) {
		String sAuthNum = (String)sInfo.get("authNum");
		if(reqAuthNum.equals(sAuthNum)){
			sInfo.remove("authNum");
			sInfo.put("authOK", true);
			return AUTHCONFIRMOK;
		}
		return AUTHCONFIRMFAILD;
	}
	@Override
	public List<Zipcode> searchZipcode(String addr) {
		return memberDao.searchZipcode(addr);
	}
	@Override
	public boolean memberProc(Member member, Map<String, Object> sInfo) {
		String sId = (String)sInfo.get("checkedID");
		
		if(member.getId().equals(sId) &&
				(Boolean)sInfo.get("authOK")){
			memberDao.insertMember(member);
			if(!"".equals(member.getZipcode()))
				memberDao.insertMemberPostCode(member);
			return true;
		}
		return false;
	}
	@Override
	public String findInfoProc(String id, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		String id2 = memberDao.findInfoProc(map);
		/*id�� �����Ѵٸ� �н����� �˻��� �� ����̹Ƿ�
		�̸��Ͽ� �ӽ� �н����� �����ϰ� ����� ���� 
		�н����� ����
		id�� �������� ������ ID ���� ����*/
		return "�̸����� Ȯ���ϼ���";
	}
	@Override
	public boolean loginProc(Login login) {
		if(memberDao.loginProc(login)==0)
			return false;
		return true;
	}
}




