package web.spring.skintalk.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.ReviewVO;

@Repository
public class ReviewDAOImple implements ReviewDAO{
	private static final Logger logger = LoggerFactory.getLogger(ReviewDAOImple.class);
	private static final String NAMESPACE = "web.spring.skintalk.ReviewMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(ReviewVO vo) {
		logger.info("insert() 호출");
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	@Override
	public List<ReviewVO> select(int reviewPno) {
		logger.info("select() 호출");
		return sqlSession.selectList(NAMESPACE + ".select_all_by_review_pno", reviewPno);
	}

	@Override
	public int update(ReviewVO vo) {
		logger.info("update() 호출");
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	@Override
	public int delete(int reviewNo) {
		logger.info("delete() 호출");
		return sqlSession.delete(NAMESPACE + ".delete", reviewNo);
	}

	@Override
	public int updateGrade(int reviewPno) {
		logger.info("updateGrade() 호출");
		return sqlSession.update(NAMESPACE + ".update_product_grade_by_avg_of_review_grade", reviewPno);
	}

	// reviewPno의 댓글 수 확인
	@Override
	public int countReviewPno(int reviewPno) {
		logger.info("countReviewPno() 호출");
		return sqlSession.selectOne(NAMESPACE + ".select_count_review_pno", reviewPno);
	}

	// grade 초기화
	@Override
	public int gradeReset(int productNo) {
		logger.info("gradeReset() 호출");
		return sqlSession.update(NAMESPACE + ".update_grade_reset", productNo);
	}

} // end of class
