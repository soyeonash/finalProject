package com.daol.library.taste.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;
import com.daol.library.taste.service.TasteService;
import com.daol.library.taste.store.TasteStore;

@Service
public class TasteServiceImpl implements TasteService{

	@Autowired
	private TasteStore store;
	
	/** 설문 화면 */
	@Override
	public List<Book> printSurveyList() {
		List<Book> surveyList = store.selectAllSurveyList();
		return surveyList;
	}
	
	/** 별점 등록 */
	@Override
	public int insertRating(TasteSurvey survey) {
		int result = store.insertRating(survey);
		return result;
	}
	
	/** 설문초기화 : 별점 삭제 */
	@Override
	public int deleteRating(String userId) {
		int result = store.deleteRating(userId);
		return result;
	}
	
	/** 설문 등록 : 서베이 체크 상태 변경 */
	@Override
	public int updateSurveyCheck(String userId) {
		int result = store.updateSurveyCheck(userId);
		return result;
	}
	


	@Override
	public int registerTaste(Taste taste) {
		int result = store.insertTaste(taste);
		return result;
	}

	
	/** 나의 취향 불러오기 */
	@Override
	public Taste selectMyTaste(String userId) {
		Taste taste = store.selectMyTaste(userId);
		return taste;
	}
	
	/** 취향별 도서 추천 */
	@Override
	public List<Book> printTaste1List(String taste1) {
		List<Book> taste1List = store.selectTaste1List(taste1);
		return taste1List;
	}

	@Override
	public List<Book> printTaste2List(String taste2) {
		List<Book> taste2List = store.selectTaste2List(taste2);
		return taste2List;
	}

	@Override
	public List<Book> printTaste3List(String taste3) {
		List<Book> taste3List = store.selectTaste3List(taste3);
		return taste3List;
	}

	
	/** 전공별 도서 추천 */
	@Override
	public List<Book> printBooksByMajor(String major) {
		List<Book> mList = store.selectBooksByMajor(major);
		return mList;
	}













}
