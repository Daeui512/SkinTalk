package web.spring.skintalk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.spring.skintalk.domain.BoardVO;
import web.spring.skintalk.persistence.BoardDAO;
import web.spring.skintalk.util.PageCriteria;

@Service
public class BoardServiceImple implements BoardService{
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImple.class);
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public int create(BoardVO vo) {
		LOGGER.info("create() 호출 : vo  = " + vo.toString());
		return dao.insert(vo);
	}

	@Override
	public List<BoardVO> read(PageCriteria criteria) {
		LOGGER.info("read() 호출 : PageCriteria  = " + criteria);
		return dao.select(criteria);
	}

	@Override
	public BoardVO read(int boardNo) {
		LOGGER.info("read() 호출 : bno  = " + boardNo);
		return dao.select(boardNo);
	}

	@Override
	public int update(BoardVO vo) {
		LOGGER.info("update() 호출 : vo  = " + vo.toString());
		return dao.update(vo);
	}

	@Override
	public int delete(int boardNo) {
		LOGGER.info("delete() 호출 : boardNo  = " + boardNo);
		return dao.delete(boardNo);
	}

	@Override
	public int getTotalNumsOfRecords() {
		LOGGER.info("getTotalNumsOfRecords() 호출 ");
		return dao.getTotalNums();
	}

}
