package web.spring.skintalk.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.ReplyVO;

@Repository
public class ReplyDAOImple implements ReplyDAO{
   private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImple.class);
   private static final String NAMESPACE = "web.spring.skintalk.ReplyMapper";
   
   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public int insert(ReplyVO vo) {
      logger.info("insert() 호풀");
      return sqlSession.insert(NAMESPACE + ".insert", vo);
   }

   @Override
   public List<ReplyVO> select(int replyBno) {
      logger.info("select() 호출");
      return sqlSession.selectList(NAMESPACE + ".select_all_by_reply_bno", replyBno);
   }

   @Override
   public int update(ReplyVO vo) {
      logger.info("update() 호출 : ");
      return sqlSession.update(NAMESPACE + ".update", vo);
   }

   @Override
   public int delete(int replyNo) {
      logger.info("delete() 호출 : ");
      return sqlSession.delete(NAMESPACE +".delete", replyNo);
   }

}