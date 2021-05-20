package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.ReviewVO;

public interface ReviewService {
	// 댓글입력
	int create(ReviewVO vo) throws Exception;
	
	// 전체댓글 가져오기
	List<ReviewVO> read(int reviewPno);
	
	// 댓글 수정
	int update(ReviewVO vo);
	
	// 댓글 삭제
	int delete(int reviewNo, int reviewPno) throws Exception;
	
	// 평점 product의 grade칼럼에 넣기
	int updateGrade(int reviewPno);
} // end of interface
