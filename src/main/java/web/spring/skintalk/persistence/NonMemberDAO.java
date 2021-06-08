package web.spring.skintalk.persistence;

import web.spring.skintalk.domain.NonMemberVO;

public interface NonMemberDAO {
	
	int insert(NonMemberVO vo);

	int selectCount(String userId);
	
	NonMemberVO selectAll(String userId);
}
