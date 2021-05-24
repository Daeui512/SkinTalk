package web.spring.skintalk.persistence;

import web.spring.skintalk.domain.ProductLikeVO;

public interface ProductLikeDAO {
	// 좋아요 번호 등록
	int insert(ProductLikeVO vo);
	
	// 좋아요 삭제
	int delete(String userId, int productNo);
	
	int productLikeEq(String userId, int productNo);

}
