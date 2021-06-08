package web.spring.skintalk.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import web.spring.skintalk.domain.ProductLikeVO;
import web.spring.skintalk.service.ProductLikeService;
import web.spring.skintalk.service.ProductService;

@RestController
@RequestMapping("/like")
public class ProductLikeRESTController {
	private static final Logger logger = LoggerFactory.getLogger(ProductLikeRESTController.class);
	
	@Autowired
	private ProductLikeService productLikeService;
	
	@Autowired
	private ProductService productService;
	
	// 좋아요 넣기
	@PostMapping("/insert")
	public ResponseEntity<Integer> createLike(@RequestBody ProductLikeVO vo, HttpSession session){
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		int result;
		int count = productLikeService.productLikeEq(userId, vo.getProductNo());
		logger.info(vo.toString());
		if(count == 0) {
			try {
				result = productLikeService.create(vo);
				int good_count = productService.read(vo.getProductNo()).getGood();
				
				return new ResponseEntity<Integer>(good_count, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<Integer>(0, HttpStatus.OK);
			}
		} else{
			try {
				
				result = productLikeService.delete(vo.getUserId(), vo.getProductNo());
				logger.info(" " + result);
				int good_count = productService.read(vo.getProductNo()).getGood();
				
				return new ResponseEntity<Integer>(good_count, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<Integer>(0, HttpStatus.OK);
			}
		}
	} 

}