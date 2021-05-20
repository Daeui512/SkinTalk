package web.spring.skintalk.service;

import web.spring.skintalk.domain.MemberVO;

public interface MemberService {
	// 회원 가입 처리
	public abstract int create(MemberVO vo);
	
	// 회원 정보 조회
	public abstract MemberVO read(String userid);

	// 회원 정보 수정
	public abstract int update(MemberVO vo);
	
	// 회원 탈퇴
	public abstract int delete(String userid);
	
	// 로그인 처리
	public abstract MemberVO login(String userid, String password);
	
	// 아이디 중복확인
	public abstract int userIdChk(String userId);
	
	// 이메일 중복확인
	public abstract int emailChk(String email);
	
	// 핸드폰 중복확인
	public abstract int phoneChk(String phone);
	
	public abstract String findId(String email, String phone);
	
	// 비밀번호 찾기
	public abstract int findPassword(MemberVO vo);
	
	// 이메일 발송
	public abstract void sendEmail(MemberVO vo, String div);
	
}
