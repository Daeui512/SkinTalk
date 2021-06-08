package web.spring.skintalk.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.NonMemberVO;
import web.spring.skintalk.persistence.NonMemberDAO;

@Service
public class NonMemberServiceImple implements NonMemberService{
	private static final Logger logger = LoggerFactory.getLogger(NonMemberServiceImple.class);

	@Autowired
	private NonMemberDAO dao;

	@Override
	public int create(NonMemberVO vo) {
		logger.info("create: " + vo);
		return dao.insert(vo);
	}
	
	@Override
	public int readCount(String userId) {
		logger.info("readCount() 호출 : " + userId);
		return dao.selectCount(userId);
	}
	
	
	@Override
	public NonMemberVO readAll(String userId) {
		logger.info("readAll() 호출 : " + userId);
		return dao.selectAll(userId);
	}
	
}
