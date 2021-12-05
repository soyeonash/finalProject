package com.daol.library.interestingBook.service;

import java.util.List;

import com.daol.library.interestingBook.domain.InterestingBook;

public interface InterestingBookService {
	public List<InterestingBook> printAllIntBook(String userId);
	public List<InterestingBook> printAddCheck(InterestingBook intBook);
	public int registerInteresting(InterestingBook intBook);
	public int removeInteresting(InterestingBook intBook);
}
