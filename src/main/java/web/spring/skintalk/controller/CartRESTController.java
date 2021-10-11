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
	
	private static ResponseEntity<String> ajaxEntity(int result){
		ResponseEntity<String> entity = null;
		
		if(result >= 1) {
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		
		return entity;
	}
	
	private static ResponseEntity<Integer> ajaxUpdateEntity(int result, CartVO vo){
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			int count_by_cartNo = cartService.countCartOne(vo.getCartNo());
			entity = new ResponseEntity<Integer>(count_by_cartNo, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}
		return entity;
	}
	
	@Autowired
	private static CartService cartService;
	
	@DeleteMapping("/cartDeleteOne")
	public ResponseEntity<String> cartDeleteOne(@RequestBody CartVO vo) throws IOException {		// 장바구니의 품목 하나 삭제
		logger.info("cartDeleteOne() 호출 : cartNo = " + vo.getCartNo());
		int result = cartService.deleteOne(vo.getCartNo());
		
		ResponseEntity<String> entity = ajaxEntity(result);
		
		return entity;
	}
	
	@DeleteMapping("/cartDeleteAll")
	public ResponseEntity<String> cartDeleteAll(@RequestBody CartVO vo) throws IOException {
		logger.info("cartDeleteAll() 호출 : userId = " + vo.getUserId());
		int result = cartService.deleteAll(vo.getUserId());
		
		ResponseEntity<String> entity = ajaxEntity(result);
		
		return entity;
	}
	
	@PutMapping("/cartUpdateIncrease")
	public ResponseEntity<Integer> cartUpdateIncrease(@RequestBody CartVO vo, HttpSession session, HttpServletRequest request) throws IOException {		// 장바구니의 품목 전제 삭제(비우기)
		logger.info("cartUpdateIncrease() 호출 : amount = " + vo.getAmount() + ", cartNo = " + vo.getCartNo());
		String userId = (String) session.getAttribute("userId");
		ResponseEntity<Integer> entity = null;
		
		if (userId == null) {
			String nonMemberUserId = CartController.cookieId(request);
        	userId = nonMemberUserId;
		}
		
		CartVO vo1 = new CartVO(vo.getCartNo(), userId, null, 0, null, 0, vo.getAmount(), 0);
		int result = cartService.updateIncreaseCart(vo1);
		
		entity = ajaxUpdateEntity(result, vo);
		
		return entity;
	}
	
	@PutMapping("/cartUpdateDecrease")
	public ResponseEntity<Integer> cartUpdateDecrease(@RequestBody CartVO vo, HttpSession session, HttpServletRequest request) throws IOException {		// 장바구니의 품목 전제 삭제(비우기)
		logger.info("cartUpdateDecrease() 호출 : amount = " + vo.getAmount() + ", cartNo = " + vo.getCartNo());
		String userId = (String) session.getAttribute("userId");
		ResponseEntity<Integer> entity = null;
		
		if (userId == null) {
			String nonMemberUserId = CartController.cookieId(request);
        	userId = nonMemberUserId;
		}
		
		CartVO vo1 = new CartVO(vo.getCartNo(), userId, null, 0, null, 0, vo.getAmount(), 0);
		int result = cartService.updateDecreaseCart(vo1);
		
		entity = ajaxUpdateEntity(result, vo);
		
		return entity;
	}
	
	@PutMapping("/cartUpdate")
	public ResponseEntity<Integer> cartUpdate(@RequestBody CartVO vo, HttpSession session,HttpServletRequest request) {
		logger.info("cartUpdate() 호출");
		String userId = (String) session.getAttribute("userId");
		ResponseEntity<Integer> entity = null;
		
		if (userId == null) {
			String nonMemberUserId = CartController.cookieId(request);
			userId = nonMemberUserId;
		}
		
		CartVO vo1 = new CartVO(vo.getCartNo(), userId, null, 0, null, 0, vo.getAmount(), 0);
		int result = cartService.updateAllCart(vo1);
		
		entity = ajaxUpdateEntity(result, vo);
		
		return entity;
	}
	
}
