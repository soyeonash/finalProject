package com.daol.library.book.service;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.domain.PageInfo;
import com.daol.library.book.domain.Search;

public interface BookService {
	public List<Book> printAll(PageInfo pi);
	public Book printOne(int bookNo);
	public int modifyLendingBook(int bookNo) throws Exception;
	public List<Book> printSearchSimple(PageInfo pi, Search search);
	public List<Book> printSearchDetail(PageInfo pi, Search search);
	public List<Book> printSearchSub(PageInfo pi, Search search);
	public List<Book> printBestBook();
	public List<Book> printNewBook();
//	페이징 처리
	public int getListCount1(Search search);
	public int getListCount2(Search search);
	public int getListCount3(Search search);
	
	//인기키워드 적립용
	public void regiKeyword(Search search);
	//인기키워드 출력
	public List<Keyword> printPopKeyword();
	
}
