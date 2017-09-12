package com.care.WebPage.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import com.care.WebPage.DTO.Board;
import com.care.WebPage.DTO.Login;
import com.care.WebPage.DTO.Member;
import com.care.WebPage.DTO.Zipcode;
import com.care.WebPage.IDao.BoardDao;
import com.care.WebPage.IDao.MemberDao;
import com.care.WebPage.IService.BoardService;
import com.care.WebPage.IService.MemberService;
import com.care.WebPage.common.BoardTools;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;
	
	private final int BLOCKSIZE = 2;
	private final String NAVIURL="/WebPage/board/selectBoard?curPage=";

	@Override
	public List<Board> selectBoard(String curPage, 
			String searchOpt, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		int pageNum=0;
		if(curPage!=null)
			pageNum = Integer.parseInt(curPage)-1;
		map.put("start", pageNum * BLOCKSIZE);
		map.put("end", (pageNum+1) * BLOCKSIZE);
		map.put("searchOpt", searchOpt);
		map.put("searchWord", searchWord);
		
		return boardDao.selectBoard(map);
	}

	@Override
	public Board detailRead(String no) {
		return boardDao.detailRead(Integer.parseInt(no));
	}

	@Override
	public String getNavi(String curPage) {
		int pageNum = 1;
		if(curPage!=null)
			pageNum = Integer.parseInt(curPage);
		
		return BoardTools.getNavi(pageNum, BLOCKSIZE, boardDao.selectBoardTotalCnt(), NAVIURL);
	}
}




