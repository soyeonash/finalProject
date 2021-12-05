package com.daol.library.taste.store.logic;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;
import com.daol.library.taste.store.TasteStore;

@Repository
public class TasteStoreLogic implements TasteStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 설문화면 */
	@Override
	public List<Book> selectAllSurveyList() {
		List<Book> surveyList = sqlSession.selectList("tasteMapper.selectSurveyList");
		return surveyList;
	}
	
	/** 별점 등록  */
	@Override
	public int insertRating(TasteSurvey survey) {
		int result = sqlSession.insert("tasteMapper.insertRating", survey);
		return result;
	}
	
	/** 설문초기화 : 별점 삭제  */
	@Override
	public int deleteRating(String userId) {
		int result = sqlSession.delete("tasteMapper.deleteRating", userId);
		return result;
	}

	/** 설문등록 : 서베이체크상태 변경  */
	@Override
	public int updateSurveyCheck(String userId) {
		int result = sqlSession.update("tasteMapper.updateSurveyCheck", userId);
		return result;
	}
	
	/** 취향 불러오기  */
	@Override
	public Taste selectMyTaste(String userId) {
		Taste taste = sqlSession.selectOne("tasteMapper.selectMyTaste",userId);
		return taste;
	}
	

	@Override
	public int insertTaste(Taste taste) {
		int result = sqlSession.insert("tasteMapper.insertTaste", taste);
		return result;
	}

	/** 취향별 도서 추천*/
	@Override
	public List<Book> selectTaste1List(String taste1) {
		List<Book> taste1List = sqlSession.selectList("tasteMapper.selectTaste1", taste1);
		return taste1List;
	}

	@Override
	public List<Book> selectTaste2List(String taste2) {
		List<Book> taste2List = sqlSession.selectList("tasteMapper.selectTaste2", taste2);
		return taste2List;
	}

	@Override
	public List<Book> selectTaste3List(String taste3) {
		List<Book> taste3List = sqlSession.selectList("tasteMapper.selectTaste3", taste3);
		return taste3List;
	}

	
	/** 전공별 도서 추천*/
	@Override
	public List<Book> selectBooksByMajor(String majorKeyword) {
		HashMap<String, String> mMap = new HashMap<String, String>();
		mMap.put("major", majorKeyword);
		List<Book> mList = sqlSession.selectList("tasteMapper.selectMajorBookList", mMap);
		return mList;
	}












}
