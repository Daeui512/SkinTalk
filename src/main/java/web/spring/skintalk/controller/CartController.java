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
import web.spring.skintalk.domain.MemberVO;
import web.spring.skintalk.domain.NonMemberVO;
import web.spring.skintalk.service.CartService;
import web.spring.skintalk.service.MemberService;
import web.spring.skintalk.service.NonMemberService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	static String cookieId(HttpServletRequest request) {
		
		String id = "";
		
		Cookie[] cookies = null;
    	
    	cookies = request.getCookies();
    	if (cookies != null) {
			logger.info("JSESSIONID 찾기");
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("JSESSIONID")) {
					id = cookie.getValue();
				}
			}
		}
		
		return id;
	}
	
	private static void cartConfig(String id) {
		List<CartVO> list = null;
		int sumMoney = 0;
		int cartCount = 0;
		
		list = cartService.nonMemberListCart(id);
    	sumMoney = cartService.sumMoney(id);
    	cartCount = cartService.countCart(id);
		
	}
	
	@Autowired
	private static CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NonMemberService nonMemberService;

	@GetMapping("/cartList")
	public void cartList(Model model, HttpSession session, HttpServletRequest request) {
		logger.info("cartList() 호출 : 회원용 장바구니 호출");
		String userId = (String) session.getAttribute("userId");
		String nonMemberUserId = "";
		logger.info("userId = " + userId);
		List<CartVO> list = null;
		int sumMoney = 0; 
		int cartCount = 0; 
		MemberVO vo = null;
		NonMemberVO nonmembervo = null;
				
		if(userId != null) {
			cartConfig(userId);
			vo = memberService.read(userId);
						
        }else {
        	nonMemberUserId = cookieId(request);
        	logger.info("비회원용 코드 = " + nonMemberUserId);
        	
        	cartConfig(nonMemberUserId);
        	model.addAttribute("nonMemberUserId", nonMemberUserId);
        	model.addAttribute("nonmembervo", nonmembervo);
        }
		
		for (CartVO vo1 : list) {
			logger.info("CartVO = " + vo1.toString());
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
        	String nonMemberUserId = cookieId(request);
        	
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
	
	
	
	
}