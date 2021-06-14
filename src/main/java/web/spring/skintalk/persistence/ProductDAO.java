package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.util.PageCriteria;

public interface ProductDAO {
	public abstract int insert(ProductVO vo);					// 상품 입력
	public abstract List<ProductVO> select();					// 전체 상품목록 보기
	public abstract List<ProductVO> select(PageCriteria c);		// 전체 상품 페이징
	public abstract int update(ProductVO vo);					// 상품 수정
	public abstract int delete(int productNo);					// 상품 삭제
	public abstract int getTotalNums();							// 상품 전체 개수
	public abstract int getTotalNumsByKeyword(String keyword);	// 검색했을 때 상품 총개수
	public abstract int getTotalNumsByTypical(int productType);	// 상품 타입별 상품 총개수
	public abstract ProductVO select(int productNo);			// 상세 조회
	public abstract List<String> selectByKeyword(String keyword);		// 검색어 자동완성
	public abstract List<ProductVO> selectAllByKeyword(String keyword, PageCriteria criteria);	// 검색 후 상품목록 보기/ 페이징
	public abstract List<ProductVO> selectByTypical(PageCriteria criteria, int productType);	// 카테고리별(타입별) 상품 출력/ 페이징
	public abstract int viewCount(int productNo);
	public abstract List<ProductVO> selectByRank(PageCriteria criteria);
	public abstract List<ProductVO> selectRecommand(String feature, PageCriteria criteria);
	public abstract List<ProductVO> selectByUserIdAndProductLike(String userId);


}
