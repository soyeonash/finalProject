package com.daol.library.admin.service.logic;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.admin.domain.BookParcel;
import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.domain.Statistics;
import com.daol.library.admin.domain.Status;
import com.daol.library.admin.service.AdminService;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.WishBook;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminStore store;

	// 회원관리 전체 조회
	@Override
	public List<Member> printAllMember(PageInfo pi) {
		List<Member> uList = store.selectAllMember(pi);
		return uList;
	}

	// 대기 회원관리 전체 조회
	@Override
	public List<Member> printWaitMember(PageInfo pi) {
		List<Member> uList = store.selectWaitMember(pi);
		return uList;
	}

	// 회원 카운트
	@Override
	public int getUserListCount() {
		int totalCount = store.selectUserListCount();
		return totalCount;
	}

	// 이용 승인 대기 유저 카운트
	@Override
	public int getWaitUserListCount() {
		int totalCount = store.selectWaitUserListCount();
		return totalCount;
	}

	// 회원 검색
	@Override
	public List<Member> printSearchAllUser(Search search, PageInfo pi) {
		List<Member> searchList = store.selectSearchUser(search, pi);
		return searchList;
	}

	// 회원 검색 카운트
	@Override
	public int getSearchUserListCount(Search search) {
		int totalCount = store.selectSearchUserCount(search);
		return totalCount;
	}

	// 선택한 회원 삭제
	@Override
	public int deleteUser(int[] nums) {
		int result = store.deleteUser(nums);
		return result;
	}

	// 회원 상세보기
	@Override
	public Member printUser(int userNo) {
		Member member = store.printUser(userNo);
		return member;
	}

	// 이용증 발급
	@Override
	public int userPassIssued(Member member) {
		int result = store.userPassIssued(member);
		return result;
	}

	// 이용 기간 설정
	@Override
	public int userEndDateUpdate(Member member) {
		int result = store.userEndDateUpdate(member);
		return result;
	}

	// 이용증 발급 회원 이메일
	@Override
	public Member getUserEmail(Member member) {
		Member userEmail = store.getUserEmail(member);
		return userEmail;
	}

	// 이용 승인 정렬
	@Override
	public List<Member> waitingSort(Member member) {
		List<Member> result = store.waitingSort(member);
		return result;
	}

	// 대출 이력 조회
	@Override
	public List<LendingBook> printAllLendingBook(PageInfo pi, String userId) {
		List<LendingBook> lList = store.selectAllLendingBook(pi, userId);
		return lList;
	}

	// 대출 카운트
	@Override
	public int getLendingBookListCount(String userId) {
		int totalCount = store.selectLendingBookListCount(userId);
		return totalCount;
	}

	@Override
	// 장서 카운트
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	// 장서 리스트
	@Override
	public List<Book> printAll(PageInfo pi) {
		List<Book> bList = store.selectAll(pi);
		return bList;
	}

	// 장서 서치
	@Override
	public List<Book> printSearchAll(Search search) {
		List<Book> searchList = store.selectSearchAll(search);
		return searchList;
	}

	// 유저타입 끌어오기용
	@Override
	public Member memberCk(String login) {
		return store.selectMemberCk(login);
	}

	// 관리자-문의리스트 끌어오기
	@Override
	public List<Qna> printAllQna(PageInfo pi) {
		return store.selectAllQna(pi);
	}

	// 페이지네이션용
	@Override
	public int getQnaListCount() {
		return store.selectQnaListCount();
	}

	// 장서 추가
	@Override
	public int enrollBook(Book book) {
		int result = store.insertAll(book);
		return result;
	}

	// 장서 삭제
	@Override
	public int bookDelete(int[] nums) {
		int result = store.deleteAll(nums);
		return result;
	}

	// 관리자게시판 문의검색
	@Override
	public List<Qna> printSearchAll(Search search, PageInfo pi) {
		return store.selectSearchAll(search, pi);
	}

	// 검색페이지네이션용
	@Override
	public int getSearchQnaListCount(Search search) {
		return store.selectSearchQnaListCount(search);
	}

	// 문의상세
	@Override
	public Qna printOneQna(int qnaNo) {
		return store.selectOneQna(qnaNo);
	}

	// 답변등록
	@Override
	public int modifyAnswer(Qna qna) {
		return store.updateAnswer(qna);
	}

	// 희망도서 리스트
	@Override
	public List<WishBook> wishAll(PageInfo pi) {
		List<WishBook> bList = store.selectAllWish(pi);
		return bList;
	}

	// 희망도서 페이징
	@Override
	public int getWishListCount() {
		int totalCount = store.selectWishListCount();
		return totalCount;
	}

	// status카운트
	@Override
	public int getStatusListCount() {
		int totalCount = store.selectStatusListCount();
		return totalCount;
	}

	// status 리스트
	@Override
	public List<Status> statusAll(PageInfo pi) {
		List<Status> bList = store.selectAllStatus(pi);
		return bList;
	}

	// 신고게시물
	@Override
	public List<Post> printAllReportPost(PageInfo pi) {
		return store.selectAllReportPost(pi);
	}

	// 신고게시물 카운트
	@Override
	public int getPostReportCount() {
		return store.selectPostReportCount();
	}

	// 신고된 댓글 카운트
	@Override
	public int getReplyReportCount() {
		return store.selectReplyReportCount();
	}

	// 신고된 댓글 리스트
	@Override
	public List<Reply> printAllReportReply(PageInfo rpi) {
		return store.selectAllReportReply(rpi);
	}

	// 반납 후 상태변경
	@Override
	public void bookState(int bookNo) {
		store.updateBookState(bookNo);

	}

	// 반납 후 권수변경
	@Override
	public void lendingCopy(String userId) {
		store.updateLending(userId);

	}

	// 반납일변경
	@Override
	public int dateUpdate(int lendingNo) {
		int result = store.updateDate(lendingNo);
		return result;
	}

	// 희망도서수정
	@Override
	public void updateWishBook(int applyNo) {
		store.wishBookUpdate(applyNo);
	}

	// 택배리스트 카운트
	@Override
	public int getParcelListCount() {
		int totalCount = store.selectParcelListCount();
		return totalCount;
	}

	// 택배리스트
	@Override
	public List<BookParcel> parcelAll(PageInfo pi) {
		List<BookParcel> bList = store.selectAllParacel(pi);
		return bList;
	}

	// 택배 완료처리
	@Override
	public int parcelUpdate(String deliveryNo) {
		int result = store.updateParcel(deliveryNo);
		return result;
	}

	// 택배 완료
	@Override
	public Book bookinfoUpdate(String bookNo) {
		Book books = store.selectBookInfo(bookNo);
		return books;
	}

	// 대출 통계
	@Override
	public List<Statistics> statisAll() {
		List<Statistics> sList = store.selectAllstatis();
		return sList;
	}

	@Override
	public String selectEmail(String usersId) {
		String userEmail = store.selectUserE(usersId);
		return userEmail;
	}

	@Override
	public void mailSend(String userEmail) {
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		// 이메일 객체생성하기
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "daolLibrary1@gmail.com");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.put("mail.smtp.socketFactory.fallback", "false");
		final String username = "daolLibrary1@gmail.com";//
		final String password = "daol1234";

		try {
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			// 메세지 설정
			Message msg = new MimeMessage(session);

			// 보내는사람 받는사람 설정
			msg.setFrom(new InternetAddress("seokin6961@gmail.com"));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail, false));
			msg.setSubject("규장각 희망장서 신청안내");
			msg.setText("희망하신 장서가 등록처리 되었습니다!");
			msg.setSentDate(new Date());
			Transport.send(msg);
			System.out.println("발신성공!");

		} catch (MessagingException error) {
			System.out.println("에러가 발생했습니다: " + error);
		}
	}

	@Override
	public int enrollBooks(Book book) {
		int result = store.insertbooks(book);
		return result;
	}

		

}
