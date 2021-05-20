package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.ReplyVO;

public interface ReplyDAO {
   int insert(ReplyVO vo);
   List<ReplyVO> select(int replyBno);
   int update(ReplyVO vo);
   int delete(int replyNo);
}