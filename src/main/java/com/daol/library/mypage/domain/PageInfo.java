package com.daol.library.mypage.domain;

public class PageInfo {
	//현재 페이지
	private int currentPage;
	
	//한 페이지 당 몇개의 게시물을 보여줄 것인가
	private int boardLimit;
	
	//한 페이지당 몇개의 네비게이션 수를 보여줄 것인가
	private int naviLimit;
	
	//네비게이션 첫번 쨰 값
	private int startNavi;
	
	//네비게이션의 마지막 값
	private int endNavi;
	
	//전체 게시물 갯수
	private int totalCount;
	
	//페이지 마지막 번호
	private int maxPage;

	public PageInfo(int currentPage, int boardLimit, int naviLimit, int startNavi, int endNavi, int totalCount,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		this.boardLimit = boardLimit;
		this.naviLimit = naviLimit;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.totalCount = totalCount;
		this.maxPage = maxPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getNaviLimit() {
		return naviLimit;
	}

	public void setNaviLimit(int naviLimit) {
		this.naviLimit = naviLimit;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "PageInfo [현재페이지=" + currentPage + ", 게시물 갯수=" + boardLimit + ", 네비 갯수=" + naviLimit
				+ ", 네비 시작=" + startNavi + ", 네비 끝=" + endNavi + ", 전체 갯수=" + totalCount + ", 최대 페이지="
				+ maxPage + "]";
	}
	
	
	
	
}
