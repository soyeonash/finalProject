package com.daol.library.taste.controller;

import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.book.domain.Book;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;
import com.daol.library.taste.service.TasteService;

@Controller
public class TasteController {
	
	@Autowired
	private TasteService service;
	
	// --- 취향분석 ---//
	/** 취향분석설문 화면 */
	@RequestMapping(value = "tasteSurveyView.do", method = RequestMethod.GET)
	public ModelAndView tasteSurveyView(ModelAndView mv, HttpSession session) {
		String surveyCheck = (String)session.getAttribute("surveyCheck");
		
		try {
			session.setAttribute("surveyCheck", surveyCheck);
			List<Book> surveyList = service.printSurveyList();
			if(!surveyList.isEmpty()) {
				mv.addObject("surveyList", surveyList);
			}else {
				mv.addObject("surveyList", null);
			}
			mv.setViewName("taste/tasteSurvey");
		}catch(Exception e) {
			mv.addObject("msg", "설문 화면 로드 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/** 별점 등록 */
	@ResponseBody
	@RequestMapping(value="insertRating.do", method=RequestMethod.GET)
	public String insertRating(HttpSession session,
			@RequestParam("bookNo") int bookNo, @RequestParam("bookName") String bookName,
			@RequestParam("bookRating") double bookRating, @RequestParam("bookSubject") String bookSubject, @RequestParam("theme") String theme) {
		String userId = (String)session.getAttribute("userId");
		
		TasteSurvey survey = new TasteSurvey();
		survey.setUserId(userId);
		survey.setBookNo(bookNo);
		survey.setBookName(bookName);
		survey.setBookRating(bookRating);
		survey.setBookSubject(bookSubject);
		survey.setTheme(theme);
		
		int result = service.insertRating(survey);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	/** 설문 초기화 */
	@RequestMapping(value="cancelSurvey.do", method=RequestMethod.GET)
	public String deleteRating(HttpSession session, Model model, HttpServletResponse response) {
		String userId = (String)session.getAttribute("userId");
		int result = service.deleteRating(userId);
		try {
			if(result>0) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('설문이 초기화 되었습니다.');</script>");
				out.flush();
				return "taste/beforeTasteSurvey";
			}else {
				model.addAttribute("msg", "설문 초기화 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";			
		}
	}
	
	/** 취향 분석 설문 등록 및 분석 */
	@RequestMapping(value="submitSurvey.do", method=RequestMethod.GET)
	public String submitSurvey(HttpSession session, Model model, HttpServletResponse response, @ModelAttribute Taste taste) {
		String userId = (String)session.getAttribute("userId");
		String surveyCheck = (String)session.getAttribute("surveyCheck");
		int result = service.updateSurveyCheck(userId);
		try {
			if(result>0) {
				session.setAttribute("userId", userId);
				session.setAttribute("surveyCheck", surveyCheck);
				taste.setUserId(userId);
				insertTaste(taste);
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('설문이 완료되었습니다.');</script>");
				out.flush();
				return "taste/afterTasteSurvey";
			}else {
				model.addAttribute("msg", "설문 등록 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";			
		}
	}
	
	
	//취향  등록
	public void insertTaste(@ModelAttribute Taste taste) {
		int result = service.registerTaste(taste);
	}

	

}
