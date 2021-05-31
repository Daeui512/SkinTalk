package web.spring.skintalk.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.ProductLikeVO;

@Repository
public class ProductLikeDAOImple implements ProductLikeDAO{
	private static final Logger logger = LoggerFactory.getLogger(ProductLikeDAOImple.class);
	private static final String NAMESPACE ="web.spring.skintalk.ProductLikeMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(ProductLikeVO vo) {
		logger.info("insert() 호출 : " + vo.toString());
		return sqlSession.insert(NAMESPACE +".insertProductLike", vo);
	} // end insert

	@Override
	public int delete(String userId, int productNo) {
		logger.info("delete() 호출 : userId " + userId + " productNo " +productNo); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("productNo", productNo);
		logger.info(" " + map);
		return sqlSession.delete(NAMESPACE + ".deleteProductLike", map);
	} // end delete()

	@Override
	public int productLikeEq(String userId, int productNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("productNo", productNo);
		logger.info(" " + map);
		return sqlSession.selectOne(NAMESPACE + ".ProductLikeEq", map);
	}




	
	

}
