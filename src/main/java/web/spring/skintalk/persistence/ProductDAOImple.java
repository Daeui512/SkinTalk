package web.spring.skintalk.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.util.PageCriteria;

@Repository
public class ProductDAOImple implements ProductDAO{
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImple.class);
	private static final String NAMESPACE = "web.spring.skintalk.ProductMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int insert(ProductVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<ProductVO> select() {
		logger.info("select() 호출");
		return sqlSession.selectList(NAMESPACE+".select_all");
	}

	@Override
	public List<ProductVO> select(PageCriteria c) {
		logger.info("select() 호출 : pageCriteria = " + c);
		logger.info("start" + c.getStart());
		return sqlSession.selectList(NAMESPACE + ".select_pageCriteria", c);
	}

	@Override
	public int update(ProductVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalNums() {
		logger.info("getTotalNums()");
		return sqlSession.selectOne(NAMESPACE + ".select_TotalNums");
	}
	
	// 상세 조회
	@Override
	public ProductVO select(int productNo) {
		logger.info("select_by_productNo() 호출" + productNo);
		return sqlSession.selectOne(NAMESPACE + ".select_by_productNo", productNo);
	} // end select()

	@Override
	public List<String> selectByKeyword(String keyword) {
		logger.info("selectByKeyword() 호출 " + keyword);
		keyword = keyword + "%";
		return sqlSession.selectList(NAMESPACE + ".select_by_keyword", keyword);
	}

}