package com.care.WebPage.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.WebPage.DTO.Board;
import com.care.WebPage.IDAO.BoardDao;
import com.care.WebPage.IService.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> selectBoard(int start, int end, String searchOpt, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchOpt", searchOpt);
		map.put("searchWord", searchWord);
		return boardDao.selectBoard(map);
	}

	@Override
	public Board detailRead(String no) {
		return boardDao.detailRead(Integer.parseInt(no));
	}
	
}
