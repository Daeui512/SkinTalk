package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.ReplyVO;

public interface ReplyService {
   int create(ReplyVO vo) throws Exception;
   List<ReplyVO> read(int replyBno);
   int update(ReplyVO vo);
   int delete(int replyNo, int replyBno) throws Exception;
   
}