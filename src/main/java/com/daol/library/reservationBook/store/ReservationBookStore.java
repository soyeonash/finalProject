package com.daol.library.reservationBook.store;

import java.util.List;

import com.daol.library.book.domain.PageInfo;
import com.daol.library.member.domain.Member;
import com.daol.library.reservationBook.domain.ReservationBook;

public interface ReservationBookStore {
	public List<ReservationBook> selectAllRsvBook(PageInfo pi, String userId);
	public List<ReservationBook> selectAddCheck(ReservationBook reservationBook);
	public List<ReservationBook> selectRsvList(int bookNo);
	public ReservationBook selectRsvBookInfo(int bookNo);
	public List<Member> selectUserEmail(int bookNo);
	public int selectRsvCount(int bookNo);
	public int insertRsv(ReservationBook reservationBook);
	public int deleteRsv(ReservationBook reservationBook);
	public int deleteRsvList(int[] nums);
	public int updateRsv(int bookNo);
//	페이징 처리
	public int selectListCount(String userId);
}
