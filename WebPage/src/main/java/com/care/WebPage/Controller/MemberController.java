package com.care.WebPage.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.HandlerMapping;

import com.care.WebPage.DTO.Login;
import com.care.WebPage.DTO.Member;
import com.care.WebPage.IService.MemberService;

@Controller
@RequestMapping("member")
@SessionAttributes("sessionInfo")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberSrv;
	@ModelAttribute("sessionInfo")
	public Map<String, Object> getSessionInfo(){
		Map<String, Object> map =
				new HashMap<String, Object>();
		map.put("authOK", false);
		return map;
	}
	
	@RequestMapping("isExistId")
	public String isExistId(Member member, 
			@ModelAttribute("sessionInfo") 
			Map<String, Object> sInfo,
			Model model) {
		model.addAttribute("msg", memberSrv.isExistId(member, sInfo));
		model.addAttribute("member", member);
		return "forward:/memberForm";
	}
	//member/reqAuthNum
	@RequestMapping("reqAuthNum")
	public String reqAuthNum(Member member, 
			Model model, 
			@ModelAttribute("sessionInfo") 
			Map<String, Object> sInfo) {
		 
		memberSrv.reqAuthNum(member, sInfo);
		model.addAttribute("msg", 
				"이메일을 확인하세요");
		model.addAttribute("member", member);
		return "forward:/memberForm";
	}
	@RequestMapping("authNumConfirm")
	public String authNumConfirm(Member member, 
			Model model, 
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo,
			@RequestParam("authNum") String reqAuthNum) {
		
		model.addAttribute("msg", 
				memberSrv.authNumConfirm(sInfo, reqAuthNum));
		model.addAttribute("member", member);
		return "forward:/memberForm";
	}
	@RequestMapping("searchPostCode")
	public String searchPostCode() {
		return "form/searchPostCode";
	}
	@RequestMapping("searchZipcode")
	public String searchZipcode(
			@RequestParam("addr") String addr,
			Model model) {
		model.addAttribute("zipcodeLst", 
				memberSrv.searchZipcode(addr));
		return "form/searchPostCode";
	}
	@RequestMapping("memberProc")
	public String memberProc(
			Member member,
			Model model,
			@ModelAttribute("sessionInfo") 
			Map<String, Object> sInfo) {
		if(memberSrv.memberProc(member, sInfo))
			return "redirect:/loginForm";
		
		model.addAttribute("member", member);
		return "forward:/memberForm";
	}
	@RequestMapping({"searchID", "searchPW"})
	public String searchID(Model model, 
			HttpServletRequest req) {
		String path=(String)req.getAttribute(
				HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		model.addAttribute("path", path);
		return "forward:/findInfoForm";
	}
	
	@RequestMapping("findInfoProc")
	public String findInfoProc(Model model,
			@RequestParam(value="id", required=false) String id,
			@RequestParam("email") String email) {
		model.addAttribute("msg", memberSrv.findInfoProc(id, email));
		return "forward:/loginForm";
	}
	@RequestMapping("loginProc")
	public String loginProc(Model model,
			Login login) {
		if(memberSrv.loginProc(login))
			return "redirect:/home";
		model.addAttribute("msg", "누구냐 넌");
		return "forward:/loginForm";
	}
}





