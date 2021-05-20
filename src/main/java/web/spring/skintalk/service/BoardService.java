package web.spring.skintalk.service;

import java.util.List;

import web.spring.skintalk.domain.BoardVO;
import web.spring.skintalk.util.PageCriteria;

// CRUD(CREATE, READ, UPDATE, DELETE)
public interface BoardService {
	public abstract int create(BoardVO vo);
	public abstract List<BoardVO> read(PageCriteria criteria);
	public abstract BoardVO read(int boardNo);
	public abstract int update(BoardVO vo);
	public abstract int delete(int boardNo);
	public abstract int getTotalNumsOfRecords();
}
