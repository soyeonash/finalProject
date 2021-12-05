package com.daol.library.lendingBook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daol.library.book.domain.Book;
import com.daol.library.book.service.BookService;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.domain.Parcel;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.member.service.MemberService;

@Controller
public class LendingBookController {
	@Autowired
	private LendingBookService service;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private MemberService memberService;
	
//	도서 대출 신청
	@PostMapping("/lendingBook.do")
	public void lendingBook(HttpServletResponse response, @ModelAttribute Parcel parcel, @RequestParam("bookNo") int bookNo, @RequestParam("userId") String userId, @RequestParam("bookReceive") String bookReceive, @RequestParam("post") String post ,@RequestParam("address1") String address1, @RequestParam("address2") String address2) throws IOException {
		parcel.setAddr(post + "/" + address1 + "/" + address2);
		Book book = bookService.printOne(bookNo);
		LendingBook lendBook = new LendingBook();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		lendBook.setBookNo(bookNo);
		lendBook.setReceive(bookReceive);
		lendBook.setUserId(userId);
		try {
			if(bookReceive.equals("visit")) {
				int result = 0;
				result += memberService.modifyOne(userId);
				result += service.registerLending(lendBook);
				result += bookService.modifyLendingBook(bookNo);
//				model.addAttribute("lendBook", lendBook);
				if(result >= 3) {
					out.println("<script>alert('대출 신청 완료'); location.href='/bookDetail.do?bookNo="+lendBook.getBookNo()+"';</script>");
//					return "redirect:/bookDetail.do?bookNo="+lendBook.getBookNo();
					out.flush();
				}
			} else if(bookReceive.equals("parcel")) {
				int result = 0;
				result += memberService.modifyOne(userId);
				result += service.registerLendingParcel(lendBook);
				result += bookService.modifyLendingBook(bookNo);
				result += service.registerParcel(parcel);
				if(result >= 4) {
					out.println("<script>alert('대출 신청 완료'); location.href='/bookDetail.do?bookNo="+lendBook.getBookNo()+"';</script>");
					out.flush();
				}
			}
		} catch(Exception e) {
			out.println("<script>alert('대출 신청 실패'); location.href='/bookDetail.do?bookNo="+lendBook.getBookNo()+"';</script>");
			out.flush();
		}
    }
	
}
