package com.care.WebPage.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.WebPage.IService.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardSrv;
	
	@RequestMapping("selectBoard")
	public String selectBoard(Model model) {
		model.addAttribute("boardLst", boardSrv.selectBoard(0, 5, null, null));
		return "forward:/boardForm";
	}

	@RequestMapping("detailRead")
	public String detailRead(Model model, String no) {
		model.addAttribute("boardInfo", boardSrv.detailRead(no));
		return "forward:/viewForm";
	}
	
}
