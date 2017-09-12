package com.care.WebPage.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		model.addAttribute("formPath", "form/home.jsp");
		return "index";
	}
	@RequestMapping(value = "/top")
	public String top() {
		return "common/top";
	}
	@RequestMapping(value = "/footer")
	public String footer() {
		return "common/footer";
	}
	@RequestMapping(value = "/form/{formPath}")
	public String form(
			@PathVariable("formPath") String formPath,
			Model model
			) {
		model.addAttribute("formPath", "form/"+formPath+".jsp");
		return "index";
		}
}
