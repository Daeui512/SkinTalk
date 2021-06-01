package web.spring.skintalk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.CartVO;
import web.spring.skintalk.persistence.CartDAO;

@Service
public class CartServiceImple implements CartService{
	
	private static final Logger logger = LoggerFactory.getLogger(CartServiceImple.class);
	
	@Autowired
	private CartDAO dao;
	
	@Override
	public List<CartVO> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(CartVO vo) {
		logger.info("insert() : vo : " + vo.toString());
		return dao.insert(vo);
	}

	@Override
	public List<CartVO> listCart(String userId) {
		logger.info("listCart() : userId : " + userId);
		return dao.listCart(userId);
	}
	
	@Override
	public List<CartVO> nonMemberListCart(String nonMemberUserId){
		logger.info("nonMemberListCart : userId : " + nonMemberUserId);;
		return dao.nonMemberListCart(nonMemberUserId);
	}

	@Override
	public int deleteOne(int cartNo) {
		logger.info("deleteOne() 호출 : cartNo" + cartNo);
		return dao.delete(cartNo);
	}

	@Override
	public int deleteAll(String userId) {
		logger.info("deleteAll() 호출 : userId = " + userId);
		return dao.deleteAll(userId);
	}

	@Override
	public int update(int cartNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sumMoney(String userId) {
		logger.info("sumMoney() 호출 : userId = " + userId);
		return dao.sumMoney(userId);
	}

	@Override
	public int countCart(String userId) {
		logger.info("countCart() 호출 : userId = " + userId);
		return dao.countCart(userId);
	}
	
	@Override
	public int countCartOne(int cartNo) {
		logger.info("countCartOne()");
		return dao.countCartOne(cartNo);
	}
	
	@Override
	public int updateAllCart(CartVO vo) {
		logger.info("updateAllCart() 호출");
		return dao.updateAllCart(vo);
	}

	@Override
	public int updateIncreaseCart(CartVO vo) {
		logger.info("updateIncreaseCart() 호출 : vo" + vo.toString());
		return dao.updateIncreaseCart(vo);
	}
	
	@Override
	public int updateDecreaseCart(CartVO vo) {
		logger.info("updateDecreaseCart() 호출 : " + vo.toString());
		return dao.updateDecreaseCart(vo);
	}

	@Override
	public void modifyCart(CartVO vo) {
		// TODO Auto-generated method stub
	}
	
	@Override
    public int countCart(String userId, int productNo) {
        logger.info("countCart호출 ");
        return dao.countCart(userId, productNo);
    }
	
	// 장바구니 해당 상품이 있을때 장바구니에 다시 입력할시 상품 수량 변경
    @Override
    public void updateCart(CartVO vo) {
        dao.updateCart(vo);;      
    }

	

	
}
