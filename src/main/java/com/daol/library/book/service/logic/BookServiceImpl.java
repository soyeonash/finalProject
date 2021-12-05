package com.daol.library.book.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.domain.PageInfo;
import com.daol.library.book.domain.Search;
import com.daol.library.book.service.BookService;
import com.daol.library.book.store.BookStore;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookStore store;

	@Override
	public List<Book> printAll(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book printOne(int bookNo) {
		Book book = store.selectOne(bookNo);
		return book;
	}
	
	@Override
	public List<Book> printSearchSimple(PageInfo pi, Search search) {
		List<Book> bList = store.selectSearchSimple(pi, search);
		return bList;
	}

	@Override
	public List<Book> printSearchDetail(PageInfo pi, Search search) {
		List<Book> bList = store.selectSearchDetail(pi, search);
		return bList;
	}

	@Override
	public List<Book> printSearchSub(PageInfo pi, Search search) {
		List<Book> bList = store.selectSearchSub(pi, search);
		return bList;
	}

	@Override
	public int modifyLendingBook(int bookNo) throws Exception {
		int result = store.updateLendingBook(bookNo);
		if(result == 0) throw new Exception();
		return result;
	}
	
	//메인페이지 신간도서 출력
	@Override
	public List<Book> printNewBook() {
		List<Book> bList = store.selectNewList();
		return bList;
	}

	@Override
	public List<Book> printBestBook() {
		List<Book> bList = store.selectBestBook();
		return bList;
	}
	
	//인기키워드 적립용
	@Override
	public void regiKeyword(Search search) {
		String keyword = search.getSearchCondition();
		String value = search.getSearchValue();
		if(keyword.equals("title") && value!="") {
			store.insertKeyword(search);
		}
	}
	
	//인기키워드 출력
	@Override
	public List<Keyword> printPopKeyword() {
		return store.selectPopKeyword();
	}

//	페이징 처리
	@Override
	public int getListCount1(Search search) {
		int totalCount = store.selectListCount1(search);
		return totalCount;
	}

	@Override
	public int getListCount2(Search search) {
		int totalCount = store.selectListCount2(search);
		return totalCount;
	}

	@Override
	public int getListCount3(Search search) {
		int totalCount = store.selectListCount3(search);
		return totalCount;
	}

}
