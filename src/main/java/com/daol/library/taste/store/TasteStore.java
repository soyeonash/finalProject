package com.daol.library.taste.store;

import java.util.List;

import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;

public interface TasteStore {
	//설문화면
	public List<Book> selectAllSurveyList();
	//별점 등록
	public int insertRating(TasteSurvey survey);
	//설문초기화
	public int deleteRating(String userId);
	//설문 등록(서베이체크 상태 변경)
	public int updateSurveyCheck(String userId);
	//취향 리스트 1,2,3
	public int insertTaste(Taste taste);
	
	//취향 불러오기
	public Taste selectMyTaste(String userId);
	//취향별 도서 추천, 도서에 등록된 취향 조건으로 리스트 출력 
	public List<Book> selectTaste1List(String taste1);
	public List<Book> selectTaste2List(String taste2);
	public List<Book> selectTaste3List(String taste3);
	
	//전공별 도서 추천, 멤버에 등록된 전공으로 책 추천
	public List<Book> selectBooksByMajor(String majorKeyword);

	
	
	
	
	
}
