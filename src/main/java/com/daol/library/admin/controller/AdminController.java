package com.daol.library.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.admin.common.Pagination;
import com.daol.library.admin.domain.BookParcel;
import com.daol.library.admin.domain.PageInfo;
import com.daol.library.admin.domain.Search;
import com.daol.library.admin.domain.Statistics;
import com.daol.library.admin.domain.Status;
import com.daol.library.admin.service.AdminService;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.WishBook;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.post.domain.Post;
import com.daol.library.post.domain.Reply;
import com.daol.library.post.service.PostService;
import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.service.ReservationBookService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private PostService pService;
	@Autowired
	private ReservationBookService rService;

	// 회원 관리 목록
	@RequestMapping(value = "userListView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView showUserList(ModelAndView mv, @ModelAttribute Member member,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getUserListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Member> uList = service.printAllMember(pi);

		if (!uList.isEmpty()) {
			mv.addObject("uList", uList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/userListView");
		} else {
			mv.addObject("msg", "회원 정보 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 회원 검색
	@RequestMapping(value = "userSearch.do", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchUserList(ModelAndView mv, @ModelAttribute Search search,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getSearchUserListCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Member> uList = service.printSearchAllUser(search, pi);
		int pn = 0;
		if (!uList.isEmpty()) {
			mv.addObject("uList", uList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.addObject("pn", pn);
			mv.setViewName("admin/userListView");
		} else {
			mv.addObject("message", "검색 결과가 없습니다.");
			mv.setViewName("admin/userListView");
		}
		return mv;
	}

	// 선택한 회원 삭제
	@ResponseBody
	@RequestMapping(value = "userDelete.do", method = RequestMethod.GET)
	public String deleteUser(@RequestParam(value = "userNo[]") String[] userNo, HttpServletRequest request,
			Model model) {
		int[] nums = new int[userNo.length];
		for (int i = 0; i < userNo.length; i++) {
			nums[i] = Integer.parseInt(userNo[i]);
		}
		int result = service.deleteUser(nums);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 회원 상세보기
	@RequestMapping(value = "userDetail.do", method = RequestMethod.GET)
	public ModelAndView userDetail(@RequestParam("userNo") int userNo, @ModelAttribute LendingBook lendingBook,
			ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		Member member = service.printUser(userNo);
		try {
			if (member != null) {
				mv.addObject("member", member);
				mv.setViewName("admin/userDetailView");
			} else {
				mv.addObject("msg", "회원 상세조회 실패");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}

		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getLendingBookListCount(member.getUserId());
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<LendingBook> lList = service.printAllLendingBook(pi, member.getUserId());

		if (!lList.isEmpty()) {
			mv.addObject("lList", lList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/userDetailView");
		} else {
			mv.addObject("lList", lList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/userDetailView");
		}
		return mv;
	}

	// 이용증 발급
	@ResponseBody
	@RequestMapping(value = "userPassIssued.do", method = RequestMethod.POST)
	public String userPassIssued(@ModelAttribute Member member, HttpSession session) {
		int result = service.userPassIssued(member);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 이용 기간 설정, 이메일 전송
	@ResponseBody
	@RequestMapping(value = "userEndDateUpdate.do", method = RequestMethod.POST)
	public String userEndDateUpdate(@ModelAttribute Member member) {
		int result = service.userEndDateUpdate(member);
		Member userEmail = service.getUserEmail(member);
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; // 이메일 객체 생성
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
		final String username = "daolLibrary1@gmail.com"; // 발신자 이메일
		final String password = "daol1234"; // 발신자 비밀번호
		
		try {
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); //원하는 데이터 포맷 지정
			String endDate = simpleDateFormat.format(userEmail.getEndDate()); //지정한 포맷으로 변환 

			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("daolLibrary1@gmail.com"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail.getUserEmail()));
			msg.setSubject("[다올대학교 도서관 규장각] 예약 도서 대출 가능 알림");
			msg.setText("안녕하십니까, 다올대학교 도서관 규장각입니다.\n\n이용증 발급이 완료되었습니다. \n이용 기간은 " + endDate+"까지 입니다. \n도서관 이용에 참고바랍니다.\n\n감사합니다.");
			Transport.send(msg);
		} catch (Exception e) {
			System.out.println("전송 실패");
		}
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 이용 승인 정렬
	@RequestMapping(value = "waitingSort.do", method = RequestMethod.GET)
	public ModelAndView waitingSort(ModelAndView mv, @ModelAttribute Member member, HttpSession session,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getWaitUserListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Member> uList = service.printWaitMember(pi);

		if (!uList.isEmpty()) {
			mv.addObject("uList", uList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/userListSortView");
		} else {
			mv.addObject("msg", "회원 정보 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;

	}

	// 장서 목록 리스트
	@RequestMapping(value = "bookListView.do", method = RequestMethod.GET)
	public ModelAndView bookListView(ModelAndView mv, @ModelAttribute Book book,
			@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {

		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Book> bList = service.printAll(pi);

		if (!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.addObject("pi", pi);
			mv.setViewName("adminbook/bookList");
//			return "board/boardListView";
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
//			return "common/errorPage";
		}
		return mv;
	}

	// 장서 검색
	@RequestMapping(value = "bookSearch.do", method = RequestMethod.GET)
	public String bookSearchList(@ModelAttribute Search search, Model model) {
		List<Book> searchList = service.printSearchAll(search);
		if (!searchList.isEmpty()) {
			model.addAttribute("bList", searchList);
			model.addAttribute("search", search);
			return "adminbook/bookList";
		} else {
			model.addAttribute("msg", "공지사항 검색 실패");
			return "common/errorPage";
		}
	}

	// 장서 등록 페이지
	@RequestMapping(value = "bookEnrollView.do", method = RequestMethod.GET)
	public String bookEnrollView() {
		return "adminbook/bookEnroll";
	}

	// 장서 수정
	@RequestMapping(value = "booksEnroll.do", method = RequestMethod.POST)
	public String booksupdate(@ModelAttribute Book book,
			@RequestParam(value = "bookCoverFile", required = false) MultipartFile bookCover, Model model,
			HttpServletRequest request) {

		if (!bookCover.getOriginalFilename().equals("")) {
			// uploadFile이 비어있지 않으면
			String filePath = saveFile(bookCover, request);
			if (filePath != null) {
				book.setBookCover(bookCover.getOriginalFilename());
			}
		}
		int result = service.enrollBook(book);
		if (result > 0) {
			return "redirect:bookListView.do";
		} else {
			model.addAttribute("msg", "책 등록 실패");
			return "common/errorPage";
		}
	}

	// 장서 등록
		@RequestMapping(value = "bookEnroll.do", method = RequestMethod.POST)
		public String bookEnroll(@ModelAttribute Book book,
				@RequestParam(value = "bookCoverFile", required = false) MultipartFile bookCover, Model model,
				HttpServletRequest request) {

			if (!bookCover.getOriginalFilename().equals("")) {
				// uploadFile이 비어있지 않으면
				String filePath = saveFile(bookCover, request);
				if (filePath != null) {
					book.setBookCover(bookCover.getOriginalFilename());
				}
			}
			int result = service.enrollBooks(book);
			if (result > 0) {
				return "redirect:bookListView.do";
			} else {
				model.addAttribute("msg", "책 등록 실패");
				return "common/errorPage";
			}
		}
	// 대출 통계
	@RequestMapping(value = "statisticsView.do", method = RequestMethod.GET)
	public ModelAndView statisticsView(ModelAndView mv, @ModelAttribute Statistics statistics) {

		List<Statistics> sList = service.statisAll();
		if (!sList.isEmpty()) {
			mv.addObject("sList", sList);
			mv.setViewName("adminbook/statistics");
		} else {
			mv.addObject("msg", "대출통계 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 책 수정
	@RequestMapping(value = "bookUpdate.do", method = RequestMethod.GET)
	public ModelAndView bookUpdate(ModelAndView mv, @ModelAttribute Book book,
			@RequestParam(value = "bookNo") String bookNo, HttpServletRequest request, Model model) {

		Book books = service.bookinfoUpdate(bookNo);

		if (books != null) {
			mv.addObject("book", books);
			mv.setViewName("adminbook/bookUpdate");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일저장경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 저장폴더 선택
		String savePath = root + "\\bookcover";
		// 없으면 생성
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir(); // 폴더 생성
		}
		String filePath = folder + "\\" + file.getOriginalFilename();
		// 파일 저장
		try {
			file.transferTo(new File(filePath)); // 파일 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 파일경로 리턴
		return filePath;
	}

	// 장서 삭제
	@ResponseBody
	@RequestMapping(value = "bookDelete.do", method = RequestMethod.POST)
	public String deleteBook(@RequestParam(value = "bookNo[]") String[] bookNo, HttpServletRequest request,
			Model model) {
//		 String[] bookNo = request.getParameterValues("bookNo");
		int[] nums = new int[bookNo.length];
		for (int i = 0; i < bookNo.length; i++) {
			nums[i] = Integer.parseInt(bookNo[i]);
		}

		int result = service.bookDelete(nums);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}

	}

	// 희망도서 리스트
	@RequestMapping(value = "wishbookList.do", method = RequestMethod.GET)
	public ModelAndView wishBook(ModelAndView mv, @ModelAttribute WishBook wishbook,
			@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {

		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getWishListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<WishBook> bList = service.wishAll(pi);

		if (!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.addObject("pi", pi);
			mv.setViewName("adminbook/wishbookList");
//				return "board/boardListView";
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
//				return "common/errorPage";
		}
		return mv;
	}
	 
	 // 희망 도서 등록 페이지
	 @RequestMapping(value="wishbookEnroll.do", method=RequestMethod.GET)
	 public ModelAndView wishbookEnrollView(ModelAndView mv, @RequestParam(value="bookName")String bookName
			 , @RequestParam(value="bookWriter")String bookWriter, @RequestParam(value="publisher")String publisher
			 ,@RequestParam(value="applyNo")int applyNo,@RequestParam(value="userId") String userId, HttpServletRequest request) {
				mv.addObject("bookName", bookName);
				mv.addObject("bookWriter",bookWriter);
				mv.addObject("publisher",publisher);
				mv.addObject("applyNo",applyNo);
				mv.addObject("userId", userId);
				mv.setViewName("adminbook/wishbookEnroll");
			
				return mv;
	 }
	 // 희망 도서 등록
	 @RequestMapping(value="wishbookEnr.do", method=RequestMethod.POST)
	 public String wishbookEnroll(@ModelAttribute Book book,@RequestParam(value="applyNum")int applyNo
			 , @RequestParam(value="bookCoverFile", required=false)MultipartFile bookCover
			 , @RequestParam(value="userId") String usersId, HttpServletRequest request,Model model) {
		 	if (!bookCover.getOriginalFilename().equals("")) {
				// uploadFile이 비어있지 않으면
				String filePath = saveFile(bookCover, request);
				if (filePath != null) {
					book.setBookCover(bookCover.getOriginalFilename());
				}
			}
		 String userEmail = service.selectEmail(usersId);
		 int result = service.enrollBook(book);
		 if(result > 0) {
			 service.updateWishBook(applyNo);
			 service.mailSend(userEmail);
			 model.addAttribute("msg","메일 발송이 완료되었습니다!");
			 return "adminbook/mailSend";
		 }else {
			 model.addAttribute("msg","희망 도서 등록 실패");
			 return "common/errorPage";
		 }
		 
		
	 }
	 // 대출 현황 리스트 
	 @RequestMapping(value="statusList.do", method=RequestMethod.GET)
	 public ModelAndView StatusBook(ModelAndView mv, @ModelAttribute Status status,@RequestParam(value="page", required=false)Integer page ,HttpServletRequest request) {
		 
		 int currentPage = (page != null) ? page : 1;
			int totalCount = service.getStatusListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			List<Status> bList = service.statusAll(pi);
		
			if(!bList.isEmpty()) {
				mv.addObject("bList", bList);
				mv.addObject("pi",pi);
				mv.setViewName("adminbook/bookStatus");
//				return "board/boardListView";
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
//				return "common/errorPage";
		}
		return mv;
	}

	// 대출 현황 리스트
	@RequestMapping(value = "bookParcelList.do", method = RequestMethod.GET)
	public ModelAndView bookParcelBook(ModelAndView mv, @ModelAttribute BookParcel bookparcel,
			@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {

		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getParcelListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<BookParcel> bList = service.parcelAll(pi);

		if (!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.addObject("pi", pi);
			mv.setViewName("adminbook/parcelList");
//				return "board/boardListView";
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
//				return "common/errorPage";
		}
		return mv;
	}

	// 도서 반납
	@RequestMapping(value = "bookReturn.do", method = RequestMethod.GET)
	public String returnBook(@RequestParam(value = "userId") String userId, @RequestParam(value = "bookNo") int bookNo,
			@RequestParam(value = "lendingNo") int lendingNo, HttpServletRequest request, Model model)
			throws Exception {
		service.lendingCopy(userId);
		service.bookState(bookNo);
		sendEmailForRsv(bookNo);
		int result = service.dateUpdate(lendingNo);
		if (result > 0) {
			return "redirect:statusList.do";
		} else {
			return "common/errorPage";
		}

	}

//	예약 도서 알림 (이메일 발송)
	public void sendEmailForRsv(int bookNo) throws Exception {
		List<ReservationBook> rList = rService.printRsvList(bookNo);
		try {
			if (!rList.isEmpty()) {
				List<Member> mList = rService.printUserEmail(bookNo);
				ReservationBook rInfo = rService.printRsvBookInfo(bookNo);
				final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; // 이메일 객체 생성
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
				final String username = "daolLibrary1@gmail.com"; // 발신자 이메일
				final String password = "daol1234"; // 발신자 비밀번호
				InternetAddress[] addr = new InternetAddress[mList.size()];
				for (int i = 0; i < mList.size(); i++) {
					addr[i] = new InternetAddress(mList.get(i).getUserEmail().trim());
				}
				try {
					Session session = Session.getDefaultInstance(props, new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					});
					Message msg = new MimeMessage(session);
					msg.setFrom(new InternetAddress("daolLibrary1@gmail.com"));
					msg.setRecipients(Message.RecipientType.TO, addr);
					msg.setSubject("[다올대학교 도서관 규장각] 예약 도서 대출 가능 알림");
					msg.setText("안녕하십니까, 다올대학교 도서관 규장각입니다.\n\n예약 신청하신 도서 <" + rInfo.getBook().getBookName()
							+ ">가 대출 가능 상태입니다.\n도서관 이용에 참고바랍니다.\n\n감사합니다.");
					Transport.send(msg);
					System.out.println("이메일 전송 완료");
					rService.modifyRsv(bookNo);
				} catch (Exception e) {
					System.out.println("전송 실패");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 택배 완료처리
	@RequestMapping(value = "parcelSuccess.do", method = RequestMethod.GET)
	public String parcelSuc(@RequestParam(value = "deliveryNo") String deliveryNo, HttpServletRequest request,
			Model model) {
		int result = service.parcelUpdate(deliveryNo);
		if (result > 0) {
			return "redirect:bookParcelList.do";
		} else {
			return "common/errorPage";
		}

	}

	// 관리자페이지 문의관리 이동
	@RequestMapping(value = "adQnaList.do", method = RequestMethod.GET)
	public ModelAndView qnaListView(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			HttpSession session) {
		String login = (String) session.getAttribute("userId");
		Member member = service.memberCk(login);
		int pn = 1;
		if (member != null) {
			String userType = member.getUserType();
			mv.addObject("userType", userType);
		}
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getQnaListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Qna> qList = service.printAllQna(pi);
		if (!qList.isEmpty()) {
			mv.addObject("qList", qList);
			mv.addObject("pi", pi);
			mv.addObject("pn", pn);
		}
		mv.setViewName("admin/qnaListView");
		return mv;
	}

	// 관리자 문의관리 검색
	@RequestMapping(value = "qnaSearch.do", method = RequestMethod.GET)
	public String noticeSearchList(@ModelAttribute Search search, Model model,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getSearchQnaListCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Qna> qList = service.printSearchAll(search, pi);
		int pn = 0;
		if (!qList.isEmpty()) {
			model.addAttribute("qList", qList);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			model.addAttribute("pn", pn);
			return "admin/qnaListView";
		} else {
			model.addAttribute("qList", qList);
			model.addAttribute("search", search);
			return "admin/qnaListView";
		}
	}

	// 문의 상세페이지
	@RequestMapping(value = "qnaAnswer.do", method = RequestMethod.GET)
	public ModelAndView qnaAnswer(ModelAndView mv, @RequestParam("qnaNo") int qnaNo) {
		Qna qna = service.printOneQna(qnaNo);
		mv.addObject("qna", qna);
		mv.setViewName("admin/qnaAnswerView");
		return mv;
	}

	// 답변등록
	@RequestMapping(value = "answer.do", method = RequestMethod.POST)
	public String answer(@ModelAttribute Qna qna, HttpSession session) {
		String login = (String) session.getAttribute("userId");
		qna.setReplyUserId(login);
		int result = service.modifyAnswer(qna);
		System.out.println(qna.toString());
		if (result > 0) {
			return "redirect:adQnaList.do";
		} else {
			return "common/errorPage";
		}
	}

	// 답변수정
	@RequestMapping(value = "qnaAnswerModify.do", method = RequestMethod.POST)
	public String answerModify(@ModelAttribute Qna qna, HttpSession session) {
		String login = (String) session.getAttribute("userId");
		qna.setReplyUserId(login);
		int result = service.modifyAnswer(qna);
		if (result > 0) {
			return "redirect:adQnaList.do";
		} else {
			return "common/errorPage";
		}
	}

	// 신고관리 리스트
	@RequestMapping(value = "reportView.do", method = RequestMethod.GET)
	public ModelAndView reportView(ModelAndView mv, HttpSession session,
			@RequestParam(value = "page", required = false) Integer page) {
		String login = (String) session.getAttribute("userId");
		Member member = service.memberCk(login);
		if (member != null) {
			String userType = member.getUserType();
			mv.addObject("userType", userType);
		}
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getPostReportCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Post> rpList = service.printAllReportPost(pi);
		mv.addObject("rpList", rpList);
		mv.addObject("pi", pi);
		int reCurrentPage = (page != null) ? page : 1;
		int reTotalCount = service.getReplyReportCount();
		PageInfo rpi = Pagination.getPageInfo(reCurrentPage, reTotalCount);
		List<Reply> rrList = service.printAllReportReply(rpi);
		mv.addObject("rrList", rrList);
		mv.addObject("rpi", rpi);
		mv.setViewName("admin/reportView");
		return mv;
	}

	// 신고 게시글 삭제
	@RequestMapping(value = "delPost.do", method = RequestMethod.GET)
	public String removePost(@RequestParam("postNo") int postNo) {
		int result = pService.removePost(postNo);
		if (result > 0) {
			return "redirect:reportView.do";
		} else {
			return "common/errorPage";
		}
	}

	// 신고 댓글 삭제
	@RequestMapping(value = "delReply.do", method = RequestMethod.GET)
	public String deleteReply(@ModelAttribute Reply reply) {
		int result = pService.removeReply(reply);
		if (result > 0) {
			return "redirect:reportView.do";
		} else {
			return "common/errorPage";
		}
	}
}
