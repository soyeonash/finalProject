package com.daol.library.common;

import com.daol.library.post.domain.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		
		int naviLimit = 5; //한 페이지에서 보일 네비 갯수
		int boardLimit = 10; //한 페이지에서 보여줄 게시물 갯수 
		int maxPage;		
		int startNavi;		//한 페이지에서 시작하는 페이지 번호
		int endNavi;		//한 페이지에서 끝나는 페이지 번호
		
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit + 0.9)) - 1) * naviLimit +1;
		endNavi = startNavi + naviLimit;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
}
