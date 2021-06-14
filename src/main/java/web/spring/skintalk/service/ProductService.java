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
	public abstract int getTotalNumsOfRecords();
	public abstract int getTotalNumsByKeyword(String keyword);
	public abstract int getTotalNumsByTypical(int productType);
	public abstract ProductVO read(int productNo); // 상세 조회
	public abstract List<String> readKeyword(String keyword);
	public abstract List<ProductVO> readAllKeyword(String keyword, PageCriteria criteria);
	public abstract List<ProductVO> readByTypical(PageCriteria criteria, int productType);
	public abstract int viewCount(int productNo);
	public abstract List<ProductVO> readByRank(PageCriteria criteria);
	public abstract List<ProductVO> readRecommand(String feature, PageCriteria criteria);
	public abstract List<ProductVO> readByUserIdAndProductLike(String userId);

}
