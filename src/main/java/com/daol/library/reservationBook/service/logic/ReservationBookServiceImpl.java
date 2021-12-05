package com.daol.library.reservationBook.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.PageInfo;
import com.daol.library.member.domain.Member;
import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.service.ReservationBookService;
import com.daol.library.reservationBook.store.ReservationBookStore;

@Service
public class ReservationBookServiceImpl implements ReservationBookService {
	@Autowired
	private ReservationBookStore store;

	@Override
	public List<ReservationBook> printAllRsvBook(PageInfo pi, String userId) {
		return store.selectAllRsvBook(pi, userId);
	}

	@Override
	public List<ReservationBook> printAddCheck(ReservationBook reservationBook) {
		return store.selectAddCheck(reservationBook);
	}
	
	@Override
	public List<ReservationBook> printRsvList(int bookNo) {
		return store.selectRsvList(bookNo);
	}
	
	@Override
	public ReservationBook printRsvBookInfo(int bookNo) {
		return store.selectRsvBookInfo(bookNo);
	}
	
	@Override
	public List<Member> printUserEmail(int bookNo) {
		return store.selectUserEmail(bookNo);
	}
	
	@Override
	public int printRsvCount(int bookNo) {
		return store.selectRsvCount(bookNo);
	}

	@Override
	public int registerRsv(ReservationBook reservationBook) {
		return store.insertRsv(reservationBook);
	}

	@Override
	public int removeRsv(ReservationBook reservationBook) {
		return store.deleteRsv(reservationBook);
	}
	
	@Override
	public int removeRsvList(int[] nums) {
		return store.deleteRsvList(nums);
	}

	@Override
	public int modifyRsv(int bookNo) {
		return store.updateRsv(bookNo);
	}

//	페이징 처리
	@Override
	public int getListCount(String userId) {
		return store.selectListCount(userId);
	}

}
