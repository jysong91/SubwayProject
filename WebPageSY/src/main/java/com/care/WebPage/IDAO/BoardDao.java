package com.care.WebPage.IDAO;

import java.util.List;
import java.util.Map;

import com.care.WebPage.DTO.Board;

public interface BoardDao {
//	���ڰ��� String, int �� ��������Ƿ� Map�� value���� object�� ���ش�
	public List<Board> selectBoard(Map<String, Object> map);
	public Board detailRead(int no);
}
