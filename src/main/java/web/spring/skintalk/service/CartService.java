package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.CartVO;

public interface CartService {
	List<CartVO> cartMoney();
    int insert(CartVO vo);
    List<CartVO> listCart(String userId);
    List<CartVO> nonMemberListCart(String nonMemberUserId);
    int deleteOne(int cartNo);
    int deleteAll(String userId);
    int update(int cartNo);
    int sumMoney(String userId);
    int countCart(String userId);
    int updateIncreaseCart(CartVO vo);
    int updateDecreaseCart(CartVO vo);
    void modifyCart(CartVO vo);
    int countCart(String userId, int productNo);
    void updateCart(CartVO vo);
}
