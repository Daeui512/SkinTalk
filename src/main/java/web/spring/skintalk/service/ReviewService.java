package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.ReviewVO;

public interface ReviewService {
	public abstract int create(ReviewVO vo) throws Exception;
	public abstract List<ReviewVO> read(int reviewPno);
	public abstract int update(ReviewVO vo);
	public abstract int delete(int reviewNo, int reviewPno) throws Exception;
	public abstract int updateGrade(int reviewPno);
	public abstract int countReviewPno(int reviewPno);
	public abstract int gradeReset(int productNo);
}
