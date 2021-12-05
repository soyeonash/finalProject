package com.daol.library.interestingBook.store;

import java.util.List;

import com.daol.library.interestingBook.domain.InterestingBook;

public interface InterestingBookStore {
	public List<InterestingBook> selectAllIntBook(String userId);
	public List<InterestingBook> selectAddCheck(InterestingBook intBook);
	public int insertInteresting(InterestingBook intBook);
	public int deleteInteresting(InterestingBook intBook);
}
