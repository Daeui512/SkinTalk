package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.util.PageCriteria;

public interface ProductDAO {
	int insert(ProductVO vo);
	List<ProductVO> select();
	List<ProductVO> select(PageCriteria c);
	int update(ProductVO vo);
	int delete(int productNo);
	int getTotalNums();
	// 상세 조회
	ProductVO select(int productNo);
	List<String> selectByKeyword(String keyword);
}
