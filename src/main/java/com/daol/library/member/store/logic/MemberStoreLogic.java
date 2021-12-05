package com.daol.library.member.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.member.domain.Member;
import com.daol.library.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		int result = sqlSession.insert("membermapper.insertMember",member);
		return result;
	}

	@Override
	public Member selectMember(Member memberOne) {
		Member mOne = sqlSession.selectOne("membermapper.selectLoginMember", memberOne);
		return mOne;
	}

	@Override
	public Member selectId(Member member) {
		Member mOne = sqlSession.selectOne("membermapper.selectMemberId", member);
		return mOne;
	}

	@Override
	public Member readMember(String userId) {
		Member ck = sqlSession.selectOne("membermapper.selectMember", userId);
		return ck;
	}

	@Override
	public Object idCheck(String userId) {
		Object obj = sqlSession.selectOne("membermapper.selectOne", userId);
		return obj;
	}

	@Override
	public int updatePw(Member vo) throws Exception {
		return sqlSession.update("membermapper.updatePw", vo);
	}

	@Override
	public int checkIdDup(String userId) {
		int result = sqlSession.selectOne("membermapper.checkIdDup", userId);
		return result;
	}

	@Override
	public int updateOne(String userId) {
		int result = sqlSession.update("membermapper.updateLendingMember", userId);
		return result;
	}

	@Override
	public Member selectkakao(String kakaoId) {
		Member mUser = sqlSession.selectOne("membermapper.selectkakaoMember", kakaoId);
		return mUser;
	}

	@Override
	public int selectIdCheck(String userId) {
		int result = sqlSession.selectOne("membermapper.selectkakaoId", userId);
		return result;
	}

	@Override
	public int insertStudent(Member member) {
		int result = sqlSession.insert("membermapper.insertStudent",member);
		return result;
	}
}
