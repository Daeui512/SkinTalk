package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.ReplyVO;

public interface ReplyService {
	public abstract int create(ReplyVO vo) throws Exception;
	public abstract List<ReplyVO> read(int replyBno);
	public abstract int update(ReplyVO vo);
	public abstract int delete(int replyNo, int replyBno) throws Exception;
   
}