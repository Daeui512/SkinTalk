package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.ReviewVO;

public interface ReviewDAO {
	int insert(ReviewVO vo);
	List<ReviewVO> select(int reviewPno);
	int update(ReviewVO vo);
	int delete(int reviewNo);
	int updateGrade(int reviewPno);
} // end of interface
