package com.daol.library.book.common;

import com.daol.library.book.domain.PageInfo;

public class Pagenation {
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int naviLimit = 10;
		int boardLimit = 10;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit + 0.9)) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, naviLimit, boardLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
}
