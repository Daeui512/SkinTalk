package web.spring.skintalk.service;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.MemberVO;
import web.spring.skintalk.persistence.MemberDAO;

@Service
public class MemberServiceImple implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImple.class);
	
	@Autowired
	private MemberDAO dao;
	
	// 회원 가입 처리
	@Override
	public int create(MemberVO vo) {
		logger.info("create() 호출 : vo = " + vo.toString());
		return dao.insert(vo);
	}

	// 회원 정보 조회
	@Override
	public MemberVO read(String userid) {
		logger.info("read() 호출 : userid = " + userid);
		return dao.select(userid);
	}
	
	// 회원 정보 수정
	@Override
	public int update(MemberVO vo) {
		logger.info("update() 호출 : vo = " + vo.toString());
		return dao.update(vo);
	}

	// 회원 탈퇴
	@Override
	public int delete(String userid) {
		logger.info("delete() 호출 : userid = " + userid);
		return dao.delete(userid);
	}

	// 로그인 처리
	@Override
	public MemberVO login(String userId, String password) {
		logger.info("login() 호출 : userid = " + userId + " password : " + password);
		return dao.select(userId, password);
	}

	// 아이디 중복확인
	@Override
	public int userIdChk(String userId) {
		logger.info("userIdChk() 호출 : userId = " + userId);
		return dao.userIdChk(userId);
	}
	
	// 이메일 중복확인
	@Override
	public int emailChk(String email) {
		logger.info("emailChk() 호출 : email = " + email);
		return dao.emailChk(email);
	}

	// 핸드폰 중복확인
	@Override
	public int phoneChk(String phone) {
		logger.info("phoneChk() 호출 : phone = " + phone);
		return dao.phoneChk(phone);
	}

	@Override
	public String findId(String email, String phone) {
		logger.info("findId() : email = " + email + " phone : " + phone );
		return dao.findId(email, phone);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPassword(MemberVO vo) {
		logger.info("findPassword() 호출 : vo = " + vo);
		return dao.findPassword(vo);
	}

	// 이메일 발송
	public void sendEmail(MemberVO vo, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "juliet61008@gmail.com"; // 보내는 사람 구글 이메일 작성 ex) "test@gmail.com";
		String hostSMTPpwd = "rain1004"; // 보내는 사람 구글 비밀번호 작성 ex ) "1234";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "juliet61008@gmail.com"; // 보내는 사람 구글 이메일 작성 ex) "test@test.com";
		String fromName = "SkinTalk";
		String subject = "";
		String msg = "";

		if(div.equals("findPassword")) {
			subject = "SkinTalk 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	} // end of sendEmail()
	
	@Override
	public int nickNameChk(String nickName) {
		logger.info("nickNameChk() 호출 : nickName = " + nickName);
		return dao.nickNameChk(nickName);
	}

} // end of class