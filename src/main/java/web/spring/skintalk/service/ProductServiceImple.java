package web.spring.skintalk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.persistence.ProductDAO;
import web.spring.skintalk.util.PageCriteria;

@Service
public class ProductServiceImple implements ProductService{
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImple.class);
	
	@Autowired
	private ProductDAO dao;
	
	@Override
	public int create(ProductVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<ProductVO> read() {
		logger.info("read() 호출");
		return dao.select();
	}

	@Override
	public List<ProductVO> read(PageCriteria criteria) {
		logger.info("read() 호출 PageCriteria = " + criteria);
		return dao.select(criteria);
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
	public int getTotalNumsOfRecords() {
		logger.info("getTotalNumsOfRecords()호출");
		return dao.getTotalNums();
	}
	
	@Override
	public ProductVO read(int productNo) {
		logger.info("read() 호출 : " + productNo);
		return dao.select(productNo);
	}

	@Override
	public List<String> readKeyword(String keyword) {
		logger.info("readKeyword 호출 : keyword = " + keyword);
		return dao.selectByKeyword(keyword);
	}


}
