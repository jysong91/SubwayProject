package com.care.WebPage.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.WebPage.DTO.Member;
import com.care.WebPage.IService.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberSrv;
	
	@RequestMapping(value="/idChkProc2", method=RequestMethod.POST)
	public @ResponseBody int idChkProc2(Member member){
		return memberSrv.idChkProc2(member);
	}
	@RequestMapping(value="/authProc", method=RequestMethod.POST)
	public @ResponseBody String authProc(){
		return memberSrv.authProc();
	}
}
