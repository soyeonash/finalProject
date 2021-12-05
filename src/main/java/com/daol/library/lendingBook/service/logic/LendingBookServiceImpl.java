package com.daol.library.lendingBook.service.logic;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.domain.Parcel;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.lendingBook.store.LendingBookStore;

@Service
public class LendingBookServiceImpl implements LendingBookService {
	@Autowired
	private LendingBookStore store;

	@Override
	public List<LendingBook> printAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LendingBook printOne(int lendingNo) {
		LendingBook lendingBook = store.selectOne(lendingNo);
		return lendingBook;
	}

	@Override
	public LendingBook printOneForDetail(int lendingNo) {
		LendingBook lendingBook = store.selectOneForDetail(lendingNo);
		return lendingBook;
	}
	
	@Override
	public int registerLending(LendingBook lendingBook) throws Exception {
		int result = store.insertLending(lendingBook);
		if(result == 0) throw new Exception();
		return result;
	}

	@Override
	public int removeLending(HashMap<String, String> deleteBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyLending(LendingBook lendingBook) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerParcel(Parcel parcel) throws Exception {
		int result = store.insertParcel(parcel);
		if(result == 0) throw new Exception();
		return result;
	}

	@Override
	public int registerLendingParcel(LendingBook lendingBook) throws Exception {
		int result = store.insertLending(lendingBook);
		if(result == 0) throw new Exception();
		return result;
	}
	//다독자리스트
	@Override
	public List<LendingBook> printManyPeople() {
		return store.selectManyPeople();
	}

}
