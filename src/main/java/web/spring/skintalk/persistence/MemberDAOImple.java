package web.spring.skintalk.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.MemberVO;

@Repository
public class MemberDAOImple implements MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImple.class);
	private static final String namespace =	"web.spring.skintalk.MemberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(MemberVO vo) {
		logger.info("insert() 호출");
		return sqlSession.insert(namespace + ".insert", vo);
	}

	@Override
	public MemberVO select(String userId) {
		logger.info("select() 호출 userid : " + userId);
		return sqlSession.selectOne(namespace + ".selectAll", userId);
	}
	
	@Override
	public int update(MemberVO vo) {
		logger.info("update() 호출");
		return sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public int delete(String userId) {
		logger.info("delete() 호출 userid : " + userId);
		return sqlSession.delete(namespace + ".delete", userId);
	}
	
	@Override
	public MemberVO select(String userId, String password) {
		logger.info("select() 호출");
		Map<String, String> args = new HashMap<String, String>();
		args.put("userId", userId);
		args.put("password", password);
		return sqlSession.selectOne(namespace + ".select_by_userid_and_password", args);
	}

	@Override
	public int userIdChk(String userId) {
		logger.info("userIdChk() 호출");
		return sqlSession.selectOne(namespace + ".userid_check", userId);
	} 
	
	@Override
	public int emailChk(String email) {
		logger.info("emailChk() 호출");
		return sqlSession.selectOne(namespace + ".email_check", email);
	}

	@Override
	public int phoneChk(String phone) {
		logger.info("phoneChk() 호출");
		return sqlSession.selectOne(namespace + ".phone_check", phone);
	}

	@Override
	public String findId(String email, String phone) {
		logger.info("findId() 호출");
		Map<String, String> args = new HashMap<String, String>();
		args.put("email", email);
		args.put("phone", phone);
		return sqlSession.selectOne(namespace + ".select_userid_by_email_and_phone", args);
	}
	
	@Override
	public int findPassword(MemberVO vo) {
		logger.info("findPassword() 호출");
		return sqlSession.update(namespace + ".find_password", vo);
	}

	@Override
	public int nickNameChk(String nickName) {
		logger.info("nickNameChk() 호출");
		return sqlSession.selectOne(namespace + ".nickName_check", nickName);
	}

}