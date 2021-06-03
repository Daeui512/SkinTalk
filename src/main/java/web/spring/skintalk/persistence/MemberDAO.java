package web.spring.skintalk.persistence;

import web.spring.skintalk.domain.MemberVO;

public interface MemberDAO {
	public abstract int insert(MemberVO vo);
	public abstract MemberVO select(String userid);
	public abstract int update(MemberVO vo);
	public abstract int delete(String userid);
	public abstract MemberVO select(String userid, String password);
	public abstract int userIdChk(String userId);
	public abstract int nickNameChk(String nickName);
	public abstract int emailChk(String email);
	public abstract int phoneChk(String phone);
	public abstract String findId(String email, String phone);
	public abstract int findPassword(MemberVO vo);
}
