package com.daol.library.mypage.controller;

import java.io.File;
import java.sql.Date;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.WishBook;
import com.daol.library.book.service.BookService;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.member.controller.MemberController;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.common.Pagination;
import com.daol.library.mypage.domain.PageInfo;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.mypage.service.MypageService;
import com.daol.library.readingRoom.domain.ReadingRoom;
import com.daol.library.studyRoom.domain.StudyRoom;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	@Autowired
	private BookService bService;
	@Autowired
	private MemberController mController;

	// --- 회원정보 ---//
	/** 마이페이지 회원정보 조회 화면 */
	@RequestMapping(value = "mypageInfo.do", method = RequestMethod.GET)
	public String mypageInfoView(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		try {
			Member memberOne = service.printOneInfo(member);
			session.setAttribute("loginUser", memberOne);
			return "mypage/mypageInfo";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 정보 조회 실패!");
			return "common/errorPage";
		}

	}

	/** 연회비 결제 후 대기 상태로 변경 */
	@RequestMapping(value = "updatePaymentStatus.do", method = RequestMethod.GET)
	public String updatePaymentStatus(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		Member member = new Member();
		member.setUserId(userId);
		try {
			int result = service.updatePayment(member);
			if (result > 0) {
				session.setAttribute("loginUser", member);
				return "redirect:mypageInfo.do?userId=" + userId;
			} else {
				model.addAttribute("msg", "연회비 결제 정보 업데이트 실패!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}

	/** 마이페이지 정보 수정 화면 */
	@RequestMapping(value = "modifyInfoView.do", method = RequestMethod.GET)
	public String modifyInfoView(@ModelAttribute Member member, HttpServletRequest request) {
		return "mypage/modifyInfo";
	}

	/** 회원 정보 수정 */
	@RequestMapping(value = "modifyInfo.do", method = RequestMethod.POST)
	public String modifyInfo(@ModelAttribute Member member, @RequestParam("enrollDate2") String enrollDate2,
			HttpServletRequest request, Model model,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		member.setEnrollDate(Date.valueOf(enrollDate2));
		if (reloadFile != null) {
			// 기존 파일 삭제
			if (member.getProfilePic() != "") {
				deleteFile(member.getProfilePic(), request);
			}
			// 새파일업로드
			String fileRename = mController.saveFile(reloadFile, request);
			if (fileRename != null) {
				member.setProfilePic(reloadFile.getOriginalFilename());
			}
		}
		int result = service.modifyMember(member);
		try {
			if (result > 0) {
				session.setAttribute("loginUser", member);
				return "redirect:mypageInfo.do?userId=" + userId;
			} else {
				model.addAttribute("msg", "회원 정보 수정 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}

	/** 파일 삭제 */
	public void deleteFile(String fileName, HttpServletRequest request) {// 경로를 만들어주기 위한 작업(경로를 알아야 해당 파일을 삭제할 수 있음)
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root + "\\muploadFiles";
		File file = new File(fullPath + "\\" + fileName); // 파일객체를 이용해서
		if (file.exists()) {
			file.delete(); // 파일 삭제
		}
	}

	/** 마이페이지 회원탈퇴 화면 */
	@RequestMapping(value = "leaveAccount.do", method = RequestMethod.GET)
	public String leaveAccountView(@ModelAttribute Member member, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member memberOne = service.printOneInfo(member);
		session.setAttribute("loginUser", memberOne);
		return "mypage/leaveAccount";

	}

	/** 탈퇴 */
	@RequestMapping(value = "removeMember.do", method = RequestMethod.GET)
	public String removeMember(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		int result = service.removeMember(member);
		HttpSession session = request.getSession();
		if (result > 0) {
			session.invalidate();
			return "home";
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
	}

	/** 비밀번호 일치 여부 검사 */
	@ResponseBody
	@RequestMapping(value = "checkDupPwd.do", method = RequestMethod.GET)
	public String pwdDuplicateCheck(@ModelAttribute Member member, HttpServletRequest request) {
		int result = service.checkPwdDup(member);
		return String.valueOf(result);
	}

	// --- 도서 ---//
	/** 대출현황 */
	@RequestMapping(value = "lendingStatus.do", method = RequestMethod.GET)
	public ModelAndView lendingStatus(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount(userId);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);

		try {
			List<Book> lendingList = service.printAllLendingHistory(pi, userId);
			if (!lendingList.isEmpty()) {
				mv.addObject("lendingList", lendingList);
				mv.addObject("pi", pi);
			} else {
				mv.addObject("lendingList", null);
			}
			mv.setViewName("mypage/lendingStatus");
		} catch (Exception e) {
			mv.addObject("msg", "대출 내역 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	/** 서평 등록 */
	@ResponseBody
	@RequestMapping(value = "registerReview.do", method = RequestMethod.POST)
	public String registerReview(@RequestParam("bookNo") int bookNo,
			@RequestParam("reviewContents") String reviewContents, @RequestParam("reviewStar") String reviewStar,
			HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Review review = new Review();
		review.setUserId(userId);
		review.setBookNo(bookNo);
		review.setReviewContents(reviewContents);
		review.setReviewStar(Double.valueOf(reviewStar));
		int result = service.registerReview(review);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	/** 서평 수정 */
	@ResponseBody
	@RequestMapping(value = "modifyReview.do", method = RequestMethod.POST)
	public String modifyReview(@RequestParam("bookNo") int bookNo,
			@RequestParam("reviewContents") String reviewContents, @RequestParam("reviewStar") String reviewStar, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Review review = new Review();
		review.setUserId(userId);
		review.setBookNo(bookNo);
		review.setReviewContents(reviewContents);
		review.setReviewStar(Double.valueOf(reviewStar));
		int result = service.modifyReview(review);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	/** 서평 삭제 */
	@ResponseBody
	@RequestMapping(value = "deleteReview.do", method = RequestMethod.POST)
	public String deleteReview(@RequestParam("bookNo") int bookNo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Review review = new Review();
		review.setUserId(userId);
		review.setBookNo(bookNo);
		int result = service.removeReview(review);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	/** 대출연장 */
	@ResponseBody
	@RequestMapping(value = "extendLending.do", method = RequestMethod.POST)
	public String extendLending(@RequestParam("lendingNo") int lendingNo,
			 HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		int result = service.extendLending(lendingNo);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	

	/** 희망도서 내역 */
	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList(HttpServletRequest request, Model model,
			@RequestParam(value = "page", required = false) Integer page, @ModelAttribute Member member,
			@ModelAttribute WishBook wishbook) {
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", member);
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getWishListCount(member.getUserId());
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		try {
			List<WishBook> wList = service.printWishBook(pi, member.getUserId());
			if (!wList.isEmpty()) {
				model.addAttribute("wList", wList);
				model.addAttribute("pi", pi);
			} else {
				model.addAttribute("wList", null);
			}
			return "mypage/wishList";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "희망 도서 정보 조회 실패!");
			return "common/errorPage";
		}
	}

	/** 희망도서 신청 */
	@RequestMapping(value = "applyBook.do", method = RequestMethod.POST)
	public String applyBook(HttpServletRequest request, @ModelAttribute Member member,
			@ModelAttribute WishBook wishbook, String div, Model model) throws Exception {

		// db 삽입
		int result = service.registerWishBook(wishbook);

		try {

			if (result > 0) {
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("loginUser", member);

				final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; // 이메일 객체생성하기
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

				final String username = "daolLibrary1@gmail.com";// 발신자의 이메일 아이디 입력
				final String password = "daol1234"; // 발신자의 패스워드

				try {
					Session session = Session.getDefaultInstance(props, new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					}); // 메세지 설정
					Message msg = new MimeMessage(session);

					// 보내는사람 받는사람 설정
					msg.setFrom(new InternetAddress("daolLibrary1@gmail.com"));
					msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("daolLibrary1@gmail.com", false));
					msg.setSubject(member.getUserId() + "님의 희망 도서 신청");
					msg.setText("======  " + member.getUserId() + "님의 희망 도서 신청 내역   =====" + "\n 도서명 : "
							+ wishbook.getBookName() + "\n 출판사 : " + wishbook.getPublisher() + "\n 저자명 : "
							+ wishbook.getBookWriter() + "\n ==================================");
					Transport.send(msg);
//					System.out.println("발신성공!");

					return "redirect: wishList.do?userId=" + wishbook.getUserId();

				} catch (Exception e) {
					model.addAttribute("msg", "희망 도서 신청 메일 전송 실패");
					return "common/errorPage";
				}
			} else {
				model.addAttribute("msg", "희망 도서 등록 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "common/errorPage";
		}

	}

	/** 관심 도서 내역 */
	@RequestMapping(value = "likeList.do", method = RequestMethod.GET)
	public ModelAndView likeList(ModelAndView mv, HttpSession session, @RequestParam(value="page", required = false) Integer page) {
		String userId = (String) session.getAttribute("userId");
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getlikeListCount(userId);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		try {
			List<Book> likeList = service.printLikeList(pi, userId);
			if(!likeList.isEmpty()) {
				mv.addObject("likeList", likeList);
				mv.addObject("pi", pi);
			}else {
				mv.addObject("likeList", null);
			}
			mv.setViewName("mypage/likeList");
		}catch(Exception e) {
			mv.addObject("msg", "관심도서 내역 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}


	
	

	// --- 시설 이용 ---//
	/** 열람실 이용내역 */
	@RequestMapping(value = "readingroomHistory.do", method = RequestMethod.GET)
	public String readingroomHistory(@ModelAttribute ReadingRoom readingRoom,
			@RequestParam(value = "page", required = false) Integer page, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getrListCount(userId);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		try {
			List<ReadingRoom> rList = service.printAllrList(userId);
			if (!rList.isEmpty()) {
				model.addAttribute("rList", rList);
				model.addAttribute("pi", pi);
			} else {
				model.addAttribute("rList", null);
			}

			return "mypage/readingroomHistory";
		} catch (Exception e) {
			model.addAttribute("msg", "열람실 내역 조회 실패");
			return "common/errorPage";
		}

	}

	/** 열람실 예약 취소 */
	@RequestMapping(value = "cancelReadingRoom.do", method = RequestMethod.GET)
	public String cancleReadingRoom(HttpServletRequest request, @RequestParam("rReservationNo") int rReservationNo,
			Model model) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		int result = service.cancelReadingRoom(rReservationNo);
		try {
			if (result > 0) {
				return "redirect:readingroomHistory.do?userId=" + userId;
			} else {
				model.addAttribute("msg", "예약 취소 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}

	}

	/** 스터디룸 이용 내역 */
	@RequestMapping(value = "studyroomHistory.do", method = RequestMethod.GET)
	public String studyroomHistory(@ModelAttribute StudyRoom studyRoom, @RequestParam("userId") String userId,
			Model model) {

		try {
			List<StudyRoom> sList = service.printAllsList(userId);
			if (!sList.isEmpty()) {
				model.addAttribute("sList", sList);
			} else {
				model.addAttribute("sList", null);
			}
			return "mypage/studyroomHistory";
		} catch (Exception e) {
			model.addAttribute("msg", "스터디룸 내역 조회 실패");
			return "common/errorPage";
		}

	}

	/** 스터디룸 예약 취소 */
	@RequestMapping(value = "cancelStudyRoom.do", method = RequestMethod.GET)
	public String cancleStudyRoom(HttpServletRequest request, @RequestParam("sReservationNo") int sReservationNo,
			Model model) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		int result = service.cancelStudyRoom(sReservationNo);
		try {
			if (result > 0) {
				return "redirect:studyroomHistory.do?userId=" + userId;
			} else {
				model.addAttribute("msg", "예약 취소 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}

	}

	// --- 문의 ---//
	// 문의페이지
	@RequestMapping(value = "qnaList.do", method = RequestMethod.GET)
	public ModelAndView qnaList(ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId != null) {
			mv.addObject("userId", userId);
		}
		List<Qna> qList = service.printAllQna(userId);
		mv.addObject("qList", qList);
		mv.setViewName("mypage/qna");
		return mv;
	}

	// 문의작성페이지이동
	@RequestMapping(value = "registQnaView.do", method = RequestMethod.GET)
	public ModelAndView registViewQna(ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId != null) {
			mv.addObject("userId", userId);
			mv.setViewName("mypage/qnaRegistView");
		}
		return mv;
	}

	// 문의 작성
	@RequestMapping(value = "qnaRegist.do", method = RequestMethod.POST)
	public String registQna(Model model, @ModelAttribute Qna qna) {
		int result = service.registQna(qna);
		if (result > 0) {
			return "redirect:qnaList.do";
		} else {
			model.addAttribute("msg", "등록실패");
			return "common/errorPage";
		}
	}

	// 문의 디테일 페이지 이동
	@RequestMapping(value = "qnaDetail.do", method = RequestMethod.GET)
	public ModelAndView qnaDetail(ModelAndView mv, @RequestParam("qnaNo") int qnaNo, HttpSession session) {
		String member = (String) session.getAttribute("userId");
		if (member != null) {
			mv.addObject("userId", member);
		}
		Qna qna = service.printOneQna(qnaNo);
		if (qna != null) {
			mv.addObject("qna", qna);
			mv.setViewName("mypage/qnaDetail");
		} else {
			mv.addObject("msg", "조회실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 문의 수정페이지 이동
	@RequestMapping(value = "qnaModifyView.do", method = RequestMethod.GET)
	public ModelAndView qnaModifyView(ModelAndView mv, @RequestParam("qnaNo") int qnaNo, HttpSession session) {
		String member = (String) session.getAttribute("userId");
		if (member != null) {
			mv.addObject("userId", member);
		}
		Qna qna = service.printOneQna(qnaNo);
		if (qna != null) {
			mv.addObject("qna", qna);
			mv.setViewName("mypage/qnaModifyView");
		} else {
			mv.addObject("msg", "조회실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 문의 수정
	@RequestMapping(value = "qnaModify.do", method = RequestMethod.POST)
	public String qnaModify(@ModelAttribute Qna qna) {
		int result = service.modifyQna(qna);
		if (result > 0) {
			return "redirect:qnaList.do";
		} else {
			return "common/errorPage";
		}
	}

	// 문의 삭제
	@RequestMapping(value = "qnaRemove.do", method = RequestMethod.GET)
	public String qnaRemove(@RequestParam("qnaNo") int qnaNo) {
		int result = service.removeQna(qnaNo);
		if (result > 0) {
			return "redirect:qnaList.do";
		} else {
			return "common/errorpage";
		}
	}
}
