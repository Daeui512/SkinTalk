package web.spring.skintalk.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import web.spring.skintalk.domain.CartVO;
import web.spring.skintalk.service.CartService;

@RestController
@RequestMapping(value="/carts")
public class CartRESTController {
	private static final Logger logger = LoggerFactory.getLogger(CartRESTController.class);
	
	@Autowired
	private CartService cartService;
	
	@DeleteMapping("/cartDeleteOne")
	public ResponseEntity<String> cartDeleteOne(@RequestBody CartVO vo) throws IOException {		// 장바구니의 품목 하나 삭제
		logger.info("cartDeleteOne() 호출 : cartNo = " + vo.getCartNo());
		
		int result = cartService.deleteOne(vo.getCartNo());
		ResponseEntity<String> entity = null;
		
		if (result == 1) {
			logger.info("장바구니 품목 삭제 성공");
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			logger.info("장바구니 품목 삭제 실패");
			entity = new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		return entity;
	}
	
	@DeleteMapping("/cartDeleteAll")
	public ResponseEntity<String> cartDeleteAll(@RequestBody CartVO vo) throws IOException {
		logger.info("cartDeleteAll() 호출 : userId = " + vo.getUserId());
		int result = cartService.deleteAll(vo.getUserId());
		ResponseEntity<String> entity = null;
		
		if(result >= 1) {
			logger.info("장바구니 비우기 성공");
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			logger.info("장바구니 비우기 실패");
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
		
	}
	
	@PutMapping("/cartUpdateIncrease")
	public ResponseEntity<Integer> cartUpdateIncrease(@RequestBody CartVO vo, HttpSession session, HttpServletRequest request) throws IOException {		// 장바구니의 품목 전제 삭제(비우기)
		logger.info("cartUpdateIncrease() 호출 : amount = " + vo.getAmount() + ", cartNo = " + vo.getCartNo());
		String userId = (String) session.getAttribute("userId");
		ResponseEntity<Integer> entity = null;
		
		if (userId == null) {
			Cookie[] cookies = null;
        	String nonMemberUserId = "";
        	
        	cookies = request.getCookies();
        	
        	if (cookies != null) {
				logger.info("JSESSIONID 찾기");
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("JSESSIONID")) {
						nonMemberUserId = cookie.getValue();
					}
				}
			}
        	userId = nonMemberUserId;
		}
		
		CartVO vo1 = new CartVO(vo.getCartNo(), userId, null, 0, null, 0, vo.getAmount(), 0);
		int result = cartService.updateIncreaseCart(vo1);
		
		if (result == 1) {
			logger.info("상품 개수 UP 성공");
			int count_by_cartNo = cartService.countCartOne(vo.getCartNo());
			logger.info("count = " + count_by_cartNo);
			entity = new ResponseEntity<Integer>(count_by_cartNo, HttpStatus.OK);
		} else {
			logger.info("상품 개수 수정 실패");
			entity = new ResponseEntity<Integer>(result,HttpStatus.OK);
		}
		return entity;
	}
	
	@PutMapping("/cartUpdateDecrease")
	public ResponseEntity<Integer> cartUpdateDecrease(@RequestBody CartVO vo, HttpSession session, HttpServletRequest request) throws IOException {		// 장바구니의 품목 전제 삭제(비우기)
		logger.info("cartUpdateDecrease() 호출 : amount = " + vo.getAmount() + ", cartNo = " + vo.getCartNo());
		String userId = (String) session.getAttribute("userId");
		ResponseEntity<Integer> entity = null;
		
		if (userId == null) {
			Cookie[] cookies = null;
        	String nonMemberUserId = "";
        	cookies = request.getCookies();
        	
        	if (cookies != null) {
				logger.info("JSESSIONID 찾기");
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("JSESSIONID")) {
						nonMemberUserId = cookie.getValue();
					}
				}
			}
        	userId = nonMemberUserId;
		}
		
		CartVO vo1 = new CartVO(vo.getCartNo(), userId, null, 0, null, 0, vo.getAmount(), 0);
		int result = cartService.updateDecreaseCart(vo1);
		
		if (result == 1) {
			logger.info("상품 개수 DOWN 성공");
			int count_by_cartNo = cartService.countCartOne(vo.getCartNo());
			logger.info("count = " + count_by_cartNo);
			entity = new ResponseEntity<Integer>(count_by_cartNo, HttpStatus.OK);
		} else {
			logger.info("상품 개수 수정 실패");
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}
		return entity;
	}
	
	@PutMapping("/cartUpdate")
	public ResponseEntity<Integer> cartUpdate(@RequestBody CartVO vo, HttpSession session,HttpServletRequest request) {
		logger.info("cartUpdate() 호출");
		String userId = (String) session.getAttribute("userId");
		ResponseEntity<Integer> entity = null;
		
		if (userId == null) {
			Cookie[] cookies = null;
			String nonMemberUserId = "";
			cookies = request.getCookies();
			
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if(cookie.getName().equals("JSESSIONID")) {
						nonMemberUserId = cookie.getValue();
					}
				}
			}
			userId = nonMemberUserId;
		}
		CartVO vo1 = new CartVO(vo.getCartNo(), userId, null, 0, null, 0, vo.getAmount(), 0);
		int result = cartService.updateAllCart(vo1);
		
		if (result == 1) {
			logger.info("장바구니 품목 개수 변경 성공");
			int count_by_cartNo = cartService.countCartOne(vo.getCartNo());
			logger.info("count = " + count_by_cartNo);
			entity = new ResponseEntity<Integer>(count_by_cartNo, HttpStatus.OK);
		}else {
			logger.info("장바구니 품목 개수 변경 실패");
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}
		return entity;
	}
	
}
