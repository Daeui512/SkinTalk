package web.spring.skintalk.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
	
	
}