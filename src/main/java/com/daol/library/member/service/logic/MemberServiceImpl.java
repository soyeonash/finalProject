package com.daol.library.member.service.logic;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.member.domain.Member;
import com.daol.library.member.service.MemberService;
import com.daol.library.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberStore store;

	@Override
	public int registerMember(Member member) {
		int result = store.insertMember(member);
		return result;
	}

	@Override
	public Member loginMember(Member memberOne) {
		Member mOne = store.selectMember(memberOne);
		return mOne;
	}

	@Override
	public Member printOne(Member member) {
		Member mOne = store.selectId(member);
		return mOne;
	}

	@Override
	public void sendEmail(Member vo, String div) throws Exception {
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		// 이메일 객체생성하기
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "daolLibrary1@gmail.com");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.put("mail.smtp.socketFactory.fallback", "false");
		final String username = "daolLibrary1@gmail.com";//
		final String password = "daol1234";

		try {
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			// 메세지 설정
			Message msg = new MimeMessage(session);

			// 보내는사람 받는사람 설정
			msg.setFrom(new InternetAddress("seokin6961@gmail.com"));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(vo.getUserEmail(), false));
			msg.setSubject("규장각 임시 비밀번호입니다!");
			msg.setText("\n임시 비밀번호 : " + vo.getUserPwd() + "입니다");
			msg.setSentDate(new Date());
			Transport.send(msg);
			System.out.println("발신성공!");

		} catch (MessagingException error) {
			System.out.println("에러가 발생했습니다: " + error);
		}
	}

	@Override
	public void findPw(HttpServletResponse resp, Member vo) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		Member ck = store.readMember(vo.getUserId());
		PrintWriter out = resp.getWriter();
		// 가입된 아이디가 없으면
		if (store.idCheck(vo.getUserId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!vo.getUserEmail().equals(ck.getUserEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserPwd(pw);
			// 비밀번호 변경
			store.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}

	}

	@Override
	public int checkIdDup(String userId) {
		int result = store.checkIdDup(userId);
		return result;
	}

	@Override
	public void mailSend(HttpSession session, String userEmail) {
		int result = (int) (Math.random() * (99999 - 10000 + 1)) + 10000;
		session.setAttribute(userEmail, result);

		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		// 이메일 객체생성하기
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "daolLibrary1@gmail.com");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.put("mail.smtp.socketFactory.fallback", "false");
		final String username = "daolLibrary1@gmail.com";//
		final String password = "daol1234";

		try {
			Session sessions = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			// 메세지 설정
			Message msg = new MimeMessage(sessions);

			// 보내는사람 받는사람 설정
			msg.setFrom(new InternetAddress("seokin6961@gmail.com"));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail, false));
			msg.setSubject("규장각 인증번호입니다!");
			msg.setText("\n인증번호 : " + result + "입니다");
			msg.setSentDate(new Date());
			Transport.send(msg);
			System.out.println("발신성공!");

		} catch (MessagingException error) {
			System.out.println("에러가 발생했습니다: " + error);
		}
	}

	@Override
	public boolean emailCertification(HttpSession session, String userEmail, int parseInt) {

		try {
			int generationCode = (Integer) session.getAttribute(userEmail);

			if (generationCode == parseInt) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {

		}
		return true;
	}

//	대출 회원 수정
	@Override
	public int modifyOne(String userId) throws Exception {
		int result = store.updateOne(userId);
		if (result == 0)
			throw new Exception();
		return result;
	}

	@Override
	public Member kakaoMember(String kakaoId) {
		Member mUser = store.selectkakao(kakaoId);
		return mUser;
	}

	@Override
	public int idCheck(String userId) {
		int result = store.selectIdCheck(userId);
		return result;
	}

	@Override
	public int registerStudent(Member member) {
		int result = store.insertStudent(member);
		return result;
	}
}
