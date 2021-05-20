package web.spirng.skintalk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import web.spring.skintalk.domain.CartVO;
import web.spring.skintalk.persistence.CartDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class CartControllerTest {
	private static final Logger LOGGER = LoggerFactory.getLogger(CartControllerTest.class);
	
	@Autowired
	private CartDAO dao;
	
	@Test
	public void testController() {
		testInsert();			// 장바구니 품목 추가
		testSelect();			// 장바구니 품목 보기
		testUpdateIncrease();	// 장바구니 품목 개수 증가
		testUpdateDecrease();	// 장바구니 품목 개수 감소
		testDeleteAll();		// 장바구니 비우기
		testDeleteOne();		// 장바구니 품목 삭제
	}
	private void testInsert() {
		CartVO vo = new CartVO(0, "test", null, 20, null, 0, 2, 0);
		int result = dao.insert(vo);
		if (result == 1) {
			LOGGER.info(result + "행 입력 성공");
		}
	}

	private void testSelect() {
		List<CartVO> list = dao.listCart("test");
		for (CartVO vo : list) {
			LOGGER.info(vo.toString());
		}
	}
	
	private void testUpdateIncrease() {
		CartVO vo = new CartVO(63, "test", null, 0, null, 0, 2, 0);
		int result = dao.updateIncreaseCart(vo);
		if(result == 1) {
			LOGGER.info(result + "행 수정(증가)");
		}
	}
	
	private void testUpdateDecrease() {
		CartVO vo = new CartVO(63, "test", null, 0, null, 0, 3, 0);
		int result = dao.updateDecreaseCart(vo);
		if(result == 1) {
			LOGGER.info(result + "행 수정(감소)");
		}
	}
	
	private void testDeleteAll() {
		CartVO vo = new CartVO(63, "test", null, 0, null, 0, 3, 0);
		int result = dao.deleteAll(vo.getUserId());
		if(result >= 1) {
			LOGGER.info(result + "행 삭제 성공");
		}
	}
	
	private void testDeleteOne() {
		CartVO vo = new CartVO(63, "test", null, 0, null, 0, 3, 0);
		int result = dao.delete(vo.getCartNo());
		if(result == 1) {
			LOGGER.info(result + "행 삭제 성공");
		}
	}
}
