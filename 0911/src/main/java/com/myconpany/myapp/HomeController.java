package com.myconpany.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
/*
 * 1. JSP페이지에서 이동할 URI지정
 * 
 * 2. 컨트롤러에서 받을 requestmapping 제작
 * 
 * 3. 이동할 view 페이지 제작
 * 
 */

// @Controller 로 컨트롤러가 설정되어있는 부분을 확인
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * URL : http://localhost:8081/myapp/WEB-INF/views/home.jsp
	 * 프로토콜 : http
	 * 도메인 주소 : localhost
	 * 사용 포트 : 8081
	 * 사용 서비스 : myapp
	 * URI : /WEB-INF/views/home.jsp
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info : 로그 남기기(콘솔에 위치와 함께 메세지 출력 가능)
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
//		logger를 통해서 날짜가 보낼때 한글이 깨지는지, 받을때 깨지는지 파악할 수 있다.
		logger.info(formattedDate);
//		model은 세션처럼 값을 전달할 수 있음
		model.addAttribute("serverTime", formattedDate );
//		접속할 페이지의 이름(확장자 제외)
		return "home";
	}
	@RequestMapping(value = "/move")
	public String move() {
//		접속할 페이지의 이름(확장자 제외)
		return "move";
	}
	@RequestMapping(value = "/loginProc")
	public String login() {
		return "loginForm";
	}

}
