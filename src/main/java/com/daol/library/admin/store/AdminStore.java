package com.daol.library.admin.store;

import java.util.List;

import com.daol.library.admin.domain.BookParcel;
import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.domain.Statistics;
import com.daol.library.admin.domain.Status;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.WishBook;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;

public interface AdminStore {
	// 회원관리 전체 조회
	public List<Member> selectAllMember(PageInfo pi);
	// 회원 카운트
	public int selectUserListCount();
	// 회원 검색
	public List<Member> selectSearchUser(Search search, PageInfo pi);
	// 회원 검색 페이징
	public int selectSearchUserCount(Search search);
	// 선택한 회원 삭제
	public int deleteUser(int[] nums);
	// 회원 상세 보기
	public Member printUser(int userNo);
	// 이용증 발급
	public int userPassIssued(Member member);
	// 이용 기간 설정
	public int userEndDateUpdate(Member member);
	// 이용증 발급 회원 이메일
	public Member getUserEmail(Member member);
	// 이용 승인 정렬
	public List<Member> waitingSort(Member member);
	// 이용 승인 대기 유저 카운트 
	public int selectWaitUserListCount();
	// 이용 승인 회원 목록
	public List<Member> selectWaitMember(PageInfo pi);
	// 대출이력 조회
	public List<LendingBook> selectAllLendingBook(PageInfo pi, String userId);
	// 대출 카운트
	public int selectLendingBookListCount(String userId);
	
	
	// 장서 카운트
	public int selectListCount();
	// 장서 리스트
	public List<Book> selectAll(PageInfo pi);
	//유저타입 끌어오기
	public Member selectMemberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> selectAllQna(PageInfo pi);
	//페이징처리용
	public int selectQnaListCount();
	// 장서 서치
	public List<Book> selectSearchAll(Search search);
	// 책 등록
	public int insertAll(Book book);
	// 책 다중삭제
	public int deleteAll(int[] nums);
	//검색
	public List<Qna> selectSearchAll(Search search,PageInfo pi);
	//검색 페이징 처리
	public int selectSearchQnaListCount(Search search);
	//문의상세
	public Qna selectOneQna(int qnaNo);
	//문의등록
	public int updateAnswer(Qna qna);
	//희망도서 리스트
	public List<WishBook> selectAllWish(PageInfo pi);

	// 희망도서 페이징
	public int selectWishListCount();
	// 대출 카운트
	public int selectStatusListCount();
	// 대출 리스트
	public List<Status> selectAllStatus(PageInfo pi);

	
	//신고된 게시물 리스트
	public List<Post> selectAllReportPost(PageInfo pi);
	//신고된게시물카운트
	public int selectPostReportCount();
	//신고된 댓글 카운트
	public int selectReplyReportCount();
	//신고된 댓글 리스트
	public List<Reply> selectAllReportReply(PageInfo rpi);

	// 상태 변경
	public void updateBookState(int bookNo);
	// 권수 변경
	public void updateLending(String userId);
	// 반납일 변경
	public int updateDate(int lendingNo);
	// 희망 도서
	public void wishBookUpdate(int applyNo);
	// 택배 리스트 카운트
	public int selectParcelListCount();
	// 택배 리스트
	public List<BookParcel> selectAllParacel(PageInfo pi);
	// 택배 완료처리
	public int updateParcel(String deliveryNo);
	// 택배 완료
	public Book selectBookInfo(String bookNo);
	// 대출 통계
	public List<Statistics> selectAllstatis();
	// 회원 이메일 조회
	public String selectUserE(String usersId);
	// 책 등록
	public int insertbooks(Book book);
}
