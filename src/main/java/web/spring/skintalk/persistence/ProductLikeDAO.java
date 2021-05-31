package web.spring.skintalk.persistence;

import web.spring.skintalk.domain.ProductLikeVO;

public interface ProductLikeDAO {
	public abstract int insert(ProductLikeVO vo);
	public abstract int delete(String userId, int productNo);
	public abstract int productLikeEq(String userId, int productNo);

}
