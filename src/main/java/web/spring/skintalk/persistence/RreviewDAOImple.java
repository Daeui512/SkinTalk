package web.spring.skintalk.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.RreviewVO;

@Repository
public class RreviewDAOImple implements RreviewDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(RreviewDAOImple.class);
	private static final String NAMESPACE = "web.spring.skintalk.rReviewMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(RreviewVO vo) {
		logger.info("insert() 호출 : vo = " + vo.toString());
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	@Override
	public List<RreviewVO> select(int rReviewRno) {
		logger.info("select() 호출");
		return sqlSession.selectList(NAMESPACE + ".select_all_by_r_review_rno", rReviewRno);
	}

	@Override
	public int update(RreviewVO vo) {
		logger.info("update() 호출 : vo = " + vo.toString());
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	@Override
	public int delete(int rReviewNo) {
		logger.info("delete() 호출 : rReviewNo = " + rReviewNo);
		return sqlSession.delete(NAMESPACE + ".delete", rReviewNo);
	}

}
