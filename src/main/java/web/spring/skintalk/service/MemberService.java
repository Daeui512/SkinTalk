package web.spring.skintalk.service;

import web.spring.skintalk.domain.MemberVO;

public interface MemberService {
	public abstract int create(MemberVO vo);
	public abstract MemberVO read(String userid);
	public abstract int update(MemberVO vo);
	public abstract int delete(String userid);
	public abstract MemberVO login(String userid, String password);
	public abstract int userIdChk(String userId);
	public abstract int emailChk(String email);
	public abstract int phoneChk(String phone);
	public abstract String findId(String email, String phone);
	public abstract int findPassword(MemberVO vo);
	public abstract void sendEmail(MemberVO vo, String div);
	public abstract int nickNameChk(String nickName);
}
