package com.daol.library.member.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daol.library.member.domain.Member;

public interface MemberService {
	// 회원가입
	public int registerMember(Member member);

	// 로그인
	public Member loginMember(Member memberOne);

	// 아이디찾기
	public Member printOne(Member member);

	// 특정 회원 정보 변경
	public int modifyOne(String userId) throws Exception;

	// 이메일발송
	public void sendEmail(Member vo, String div) throws Exception;

	// 비밀번호찾기
	public void findPw(HttpServletResponse resp, Member vo) throws Exception;

	// 아이디중복체크(일반)
	public int checkIdDup(String userId);

	// 메일발송(일반)
	public void mailSend(HttpSession session, String userEmail);

	// 메일발송(학생)
	public boolean emailCertification(HttpSession session, String userEmail, int parseInt);

	// 소셜 로그인
	public Member kakaoMember(String kakaoId);

	// 아이디중복체크(학생)
	public int idCheck(String userId);
	
	// 회원가입(학생)
	public int registerStudent(Member member);

}
