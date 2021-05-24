package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.util.PageCriteria;

public interface ProductDAO {
	int insert(ProductVO vo);					// 상품 입력
	List<ProductVO> select();					// 전체 상품목록 보기
	List<ProductVO> select(PageCriteria c);		// 전체 상품 페이징
	int update(ProductVO vo);					// 상품 수정
	int delete(int productNo);					// 상품 삭제
	int getTotalNums();							// 상품 전체 개수
	int getTotalNumsByKeyword(String keyword);	// 검색했을 때 상품 총개수
	int getTotalNumsByTypical(int productType);	// 상품 타입별 상품 총개수
	ProductVO select(int productNo);			// 상세 조회
	List<String> selectByKeyword(String keyword);		// 검색어 자동완성
	List<ProductVO> selectAllByKeyword(String keyword, PageCriteria criteria);	// 검색 후 상품목록 보기/ 페이징
	List<ProductVO> selectByTypical(PageCriteria criteria, int productType);	// 카테고리별(타입별) 상품 출력/ 페이징
	int viewCount(int productNo);

}
