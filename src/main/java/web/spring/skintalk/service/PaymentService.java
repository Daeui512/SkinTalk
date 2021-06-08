package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.PaymentVO;

public interface PaymentService {

	int create(PaymentVO vo);
	
	List<PaymentVO> read(String userId);
	
	
}
