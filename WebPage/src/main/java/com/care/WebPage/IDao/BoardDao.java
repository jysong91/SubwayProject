package com.care.WebPage.IDao;

import java.util.List;
import java.util.Map;

import com.care.WebPage.DTO.Board;

public interface BoardDao {
	public List<Board> selectBoard(Map<String, Object> map);
	public Board detailRead(int no);
	public int selectBoardTotalCnt();
}
