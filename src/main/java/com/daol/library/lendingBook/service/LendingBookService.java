package com.daol.library.lendingBook.service;

import java.util.HashMap;
import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.domain.Parcel;

public interface LendingBookService {
	public List<LendingBook> printAll();
	public LendingBook printOne(int lendingNo);
	public LendingBook printOneForDetail(int lendingNo);
	public int registerLending(LendingBook lendingBook) throws Exception;
	public int registerLendingParcel(LendingBook lendBook) throws Exception;
	public int removeLending(HashMap<String, String> deleteBook);
	public int modifyLending(LendingBook lendingBook);
	
	public int registerParcel(Parcel parcel) throws Exception;
	
	//다독자 리스트
	public List<LendingBook> printManyPeople();
}
