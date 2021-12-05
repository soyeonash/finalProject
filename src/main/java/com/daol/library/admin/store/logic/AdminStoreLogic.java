package com.daol.library.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.admin.domain.BookParcel;
import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.domain.Statistics;
import com.daol.library.admin.domain.Status;
import com.daol.library.admin.store.AdminStore;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.WishBook;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;

@Repository
public class AdminStoreLogic implements AdminStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원관리 전체 조회
	@Override
	public List<Member> selectAllMember(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Member> uList = sqlSession.selectList("adminMapper.selectAllUserList", pi, rowBounds);
		return uList;
	}

	// 대기 회원관리 전체 조회
	@Override
	public List<Member> selectWaitMember(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Member> uList = sqlSession.selectList("adminMapper.selectWaitMember", pi, rowBounds);
		return uList;
	}

	// 회원 카운트
	@Override
	public int selectUserListCount() {
		int count = sqlSession.selectOne("adminMapper.selectUserListCount");
		return count;
	}

	// 대기 회원 카운트
	@Override
	public int selectWaitUserListCount() {
		int count = sqlSession.selectOne("adminMapper.selectWaitUserListCount");
		return count;
	}

	// 회원 검색
	@Override
	public List<Member> selectSearchUser(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Member> searchList = sqlSession.selectList("adminMapper.selectSearchUser", search, rowBounds);
		return searchList;
	}

	// 회원 검색 카운트
	@Override
	public int selectSearchUserCount(Search search) {
		int count = sqlSession.selectOne("adminMapper.selectSearchUserCount", search);
		return count;
	}

	// 선택한 회원 삭제
	@Override
	public int deleteUser(int[] nums) {
		int result = sqlSession.delete("adminMapper.deleteSelectedUser", nums);
		return result;
	}

	// 회원 상세 보기
	@Override
	public Member printUser(int userNo) {
		Member member = sqlSession.selectOne("adminMapper.selectOneUser", userNo);
		return member;
	}

	// 이용증 발급
	@Override
	public int userPassIssued(Member member) {
		int result = sqlSession.update("adminMapper.userPassIssued", member);
		return result;
	}

	// 이용 기간 설정
	@Override
	public int userEndDateUpdate(Member member) {
		int result = sqlSession.update("adminMapper.userEndDateUpdate", member);
		return result;
	}

	// 이용 승인 정렬
	@Override
	public List<Member> waitingSort(Member member) {
		List<Member> result = sqlSession.selectList("adminMapper.waitingSort", member);
		return result;
	}

	// 이용증 발급 완료 이메일 전송
	@Override
	public Member getUserEmail(Member member) {
		Member userEmail = sqlSession.selectOne("adminMapper.getUserEmail", member);
		return userEmail;
	}

	// 대출 이력 조회
	@Override
	public List<LendingBook> selectAllLendingBook(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<LendingBook> lList = sqlSession.selectList("adminMapper.selectAllLendingBook", userId, rowBounds);
		return lList;
	}

	// 대출 카운트
	@Override
	public int selectLendingBookListCount(String userId) {
		int count = sqlSession.selectOne("adminMapper.selectLendingBookListCount", userId);
		return count;
	}

	// 유저타입 끌어오기용
	@Override
	public Member selectMemberCk(String login) {
		return sqlSession.selectOne("adminMapper.selectUser", login);
	}

	// 관리자-문의 리스트 끌어오기
	@Override
	public List<Qna> selectAllQna(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectAllQna", pi, rowBounds);
	}

	// qna 페이지네이션용
	@Override
	public int selectQnaListCount() {
		return sqlSession.selectOne("adminMapper.selectQnaListCount");
	}

	// 장서리스트 카운트
	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("adminMapper.selectListCount");
		return count;
	}

	// 장서 리스트
	@Override
	public List<Book> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Book> bList = sqlSession.selectList("adminMapper.selectBookList", pi, rowBounds);
		return bList;
	}

	// 장서 리스트 서치
	@Override
	public List<Book> selectSearchAll(Search search) {
		List<Book> searchList = sqlSession.selectList("adminMapper.selectSearchList", search);
		return searchList;
	}

	// 장서등록
	@Override
	public int insertAll(Book book) {
		int result = sqlSession.insert("adminMapper.insertBook", book);
		return result;
	}

	// 장서삭제
	@Override
	public int deleteAll(int[] nums) {
//		String params = "";
//		
//		for(int i =0; i<nums.length; i++) {
//			params += nums[i];
//			
//			if(i < nums.length-1)
//				params += ",";
//		}
		int result = sqlSession.delete("adminMapper.deleteBook", nums);
		return result;
	}

	// 관리자게시판 문의 검색
	@Override
	public List<Qna> selectSearchAll(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectSearchQna", search, rowBounds);
	}

	// 문의관리 검색페이징용
	@Override
	public int selectSearchQnaListCount(Search search) {
		return sqlSession.selectOne("adminMapper.getSearchCount", search);
	}

	// 문의관리 답변하러갑시다
	@Override
	public Qna selectOneQna(int qnaNo) {
		return sqlSession.selectOne("adminMapper.selectOneQna", qnaNo);
	}

	// 문의등록
	@Override
	public int updateAnswer(Qna qna) {
		return sqlSession.update("adminMapper.updateQna", qna);
	}

	// 희망 도서 목록
	@Override
	public List<WishBook> selectAllWish(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<WishBook> bList = sqlSession.selectList("adminMapper.wishBookList", pi, rowBounds);
		return bList;
	}

	// 희망도서 카운트
	@Override
	public int selectWishListCount() {
		int count = sqlSession.selectOne("adminMapper.selectWishListCount");
		return count;
	}

	// 희망도서 리스트
	@Override
	public int selectStatusListCount() {
		int count = sqlSession.selectOne("adminMapper.selectStatusListCount");
		return count;
	}

	// 대출리스트
	@Override
	public List<Status> selectAllStatus(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Status> bList = sqlSession.selectList("adminMapper.StatusBookList", pi, rowBounds);
		return bList;
	}

	// 신고게시물리스트
	@Override
	public List<Post> selectAllReportPost(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("postMapper.selectAllReportPost", rowBounds);
	}

	// 신고게시물카운트
	@Override
	public int selectPostReportCount() {
		return sqlSession.selectOne("postMapper.selectPostReportCount");
	}

	// 신고된 댓글 카운트
	@Override
	public int selectReplyReportCount() {
		return sqlSession.selectOne("postMapper.selectReplyReportCount");
	}

	// 신고된 댓글 리스트
	@Override
	public List<Reply> selectAllReportReply(PageInfo rpi) {
		int offset = (rpi.getCurrentPage() - 1) * rpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, rpi.getBoardLimit());
		return sqlSession.selectList("postMapper.selectAllReportReply", rowBounds);
	}

	// 대출 상태 업데이트
	@Override
	public void updateBookState(int bookNo) {
		sqlSession.update("adminMapper.bookStateUpdate", bookNo);

	}

	// 대출 권수 업데이트
	@Override
	public void updateLending(String userId) {
		sqlSession.update("adminMapper.lendingUpdate", userId);
	}

	// 반납일 업데이트
	@Override
	public int updateDate(int lendingNo) {
		int result = sqlSession.update("adminMapper.returndateUpdate", lendingNo);
		return result;
	}

	// 희망도서 업데이트
	@Override
	public void wishBookUpdate(int applyNo) {
		sqlSession.update("adminMapper.wishbookUpdate", applyNo);
	}

	// 택배리스트 카운트
	@Override
	public int selectParcelListCount() {
		int count = sqlSession.selectOne("adminMapper.selectParacelListCount");
		return count;
	}

	// 택배리스트 출력
	@Override
	public List<BookParcel> selectAllParacel(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<BookParcel> bList = sqlSession.selectList("adminMapper.ParcelBookList", pi, rowBounds);
		return bList;
	}

	// 택배 업데이트
	@Override
	public int updateParcel(String deliveryNo) {
		int result = sqlSession.update("adminMapper.ParcelUpdate", deliveryNo);
		return result;
	}

	// 택배 완료
	@Override
	public Book selectBookInfo(String bookNo) {
		Book books = sqlSession.selectOne("adminMapper.bookInfoSelect", bookNo);
		return books;
	}

	@Override
	public List<Statistics> selectAllstatis() {
		List<Statistics> sList = sqlSession.selectList("adminMapper.statisList");
		return sList;
	}

	@Override
	public String selectUserE(String usersId) {
		String userEmail = sqlSession.selectOne("adminMapper.selectEmail", usersId);
		return userEmail;
	}

	@Override
	public int insertbooks(Book book) {
		int result = sqlSession.insert("adminMapper.insertBook", book);
		return result;
	}

}
