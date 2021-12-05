package com.daol.library.reservationBook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daol.library.book.common.Pagenation;
import com.daol.library.book.domain.PageInfo;
import com.daol.library.reservationBook.domain.ReservationBook;
import com.daol.library.reservationBook.service.ReservationBookService;

@Controller
public class ReservationBookController {
	@Autowired
	private ReservationBookService service;
	
//	도서 예약
	@ResponseBody
	@GetMapping("/reservationBook.do")
	public void reservationBook(HttpServletResponse response, @ModelAttribute ReservationBook rsvBook, @RequestParam("bookNo") int bookNo) throws IOException {
		List<ReservationBook> rList = service.printAddCheck(rsvBook);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(rList.isEmpty()) {
			service.registerRsv(rsvBook);
			out.println("<script>alert('도서 예약 완료'); location.href='/bookDetail.do?bookNo="+bookNo+"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('이미 예약된 도서입니다.'); location.href='/bookDetail.do?bookNo="+bookNo+"';</script>");
			out.flush();
		}
	}
	
//	도서 예약 조회
	@GetMapping("/bookingList.do")
	public String bookingList(@ModelAttribute ReservationBook rsvBook, Model model, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount(rsvBook.getUserId());
		PageInfo pi = Pagenation.getPageInfo(currentPage, totalCount);
		List<ReservationBook> rList = service.printAllRsvBook(pi, rsvBook.getUserId());
		if(!rList.isEmpty()) {
			model.addAttribute("rList", rList);
			model.addAttribute("pi", pi);
		} 
		return "mypage/bookingList";
	}
	
//	도서 예약 삭제
	@ResponseBody
	@GetMapping("/deleteReservation.do")
	public void deleteRsv(HttpServletResponse response, @ModelAttribute ReservationBook rsvBook) throws IOException {
		int result = service.removeRsv(rsvBook);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('도서 예약 취소 완료'); location.href='/bookingList.do?userId=" + rsvBook.getUserId() +"';</script>");
			out.flush();
		} else {
			out.println("<script>alert('도서 예약 취소 실패'); location.href='/bookingList.do?userId="+ rsvBook.getUserId() +"';</script>");
			out.flush();
		}
	}
	
//	도서 예약 다중 삭제
	@ResponseBody
	@PostMapping("/deleteRsvList.do")
	public String deleteRsvList(@RequestParam("rsvNum") String[] rsvNo) {
		int nums[] = new int[rsvNo.length];
		for(int i = 0; i < rsvNo.length; i++) {
			nums[i] = Integer.parseInt(rsvNo[i]);
		}
		int result = service.removeRsvList(nums);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}
