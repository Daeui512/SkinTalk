package web.spring.skintalk.service;

import web.spring.skintalk.domain.ProductLikeVO;

public interface ProductLikeService {
	public abstract int create(ProductLikeVO vo);
	public abstract int delete(String userId, int productNo);
	public abstract int productLikeEq(String userId, int productNo);
	
}
