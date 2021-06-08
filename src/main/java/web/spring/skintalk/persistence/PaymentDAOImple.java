package web.spring.skintalk.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.NonMemberVO;
import web.spring.skintalk.domain.PaymentVO;

@Repository
public class PaymentDAOImple implements PaymentDAO{
	private static final Logger logger = LoggerFactory.getLogger(PaymentDAOImple.class);
	private static final String NAMESPACE = "web.spring.skintalk.PaymentMapper";

	@Autowired
	private SqlSession sqlSession;

	
	// 멤버 결제정보 insert
	@Override
	public int insert(PaymentVO vo) {
		logger.info("insert() 호출 : " + vo);
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}


	@Override
	public List<PaymentVO> listPayment(String userId) {
		logger.info("listPayment() 호출" + userId);
		return sqlSession.selectList(NAMESPACE + ".selectAll", userId);
	}


}
