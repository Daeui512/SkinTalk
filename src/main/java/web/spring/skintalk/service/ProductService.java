package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.util.PageCriteria;

public interface ProductService {
	public abstract int create(ProductVO vo);
	public abstract List<ProductVO> read();
	public abstract List<ProductVO> read(PageCriteria criteria);
	public abstract int update(ProductVO vo);
	public abstract int delete(int productNo);
	int getTotalNumsOfRecords();
	int getTotalNumsByKeyword(String keyword);
	ProductVO read(int productNo); // 상세 조회
	public abstract List<String> readKeyword(String keyword);
	public abstract List<ProductVO> readAllKeyword(String keyword, PageCriteria criteria);
}
