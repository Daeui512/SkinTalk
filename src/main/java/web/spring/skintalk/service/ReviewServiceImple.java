package web.spring.skintalk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.ReviewVO;
import web.spring.skintalk.persistence.ReviewDAO;

@Service
public class ReviewServiceImple implements ReviewService {
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImple.class);
	
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public int create(ReviewVO vo) throws Exception {
		logger.info("create() 호출");
		return reviewDao.insert(vo);
	}

	@Override
	public List<ReviewVO> read(int reviewPno) {
		logger.info("read() 호출");
		return reviewDao.select(reviewPno);
	}

	@Override
	public int update(ReviewVO vo) {
		logger.info("update() 호출");
		return reviewDao.update(vo);
	}

	@Override
	public int delete(int reviewNo, int reviewPno) throws Exception {
		logger.info("delete() 호출");
		reviewDao.delete(reviewNo);
		logger.info("상품평 삭제 성공");
		return 1;
	}

	@Override
	public int updateGrade(int reviewPno) {
		logger.info("updateGrade() 호출 productNo : " + reviewPno);
		return reviewDao.updateGrade(reviewPno);
	}

	@Override
	public int countReviewPno(int reviewPno) {
		logger.info("countReviewPno() 호출 reviewPno : " + reviewPno);
		return reviewDao.countReviewPno(reviewPno);
	}

	@Override
	public int gradeReset(int productNo) {
		logger.info("gradeReset() 호출 reviewPno : " + productNo);
		return reviewDao.gradeReset(productNo);
	}

}