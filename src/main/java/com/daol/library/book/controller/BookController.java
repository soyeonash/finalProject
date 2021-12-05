package com.daol.library.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.book.common.Pagenation;
import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.PageInfo;
import com.daol.library.book.domain.Review;
import com.daol.library.book.domain.Search;
import com.daol.library.book.service.BookService;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.mypage.service.MypageService;
import com.daol.library.reservationBook.service.ReservationBookService;

@Controller
public class BookController {
	@Autowired
	private BookService service;
	
	@Autowired
	private LendingBookService LendingBookService;
	
	@Autowired
	private MypageService MypageService;
	
	@Autowired
	private ReservationBookService rService;
	
//	간략 검색
	@GetMapping("/search.do")
	public String searchView() {
		return "book/bookSearchSimple";
	}
	@GetMapping("/searchSimple.do")
	public String simpleSearchList(@ModelAttribute Search search, Model model, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount1(search);
		PageInfo pi = Pagenation.getPageInfo(currentPage, totalCount);
		List<Book> bList = service.printSearchSimple(pi, search);
		regiKeyword(search);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			return "book/bookSearchSimple";
		} else {
			return "book/bookSearchSimple";
		}
	}
	
	//검색어 저장
	public void regiKeyword(Search search) {
		service.regiKeyword(search);
	}
	
//	상세 검색
	@GetMapping("/sDetail.do")
	public String sDetail() {
		return "book/bookSearchDetail";
	}
	@GetMapping("/searchDetail.do")
	public String detailSearchList(@ModelAttribute Search search, Model model, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount2(search);
		PageInfo pi = Pagenation.getPageInfo(currentPage, totalCount);
		List<Book> bList = service.printSearchDetail(pi, search);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			return "book/bookSearchDetail";
		} else {
			return "book/bookSearchDetail";
		}
	}
	
//	주제별 검색
	@GetMapping("/sSub.do")
	public String sSub() {
		return "book/bookSearchSubject";
	}
	@GetMapping("/searchSubject.do")
	public String subjectSearchList(@ModelAttribute Search search, Model model, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount3(search);
		PageInfo pi = Pagenation.getPageInfo(currentPage, totalCount);
		List<Book> bList = service.printSearchSub(pi, search);
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			return "book/bookSearchSubject";
		} else {
			return"book/bookSearchSubject";
		}
	}
	
//	신착 자료 조회
	@GetMapping("/searchNew.do")
	public String searchNewList(Model model) {
		List<Book> bList = service.printNewBook();
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			return "book/bookSearchNew";
		} else {
			return"book/bookSearchNew";
		}
	}
	
//	대출 베스트 조회
	@GetMapping("/bestBook.do")
	public String bestBookList(Model model) {
		List<Book> bList = service.printBestBook();
		if(!bList.isEmpty()) {
			model.addAttribute("bList", bList);
			return "book/bookPopular";
		} else {
			return"book/bookPopular";
		}
	}
	
//	도서 상세 조회
	@GetMapping("/bookDetail.do")
	public ModelAndView bookDetail(ModelAndView mv, @RequestParam("bookNo") int bookNo) {
		Book book = service.printOne(bookNo);
		List<Review> rList = MypageService.printOneForDetail(bookNo);
		LendingBook lendingBook = LendingBookService.printOneForDetail(bookNo);
		int rsvCount = rService.printRsvCount(bookNo);
		if(book != null) {
			mv.addObject("book", book);
			mv.addObject("lendingBook", lendingBook);
			mv.addObject("rList", rList);
			mv.addObject("rsvCount", rsvCount);
			mv.setViewName("book/bookDetail");
		} else {
			mv.addObject("msg", "상세 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
//	도서 대출 페이지 이동
	@GetMapping("/lendingBookView.do")
	public ModelAndView lendingBookView(ModelAndView mv, @RequestParam("bookNo") int bookNo) {
		Book book = service.printOne(bookNo);
		if(book != null) {
			mv.addObject("book", book);
			mv.setViewName("lendingBook/lendingBookView");
		} else {
			mv.addObject("msg", "대출 신청 실패");
			mv.setViewName("book/bookDetail");
		}
		return mv;
	}
	
}
