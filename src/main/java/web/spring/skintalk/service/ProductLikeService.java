package web.spring.skintalk.service;

import web.spring.skintalk.domain.ProductLikeVO;

public interface ProductLikeService {

	int create(ProductLikeVO vo);
	
	int delete(String userId, int productNo);
	
	int productLikeEq(String userId, int productNo);
	
}
