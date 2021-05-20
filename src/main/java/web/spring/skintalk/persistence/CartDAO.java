package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.CartVO;

public interface CartDAO {
	List<CartVO> cartMoney();
    int insert(CartVO vo); 							//장바구니 추가
    List<CartVO> listCart(String userId);		 	//장바구니 목록
    List<CartVO> nonMemberListCart(String nonMemberUserId);	//비회원 장바구니
    int delete(int cartNo); 						//장바구니 개별 삭제
    int deleteAll(String userId); 					//장바구니 비우기
    int sumMoney(String userId); 					//장바구니 금액 합계
    int countCart(String userId);				 	//장바구니 상품 갯수
    int updateIncreaseCart(CartVO vo); 				//장바구니 품목 한개 UP
    int updateDecreaseCart(CartVO vo);				//장바구니 품목 한개 DOWN
    int countCart(String userId, int productNo);
    void updateCart(CartVO vo);
}
