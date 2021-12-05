package com.daol.library.admin.service;

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

public interface AdminService {
	// 회원관리 전체 조회
	public List<Member> printAllMember(PageInfo pi);
	// 회원 카운트
	public int getUserListCount();
	// 회원 검색
	public List<Member> printSearchAllUser(Search search, PageInfo pi);
	// 회원 검색 카운트
	public int getSearchUserListCount(Search search);
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
	public int getWaitUserListCount();
	// 이용 승인 회원 목록
	public List<Member> printWaitMember(PageInfo pi);
	// 대출 이력 조회
	List<LendingBook> printAllLendingBook(PageInfo pi, String userId);
	// 대출 이력 카운트
	public int getLendingBookListCount(String userId);
	
	// 장서 카운트
	public int getListCount();
	// 장서 리스트
	public List<Book> printAll(PageInfo pi);
	// 장서 서치
	public List<Book> printSearchAll(Search search);

	//관리자페이지 유저타입 끌어오기
	public Member memberCk(String login);
	//관리자페이지 문의리스트 출력
	public List<Qna> printAllQna(PageInfo pi);
	public int getQnaListCount();

	// 장서 등록
	public int enrollBook(Book book);
	// 장서 삭제
	public int bookDelete(int[] nums);
	//관리자게시판 문의검색
	public List<Qna> printSearchAll(Search search,PageInfo pi);
	//검색페이징용
	public int getSearchQnaListCount(Search search);
	//qna상세
	public Qna printOneQna(int qnaNo);
	//답변등록
	public int modifyAnswer(Qna qna);

	// wishbook 전체목록
	public List<WishBook> wishAll(PageInfo pi);

	// wishbook total수
	public int getWishListCount();
	// 처리 카운트
	public int getStatusListCount();
	// status리스트
	public List<Status> statusAll(PageInfo pi);


	//신고된 게시물 리스트 페이징용
	public int getPostReportCount();
	//신고된 게시물 리스트
	public List<Post> printAllReportPost(PageInfo pi);
	//신고된 댓글 리스트 페이징
	public int getReplyReportCount();
	//신고된 댓글 리스트
	public List<Reply> printAllReportReply(PageInfo rpi);

	
	// 반납 후 상태변경
	public void bookState(int bookNo);
	// 반납 후 권수변경
	public void lendingCopy(String userId);
	// 반납일변경
	public int dateUpdate(int lendingNo);
	// 희망도서 수정
	public void updateWishBook(int applyNo);
	// 택배 리스트 카운트
	public int getParcelListCount();
	// 택배 리스트 출력
	public List<BookParcel> parcelAll(PageInfo pi);
	// 완료처리
	public int parcelUpdate(String deliveryNo);
	// 완료
	public Book bookinfoUpdate(String bookNo);
	// 통계리스트
	public List<Statistics> statisAll();
	// 회원 이메일 조회
	public String selectEmail(String usersId);
	// 메일 보내기
	public void mailSend(String userEmail);
	// 도서 등록
	public int enrollBooks(Book book);
}
