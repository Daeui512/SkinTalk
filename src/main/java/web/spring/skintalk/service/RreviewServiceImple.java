package web.spring.skintalk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.RreviewVO;
import web.spring.skintalk.persistence.RreviewDAO;

@Service
public class RreviewServiceImple implements RreviewService{
	private static final Logger logger = LoggerFactory.getLogger(RreviewServiceImple.class);
	
	@Autowired
	private RreviewDAO dao;
	
	@Override
	public int create(RreviewVO vo) {
		logger.info("create() 호출 : vo = " + vo.toString());
		return dao.insert(vo);
	}

	@Override
	public List<RreviewVO> read(int rReviewRno) {
		logger.info("read() 호출 : rReviewRno = " + rReviewRno);
		return dao.select(rReviewRno);
	}

	@Override
	public int update(RreviewVO vo) {
		logger.info("update() 호출 : vo = " + vo.toString());
		return dao.update(vo);
	}

	@Override
	public int delete(int rReviewNo) {
		logger.info("delete() 호출 : rReviewNo = " + rReviewNo);
		return dao.delete(rReviewNo);
	}

}
