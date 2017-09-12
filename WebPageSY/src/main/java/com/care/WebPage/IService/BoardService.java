package com.care.WebPage.IService;

import java.util.List;
import com.care.WebPage.DTO.Board;

public interface BoardService {
	public List<Board> selectBoard(int start, int end, String searchOpt, String searchWord);
	public Board detailRead(String no);
}
