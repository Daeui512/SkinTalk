package web.spring.skintalk.persistence;

import java.util.List;

import web.spring.skintalk.domain.BoardVO;
import web.spring.skintalk.util.PageCriteria;


public interface BoardDAO {
	public abstract int insert(BoardVO vo);
	public abstract List<BoardVO> select();
	public abstract BoardVO select(int boardNo);
	public abstract int update(BoardVO vo);
	public abstract int delete(int boardNo);
	public abstract List<BoardVO> select(PageCriteria c);
	public abstract int getTotalNums();
	public abstract List<BoardVO> select(String userId);
	public abstract List<BoardVO> selectByTitleOrContents(String keyword);
}