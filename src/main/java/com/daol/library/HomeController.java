package com.daol.library;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daol.library.book.domain.Book;
import com.daol.library.book.domain.Keyword;
import com.daol.library.book.service.BookService;
import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.service.LendingBookService;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.service.MypageService;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.service.TasteService;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BookService book;
	@Autowired
	private LendingBookService lend;
	@Autowired
	private TasteService asd;
	@Autowired
	private MypageService mypage;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		String surveyCheck = (String)session.getAttribute("surveyCheck");
		String userId = (String)session.getAttribute("userId");
		session.setAttribute("surveyCheck", surveyCheck);
		if(userId != null) {
			Taste taste = asd.selectMyTaste(userId);
			if(taste != null) {
				String taste1 = taste.getTaste1();
				String taste2 = taste.getTaste2();
				String taste3 = taste.getTaste3();
				List<Book> taste1List = asd.printTaste1List(taste1);
				List<Book> taste2List = asd.printTaste2List(taste2);
				List<Book> taste3List = asd.printTaste3List(taste3);
				model.addAttribute("taste1List",taste1List);
				model.addAttribute("taste2List",taste2List);
				model.addAttribute("taste3List",taste3List);
				model.addAttribute("taste",taste);
			}
			Member member = mypage.printOneInfo(userId);
			model.addAttribute("member", member);
			if(member.getUserType().equals("학생")) {
				String major = member.getMajor();
				List<Book> mList = asd.printBooksByMajor(major);
				model.addAttribute("mList", mList);
			}
		}
		List<Book> bList = book.printNewBook();
		List<Book> pList = book.printBestBook();
		if(!bList.isEmpty()) {
			model.addAttribute("userId",userId);
			model.addAttribute("surveyCheck",surveyCheck);
			
			model.addAttribute("bList",bList);
			model.addAttribute("pList",pList);
			return "home";
		}else {
			model.addAttribute("msg","실패실패실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="popKeyword.do", method=RequestMethod.GET)
	public void popKeyword(HttpServletResponse response) throws JsonIOException, IOException {
		List<Keyword> kList = book.printPopKeyword();
		Gson gson = new Gson();
		gson.toJson(kList,response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping(value="manyBook.do", method=RequestMethod.GET)
	public void manyBookPeople(HttpServletResponse response) throws JsonIOException, IOException{
		List<LendingBook> lList = lend.printManyPeople();
		Gson gson = new Gson();
		gson.toJson(lList,response.getWriter());
	}
}
