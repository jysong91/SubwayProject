package com.care.WebPage.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.WebPage.IService.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private BoardService boardSrv;	
	
	@RequestMapping("selectBoard")
	public String selectBoard(Model model, 
			@RequestParam(value="curPage", required=false) String curPage) {
		model.addAttribute("boardLst", 
				boardSrv.selectBoard(curPage, null, null));
		model.addAttribute("navi", boardSrv.getNavi(curPage));
		return "forward:/boardForm";
	}
	@RequestMapping("detailRead")
	public String detailRead(Model model, 
			@RequestParam("writeNo") String no) {
		model.addAttribute("boardInfo", boardSrv.detailRead(no));
		return "forward:/viewForm";
	}
}





