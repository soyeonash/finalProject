package com.daol.library.lendingBook.store.logic;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.lendingBook.domain.LendingBook;
import com.daol.library.lendingBook.domain.Parcel;
import com.daol.library.lendingBook.store.LendingBookStore;

@Repository
public class LendingBookStoreLogic implements LendingBookStore {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<LendingBook> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LendingBook selectOne(int lendingNo) {
		LendingBook lendingBook = sqlSession.selectOne("lendingBookMapper.selectOne", lendingNo);
		return lendingBook;
	}

	@Override
	public LendingBook selectOneForDetail(int lendingNo) {
		LendingBook lendingBook = sqlSession.selectOne("lendingBookMapper.selectOneForDetail", lendingNo);
		return lendingBook;
	}
	
	@Override
	public int insertLending(LendingBook lendingBook) {
		int result = sqlSession.insert("lendingBookMapper.insertLending", lendingBook);
		return result;
	}

	@Override
	public int deleteLending(HashMap<String, String> deleteLending) {
		int result = sqlSession.delete("lendingBookMapper.deleteLending", deleteLending);
		return result;
	}

	@Override
	public int updateLending(LendingBook lendingBook) {
		return 0;
	}

	@Override
	public int insertParcel(Parcel parcel) {
		int result = sqlSession.insert("lendingBookMapper.insertParcel", parcel);
		return result;
	}

	@Override
	public int insertLendingParcel(LendingBook lendingBook) {
		int result = sqlSession.insert("lendingBookMapper.insertLending", lendingBook);
		return result;
	}
	//다독자리스트
	@Override
	public List<LendingBook> selectManyPeople() {
		return sqlSession.selectList("lendingBookMapper.selectManyList");
	}

}
