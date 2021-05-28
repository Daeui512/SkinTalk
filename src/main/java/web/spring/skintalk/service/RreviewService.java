package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.RreviewVO;

public interface RreviewService {
	
	public abstract int create(RreviewVO vo);
	public abstract List<RreviewVO> read(int rReviewRno);
	public abstract int update(RreviewVO vo);
	public abstract int delete(int rReviewNo);

}
