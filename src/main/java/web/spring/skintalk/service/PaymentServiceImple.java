package web.spring.skintalk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.NonMemberVO;
import web.spring.skintalk.domain.PaymentVO;
import web.spring.skintalk.persistence.PaymentDAO;

@Service
public class PaymentServiceImple implements PaymentService{
	private static final Logger logger = LoggerFactory.getLogger(PaymentServiceImple.class);
	
	@Autowired
	private PaymentDAO dao;
	
	
	// 멤버 결제정보 CREATE
	@Override
	public int create(PaymentVO vo) {
		logger.info("create() 호출 : " + vo);
		return dao.insert(vo);
	}


	@Override
	public List<PaymentVO> read(String userId) {
		logger.info("read() 호출 : " + userId);
		return dao.listPayment(userId);
	}
	
}
