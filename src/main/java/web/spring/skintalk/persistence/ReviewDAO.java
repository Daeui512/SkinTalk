package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.ReviewVO;

public interface ReviewDAO {
	public abstract int insert(ReviewVO vo);
	public abstract List<ReviewVO> select(int reviewPno);
	public abstract int update(ReviewVO vo);
	public abstract int delete(int reviewNo);
	public abstract int updateGrade(int reviewPno);
	public abstract int countReviewPno(int reviewPno);
	public abstract int gradeReset(int productNo);
}
