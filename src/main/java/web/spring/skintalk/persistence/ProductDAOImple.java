package web.spring.skintalk.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public int getTotalNumsByKeyword(String keyword) {
		logger.info("getTotalNumsByKeyword() 호출");
		return sqlSession.selectOne(NAMESPACE + ".select_TotalNums_by_keyword", keyword);
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
	
	@Override
	public List<ProductVO> selectAllByKeyword(String keyword, PageCriteria criteria){
		logger.info("selectAllByKeyword() 호출 : keyword = " + keyword);
		keyword = "%" + keyword + "%";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("start", criteria.getStart());
		map.put("end", criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".select_all_by_keyword" , map);
	}
		
	

}
