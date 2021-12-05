package com.daol.library.book.store;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.domain.PageInfo;
import com.daol.library.book.domain.Search;

public interface BookStore {
	public List<Book> selectAll(PageInfo pi);
	public Book selectOne(int bookNo);
	public int updateLendingBook(int bookNo);
	public List<Book> selectSearchSimple(PageInfo pi, Search search);
	public List<Book> selectSearchDetail(PageInfo pi, Search search);
	public List<Book> selectSearchSub(PageInfo pi, Search search);
	public List<Book> selectBestBook();
	public List<Book> selectNewList();
//	페이징 처리
	public int selectListCount1(Search search);
	public int selectListCount2(Search search);
	public int selectListCount3(Search search);
	
	public void insertKeyword(Search search);
	public List<Keyword> selectPopKeyword();
}
