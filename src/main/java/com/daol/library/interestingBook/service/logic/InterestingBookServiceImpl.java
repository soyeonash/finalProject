package com.daol.library.interestingBook.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.interestingBook.domain.InterestingBook;
import com.daol.library.interestingBook.service.InterestingBookService;
import com.daol.library.interestingBook.store.InterestingBookStore;

@Service
public class InterestingBookServiceImpl implements InterestingBookService {
	@Autowired
	private InterestingBookStore store;

	@Override
	public List<InterestingBook> printAllIntBook(String userId) {
		List<InterestingBook> iList = store.selectAllIntBook(userId);
		return iList;
	}

	@Override
	public int registerInteresting(InterestingBook intBook) {
		int result = store.insertInteresting(intBook);
		return result;
	}

	@Override
	public int removeInteresting(InterestingBook intBook) {
		int result = store.deleteInteresting(intBook);
		return result;
	}

	@Override
	public List<InterestingBook> printAddCheck(InterestingBook intBook) {
		List<InterestingBook> iList = store.selectAddCheck(intBook);
		return iList;
	}

}
