package com.daol.library.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.WishBook;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;

public interface MypageService {

	//회원정보 관리
	public Member printOneInfo(Member member);
	
	public Member printOneInfo(String userId); 
		
	public int modifyMember(Member member);
	
	public int removeMember(Member member);
	
	public int checkPwdDup(Member member);
	
	public int updatePayment(Member member); //연회비 결제 후 상태 업데이트
	
	//도서
	/** 대출 도서 전체 권수 */
	public int getListCount(String userId);
	/** 대출 내역 */
	public List<Book> printAllLendingHistory(PageInfo pi, String userId);
	/** 대출 연장 */	
	public int extendLending(int lendingNo);
	/** 마이페이지 서평 조회 */
	public List<Review> printOneReview(Review review);
	/** 도서 상세 조회 페이지 서평 조회 */
	public List<Review> printOneForDetail(int bookNo);
	/** 서평 등록 */
	public int registerReview(Review review);
	/** 서평 수정 */
	public int modifyReview(Review review);
	/** 서평 삭제 */
	public int removeReview(Review review);


	/** 희망 도서 내역 */
	public List<WishBook> printWishBook(PageInfo pi, String userId);
	public int getWishListCount(String userId);
	/** 희망 도서 신청 */
	public int registerWishBook(WishBook wishbook);
	
	/** 관심 도서 내역 */
	public List<Book> printLikeList(PageInfo pi, String userId);
	public int getlikeListCount(String userId);
	
	
	
	//시설 이용
	/** 열람실 내역 */
	public int getrListCount(String userId);
	public List<ReadingRoom> printAllrList(String userId);
	/** 스터디룸 내역 전체 갯수 */
	public int getsListCount(String userId);
	public List<StudyRoom> printAllsList(String userId);
	/** 예약 취소 */
	public int cancelReadingRoom(int rReservationNo);
	public int cancelStudyRoom(int sReservationNo);

	
	
	//문의
	public List<Qna> printAllQna(String userId);
	public Qna printOneQna(int qnaNo);
	public int registQna(Qna qna);
	public int modifyQna(Qna qna);
	public int removeQna(int qnaNo);

	

	

	

	

	

	
}
