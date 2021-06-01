package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.CartVO;

public interface CartDAO {
	public abstract List<CartVO> cartMoney();
	public abstract int insert(CartVO vo); 							//장바구니 추가
	public abstract List<CartVO> listCart(String userId);		 	//장바구니 목록
	public abstract List<CartVO> nonMemberListCart(String nonMemberUserId);	//비회원 장바구니
	public abstract int delete(int cartNo); 						//장바구니 개별 삭제
	public abstract int deleteAll(String userId); 					//장바구니 비우기
	public abstract int sumMoney(String userId); 					//장바구니 금액 합계
	public abstract int countCart(String userId);				 	//장바구니 상품 갯수
	public abstract int countCartOne(int cartNo);
	public abstract int updateAllCart(CartVO vo);					// 한번에 장바구니 갯수 변경
	public abstract int updateIncreaseCart(CartVO vo); 				//장바구니 품목 한개 UP
	public abstract int updateDecreaseCart(CartVO vo);				//장바구니 품목 한개 DOWN
	public abstract int countCart(String userId, int productNo);
	public abstract void updateCart(CartVO vo);
}
