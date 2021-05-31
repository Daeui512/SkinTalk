package web.spring.skintalk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.spring.skintalk.domain.MemberVO;
import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.domain.ReviewVO;
import web.spring.skintalk.service.MemberService;
import web.spring.skintalk.service.ProductService;
import web.spring.skintalk.service.ReviewService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
    
	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewService reviewService;
	
	// 상세조회
	@GetMapping("/product_detail")
	public void productGet(Model model, Integer productNo, HttpSession session) {
		logger.info("productGet() 호출 : " + productNo);
		ProductVO vo = productService.read(productNo);
		productService.viewCount(productNo);	// 조회수 
		logger.info("vo : " + vo.toString());
		model.addAttribute("vo", vo);
		
		String userId = (String)session.getAttribute("userId");
		if (userId != null) {
			MemberVO mVo = memberService.read(userId);
			logger.info("mVo : " + mVo.toString());
			model.addAttribute("mVo", mVo);
		}
		List<ReviewVO> rVo = reviewService.read(productNo);
		logger.info("rVo : " + rVo.toString());
		
	} // end productGet()
	
}
