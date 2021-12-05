package com.daol.library.taste.service;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;

public interface TasteService {
	//설문화면
	public List<Book> printSurveyList();
	//별점 등록
	public int insertRating(TasteSurvey survey);
	//설문초기화(인서트한 별점 삭제)
	public int deleteRating(String userId);
	//설문등록(surveyCheck상태 변경)
	public int updateSurveyCheck(String userId);
	//취향 리스트 1,2,3
	public int registerTaste(Taste taste);
	
	//나의 취향 불러오기
	public Taste selectMyTaste(String userId);
	
	//취향별 도서 추천, 도서에 등록된 취향 조건으로 리스트 출력 
	public List<Book> printTaste1List(String taste1);
	public List<Book> printTaste2List(String taste2);
	public List<Book> printTaste3List(String taste3);
	
	
	//전공별 도서 추천, 멤버에 등록된 전공으로 책 추천
	public List<Book> printBooksByMajor(String major);

	
	
	
	

	
}
