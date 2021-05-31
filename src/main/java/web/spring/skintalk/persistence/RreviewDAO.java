package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.RreviewVO;

public interface RreviewDAO {
	public abstract int insert(RreviewVO vo);
	public abstract List<RreviewVO> select(int rReviewRno);
	public abstract int update(RreviewVO vo);
	public abstract int delete(int rReviewNo);

}
