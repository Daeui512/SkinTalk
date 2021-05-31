package web.spring.skintalk.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.ProductLikeVO;
import web.spring.skintalk.persistence.ProductLikeDAO;

@Service
public class ProductLikeServiceImple implements ProductLikeService{
	private static final Logger logger = 
			LoggerFactory.getLogger(ProductLikeServiceImple.class);
	
	@Autowired
	private ProductLikeDAO dao;

	@Override
	public int create(ProductLikeVO vo) {
		logger.info("create() 호출 : " + vo.toString());
		return dao.insert(vo);
	}

	@Override
	public int delete(String userId, int productNo) {
		logger.info("delete() 호출 : userId " + userId + ", productNo : " + productNo );
		return dao.delete(userId, productNo);
	}

	@Override
	public int productLikeEq(String userId, int productNo) {
		logger.info("productLikeEq() 호출 : userId " + userId + ", productNo : " + productNo );
		return dao.productLikeEq(userId, productNo);
	}
	
}
