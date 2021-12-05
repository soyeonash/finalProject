package com.daol.library.reservationBook.service;

import java.util.List;

import com.daol.library.book.domain.PageInfo;
import com.daol.library.member.domain.Member;
import com.daol.library.reservationBook.domain.ReservationBook;

public interface ReservationBookService {
	public List<ReservationBook> printAllRsvBook(PageInfo pi, String userId);
	public List<ReservationBook> printAddCheck(ReservationBook reservationBook);
	public List<ReservationBook> printRsvList(int bookNo);
	public ReservationBook printRsvBookInfo(int bookNo);
	public List<Member> printUserEmail(int bookNo);
	public int printRsvCount(int bookNo);
	public int registerRsv(ReservationBook reservationBook);
	public int removeRsv(ReservationBook reservationBook);
	public int removeRsvList(int[] nums);
	public int modifyRsv(int bookNo);
//	페이징 처리
	public int getListCount(String userId);
}
