package web.spring.skintalk.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.spring.skintalk.domain.CartVO;
import web.spring.skintalk.service.CartService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/cartList")
	public void cartList(Model model, HttpSession session, HttpServletRequest request) {
		logger.info("cartList() 호출 : 회원용 장바구니 호출");
		String userId = (String) session.getAttribute("userId");
		String nonMemberUserId = "";
		logger.info("userId = " + userId);
		List<CartVO> list = null;
		int sumMoney = 0; 
		int cartCount = 0; 
		
		if(userId != null) {
			list = cartService.listCart(userId);
			sumMoney = cartService.sumMoney(userId);
			cartCount = cartService.countCart(userId);
        }else {
        	Cookie[] cookies = null;
        	
        	cookies = request.getCookies();
        	
        	if (cookies != null) {
				logger.info("JSESSIONID 찾기");
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("JSESSIONID")) {
						nonMemberUserId = cookie.getValue();
					}
				}
			}
        	list = cartService.nonMemberListCart(nonMemberUserId);
        	sumMoney = cartService.sumMoney(nonMemberUserId);
        	cartCount = cartService.countCart(nonMemberUserId);
        }
		
		for (CartVO vo : list) {
			logger.info("CartVO = " + vo.toString());
		}
		logger.info("sumMoney = " + sumMoney);
		logger.info("장바구니 개수 : " + cartCount);

		model.addAttribute("cartList", list);
		model.addAttribute("sumMoney", sumMoney);
		model.addAttribute("cartCount", cartCount);
	}
	
	
	@PostMapping("/insert")
    public String insert(@ModelAttribute CartVO vo, HttpSession session, HttpServletRequest request) {
        logger.info("insert() 호출");
        String userId = (String) session.getAttribute("userId");
	    
        if(userId != null) {
        	vo.setUserId(userId);
        	logger.info("vo = " + vo.toString());
        }else {
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
        	vo.setUserId(nonMemberUserId);
        	logger.info("vo = " + vo.toString());
        }
        
        // 장바구니에 기존 상품이 있는지 검사
        int count = cartService.countCart(vo.getUserId(), vo.getProductNo()); 
        if(count == 0) {
          cartService.insert(vo);
          logger.info(vo + "행입력");
        } else {
          cartService.updateCart(vo);
          logger.info(count + "행 수정");
        }
        return "redirect:/cart/cartList";
    }

	
	@PostMapping("/cartList")
	public String cartListPost() {		// 장바구니를 확인하고 사용자가 결제를 하기위해서 form 정보를 받아옴
		
		return null;
	}
	
	@GetMapping("/cartDeleteOne")
	@ResponseBody
	public void cartDeleteOne(int cartNo, HttpServletResponse response) throws IOException {		// 장바구니의 품목 하나 삭제
		logger.info("cartDeleteOne() 호출 : cartNo = " + cartNo);
		
		int result = cartService.deleteOne(cartNo);
		
		if (result == 1) {
			logger.info("장바구니 품목 삭제 성공");
			response.getWriter().append("success");
		}else {
			logger.info("장바구니 품목 삭제 실패");
		}
	}
	
	@GetMapping("/cartDeleteAll")
	@ResponseBody
	public void cartDeleteAll(String userId, HttpServletResponse response) throws IOException {
		logger.info("cartDeleteAll() 호출 : userId = " + userId);
		
		int result = cartService.deleteAll(userId);
		if(result >= 1) {
			logger.info("장바구니 비우기 성공");
			response.getWriter().append("success");
		}else {
			logger.info("장바구니 비우기 실패");
		}
		
	}
	
	@GetMapping("/cartUpdateIncrease")
	@ResponseBody
	public void cartUpdateIncrease(int amount, int cartNo, HttpSession session, HttpServletResponse response,HttpServletRequest request) throws IOException {		// 장바구니의 품목 전제 삭제(비우기)
		logger.info("cartUpdateIncrease() 호출 : amount = " + amount + ", cartNo = " + cartNo);
		String userId = (String) session.getAttribute("userId");
		
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
		
		CartVO vo = new CartVO(cartNo, userId, null, 0, null, 0, amount, 0);
		int result = cartService.updateIncreaseCart(vo);
		if (result == 1) {
			logger.info("상품 개수 UP 성공");
			response.getWriter().append("success");
		} else {
			logger.info("상품 개수 수정 실패");
		}
	}
	
	@GetMapping("/cartUpdateDecrease")
	@ResponseBody
	public void cartUpdateDecrease(int amount, int cartNo, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {		// 장바구니의 품목 전제 삭제(비우기)
		logger.info("cartUpdateDecrease() 호출 : amount = " + amount + ", cartNo = " + cartNo);
		String userId = (String) session.getAttribute("userId");
		
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
		
		CartVO vo = new CartVO(cartNo, userId, null, 0, null, 0, amount, 0);
		int result = cartService.updateDecreaseCart(vo);
		if (result == 1) {
			logger.info("상품 개수 DOWN 성공");
			response.getWriter().append("success");
		} else {
			logger.info("상품 개수 수정 실패");
		}
	}
	
}
