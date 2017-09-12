package com.care.WebPage.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:home";
	}
	@RequestMapping(value = "/{formPath}")
	public String indexForm(
			@PathVariable("formPath") String formPath,
			Model model) {
		model.addAttribute("formPath", formPath);
		return "index";
	}
	
	@RequestMapping(value = "/form/{formPath}")
	public String moveForm(
			@PathVariable("formPath") String formPath) {
		return "/form/"+formPath;
	}

	@RequestMapping(value = "/footer")
	public String footer() {return "common/footer";}
	@RequestMapping(value = "/top")
	public String top() {return "common/top";}
}


