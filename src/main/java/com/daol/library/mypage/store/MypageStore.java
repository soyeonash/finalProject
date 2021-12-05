package com.daol.library.mypage.store;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.WishBook;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;

public interface MypageStore {
		//회원정보 관리
		public Member selectOneInfo(Member member);
		public Member selectOneInfo(String userId);
		public int updatePayment(Member member); //연회비결제
		public int updateMember(Member member);
		public int deleteMember(Member member);
		public int checkPwdDup(Member member);
		
		//도서
		/** 대출 도서 전체 권수 */
		public int selectListCount(String userId);
		/** 대출 내역 */
		public List<Book> selectAllLendingHistory(PageInfo pi, String userId);
		/** 대출 연장 */
		public int updateExtend(int lendingNo);
		/** 서평 조회 */
		public List<Review> selectOneReview(Review review);
		/** 도서 상세 조회 페이지 서평 조회 */
		public List<Review> selectOneForDetail(int bookNo);
		/** 서평 등록 */
		public int insertReview(Review review);
		/** 서평 수정 */
		public int updateReview(Review review);
		/** 서평 삭제 */
		public int deleteReview(Review review);
		/** 희망 도서 내역 */
		public List<WishBook> selectWishBook(PageInfo pi, String userId);
		public int selectWishListCount(String userId);
		/** 희망 도서 신청 */ 
		public int insertWishBook(WishBook wishBook);
		/** 관심 도서 전체갯수 */
		public int selectLikeListCount(String userId);
		/** 관심 도서 내역 */
		public List<Book> selectLikeList(PageInfo pi, String userId);
		
		
		
		//시설 이용
		/** 열람실 내역 */
		public int selectrListCount(String userId);
		public List<ReadingRoom> selectAllrList(String userId);
		/** 스터디룸 내역  */
		public int selectsListCount(String userId);
		public List<StudyRoom> selectAllsList(String userId);
		/** 예약 취소 */
		public int deleteReadingRoom(int rReservationNo);
		public int deleteStudyRoom(int sReservationNo);

		
		
		//문의
		public List<Qna> selectAllQna(String userId);
		public Qna selectOneQna(int qnaNo);
		public int insertQna(Qna qna);
		public int updateQna(Qna qna);
		public int deleteQna(int qnaNo);

		

		

		

		

}
