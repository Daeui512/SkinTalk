package web.spring.skintalk.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.NonMemberVO;

@Repository
public class NonMemberDAOImple implements NonMemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(NonMemberDAOImple.class);
	private static final String NAMESPACE = "web.spring.skintalk.NonMemberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(NonMemberVO vo) {
		logger.info("insert : " + vo); 
		return sqlSession.insert(NAMESPACE + ".nonMemberInsert", vo);
	}

	@Override
	public int selectCount(String userId) {
		logger.info("selectCount() 호출 : " + userId);
		return sqlSession.selectOne(NAMESPACE + ".nonMemberSelectCount", userId);
	}

	@Override
	public NonMemberVO selectAll(String userId) {
		logger.info("selectAll() 호출 : " + userId);
		return sqlSession.selectOne(NAMESPACE + ".nonMemberSelectAll", userId);
	}
	
	
	
}
