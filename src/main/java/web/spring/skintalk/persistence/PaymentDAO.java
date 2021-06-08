package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.PaymentVO;

public interface PaymentDAO {

	int insert(PaymentVO vo); 
	List<PaymentVO> listPayment(String userId);
	
}
