package web.spring.skintalk.persistence;

import web.spring.skintalk.domain.MemberVO;

public interface MemberDAO {
	// 회원 가입 처리
	public abstract int insert(MemberVO vo);
	
	// 회원 정보 조회
	public abstract MemberVO select(String userid);
	
	// 회원 정보 수정
	public abstract int update(MemberVO vo);
	
	// 회원 탈퇴
	public abstract int delete(String userid);
	
	// 로그인 처리
	public abstract MemberVO select(String userid, String password);
	
	// 아이디 중복확인
	public abstract int userIdChk(String userId);
	
	// 이메일 중복확인
	public abstract int emailChk(String email);
	
	// 핸드폰 중복확인
	public abstract int phoneChk(String phone);
	
	// 아이디 찾기
	public abstract String findId(String email, String phone);
	
	// 비밀번호 찾기
	public abstract int findPassword(MemberVO vo);
}
