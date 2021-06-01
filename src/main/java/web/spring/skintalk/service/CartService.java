package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.CartVO;

public interface CartService {
	public abstract List<CartVO> cartMoney();
	public abstract int insert(CartVO vo);
	public abstract List<CartVO> listCart(String userId);
	public abstract List<CartVO> nonMemberListCart(String nonMemberUserId);
	public abstract int deleteOne(int cartNo);
	public abstract int deleteAll(String userId);
	public abstract int update(int cartNo);
	public abstract int sumMoney(String userId);
	public abstract int countCart(String userId);
	public abstract int countCartOne(int cartNo);
	public abstract int updateAllCart(CartVO vo);
	public abstract int updateIncreaseCart(CartVO vo);
	public abstract int updateDecreaseCart(CartVO vo);
	public abstract void modifyCart(CartVO vo);
	public abstract int countCart(String userId, int productNo);
    public abstract void updateCart(CartVO vo);
}
