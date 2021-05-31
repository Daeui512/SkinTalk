package web.spring.skintalk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.ReplyVO;
import web.spring.skintalk.persistence.ReplyDAO;

@Service
public class ReplyServiceImple implements ReplyService{
   private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImple.class);
   
   @Autowired
   private ReplyDAO replyDao;

   @Override
   public int create(ReplyVO vo) throws Exception{
      logger.info("create() 호출");
      return replyDao.insert(vo);
   }

   @Override
   public List<ReplyVO> read(int replyBno) {
      logger.info("read 호출");
      return replyDao.select(replyBno);
   }

   @Override
   public int update(ReplyVO vo) {
      logger.info("update 호출");
      return replyDao.update(vo);
   }

   @Override
   public int delete(int replyNo, int replyBno) throws Exception{
      logger.info("delete() 호출");
      return replyDao.delete(replyNo);
   }
   
}