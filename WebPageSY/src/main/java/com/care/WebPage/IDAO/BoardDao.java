package com.care.WebPage.IDAO;

import java.util.List;
import java.util.Map;

import com.care.WebPage.DTO.Board;

public interface BoardDao {
//	인자값에 String, int 가 모두있으므로 Map의 value값을 object로 해준다
	public List<Board> selectBoard(Map<String, Object> map);
	public Board detailRead(int no);
}
