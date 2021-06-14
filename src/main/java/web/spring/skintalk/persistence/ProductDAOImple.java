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
		keyword = "%" + keyword + "%";
		return sqlSession.selectOne(NAMESPACE + ".select_TotalNums_by_keyword", keyword);
	}
	
	@Override
	public int getTotalNumsByTypical(int productType) {
		logger.info("getTotalNumsByTypical() 호출 : productType = " + productType);
		return sqlSession.selectOne(NAMESPACE + ".select_TotalNums_by_typical", productType);
	}
	
	@Override
	public ProductVO select(int productNo) {
		logger.info("select_by_productNo() 호출" + productNo);
		return sqlSession.selectOne(NAMESPACE + ".select_by_productNo", productNo);
	}

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

	@Override
	public List<ProductVO> selectByTypical(PageCriteria criteria, int productType) {
		logger.info("selectByTypical() 호출 : productType = " + productType);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productType", productType);
		map.put("start", criteria.getStart());
		map.put("end", criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".select_by_typical", map);
	}
	
	@Override
	public int viewCount(int productNo) {
		logger.info("viewCount() 호출 : " + productNo);
		return sqlSession.update(NAMESPACE + ".viewCountUpdate", productNo);
	}

	@Override
	public List<ProductVO> selectByRank(PageCriteria criteria) {
		logger.info("selectByRank() 호출");
		return sqlSession.selectList(NAMESPACE + ".select_by_rank", criteria);
	}

	@Override
	public List<ProductVO> selectRecommand(String feature, PageCriteria criteria) {
		logger.info("selectRecommand() 호출");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("feature", "%" + feature + "%");
		map.put("start", criteria.getStart());
		map.put("end", criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".select_recommand", map);
	}
	
	@Override
	public List<ProductVO> selectByUserIdAndProductLike(String userId) {
		logger.info("selectByUserIdAndProductLike() 호출" + userId);
		return sqlSession.selectList(NAMESPACE + ".select_by_userId_and_productLike", userId);
	}

}
