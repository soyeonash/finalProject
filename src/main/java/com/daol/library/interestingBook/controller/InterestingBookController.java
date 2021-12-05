package com.daol.library.interestingBook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daol.library.interestingBook.domain.InterestingBook;
import com.daol.library.interestingBook.service.InterestingBookService;

@Controller
public class InterestingBookController {
	@Autowired
	private InterestingBookService service;
	
	@ResponseBody
	@GetMapping("/interestingBook.do")
	public void interestingBook(HttpServletResponse response, @ModelAttribute InterestingBook intBook, @RequestParam("bookNo") int bookNo, @RequestParam("userId") String userId) throws IOException {
		intBook.setBookNo(bookNo);
		intBook.setUserId(userId);
		List<InterestingBook> iList = service.printAddCheck(intBook);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(iList.isEmpty()) {
			service.registerInteresting(intBook);
			out.println("<script>alert('관심 도서 담기 완료'); location.href='/bookDetail.do?bookNo="+bookNo+"';</script>");
			out.flush();
		} else {
			service.removeInteresting(intBook);
			out.println("<script>alert('관심 도서 담기 취소'); location.href='/bookDetail.do?bookNo="+bookNo+"';</script>");
			out.flush();
		}
	}
}
