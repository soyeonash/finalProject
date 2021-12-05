package com.daol.library.interestingBook.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.interestingBook.domain.InterestingBook;
import com.daol.library.interestingBook.store.InterestingBookStore;

@Repository
public class InterestingBookStoreLogic implements InterestingBookStore {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<InterestingBook> selectAllIntBook(String userId) {
		List<InterestingBook> iList = sqlSession.selectList("intBookMapper.selectAllIntBook", userId);
		return iList;
	}

	@Override
	public int insertInteresting(InterestingBook intBook) {
		int result = sqlSession.insert("intBookMapper.insertInteresting", intBook);
		return result;
	}

	@Override
	public int deleteInteresting(InterestingBook intBook) {
		int result = sqlSession.delete("intBookMapper.deleteInteresting", intBook);
		return result;
	}

	@Override
	public List<InterestingBook> selectAddCheck(InterestingBook intBook) {
		List<InterestingBook> iList = sqlSession.selectList("intBookMapper.addCheck", intBook);
		return iList;
	}

}
