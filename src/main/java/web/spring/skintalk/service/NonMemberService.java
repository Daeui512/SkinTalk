package web.spring.skintalk.service;

import web.spring.skintalk.domain.NonMemberVO;

public interface NonMemberService {
	int create(NonMemberVO vo);
	
	int readCount(String userId);
	
	NonMemberVO readAll(String userId);


}
