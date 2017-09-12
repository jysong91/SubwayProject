package com.care.WebPage.IService;

import java.util.List;

import com.care.WebPage.DTO.Board;

public interface BoardService {
	public List<Board> selectBoard(
			String curPage, String searchOpt, String searchWord);
	public Board detailRead(String no);
	public String getNavi(String curPage);
}






