package web.spring.skintalk.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.BoardVO;
import web.spring.skintalk.util.PageCriteria;

@Repository
public class BoardDAOImple implements BoardDAO{
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardDAOImple.class);
	private static final String NAMESPACE = "web.spring.skintalk.BoardMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(BoardVO vo) {
		LOGGER.info("insert() 호출");
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	@Override
	public List<BoardVO> select() {
		LOGGER.info("select() 호출");
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}

	@Override
	public BoardVO select(int boardNo) {
		LOGGER.info("select() 호출");
		return sqlSession.selectOne(NAMESPACE + ".select_by_boardNo", boardNo);
	}

	@Override
	public int update(BoardVO vo) {
		LOGGER.info("update() 호출");
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	@Override
	public int delete(int boardNo) {
		LOGGER.info("delete() 호출");
		return sqlSession.delete(NAMESPACE + ".delete", boardNo);
	}

	@Override
	public List<BoardVO> select(PageCriteria c) {
		LOGGER.info("select() 페이징스코프 호출");
		return sqlSession.selectList(NAMESPACE + ".select_pageCriteria", c);
	}

	@Override
	public int getTotalNums() {
		LOGGER.info("select() 전체 페이지수 호출");
		return sqlSession.selectOne(NAMESPACE + ".select_TotalNums");
	}

	@Override
	public List<BoardVO> select(String userId) {
		LOGGER.info("select() 호출 : userid = " + userId);
		userId = "%" + userId + "%";
		return sqlSession.selectList(NAMESPACE + ".select_by_userid", userId);
	}

	@Override
	public List<BoardVO> selectByTitleOrContents(String keyword) {
		LOGGER.info("select() 호출 : keyword = " + keyword);
		keyword = "%" + keyword + "%";
		return sqlSession.selectList(NAMESPACE + ".select_by_keyword", keyword);
	}
}