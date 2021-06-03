package web.spring.skintalk.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import web.spring.skintalk.domain.ReviewVO;
import web.spring.skintalk.service.ProductService;
import web.spring.skintalk.service.ReviewService;

@RestController
@RequestMapping(value="/reviews")
public class ReviewRESTController {
	private static final Logger logger =
			LoggerFactory.getLogger(ReviewRESTController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService;
	
	@PostMapping
	public ResponseEntity<Double> createReviewPost(@RequestBody ReviewVO vo, HttpServletResponse response) throws Exception{
		logger.info("VO = " + vo.toString());
		int result = reviewService.create(vo);
		double grade = 0.0;
		
		if (result == 1) {
			logger.info("댓글 입력 성공");
			int reviewPno = vo.getReviewPno();
			// 입력 성공하면 전체 평점 product테이블의 grade에 넣기
			reviewService.updateGrade(vo.getReviewPno());
			logger.info("vo : " + vo.toString());
			grade = productService.read(reviewPno).getGrade();
			logger.info("평점 : " + grade);
			return new ResponseEntity<Double>(grade,HttpStatus.OK);
		}else {
			logger.info("댓글 입력 실패");
			return new ResponseEntity<Double>(grade,HttpStatus.OK);
		}

	}
	
	@GetMapping("/all/{reviewPno}")
	public ResponseEntity<List<ReviewVO>> readReviewsGet(
			@PathVariable("reviewPno") int reviewPno) {
		List<ReviewVO> list = reviewService.read(reviewPno);
		return new ResponseEntity<List<ReviewVO>>(list, HttpStatus.OK);
	} 
	
	@PutMapping("/{reviewNo}")
	public ResponseEntity<String> updateReviewPut(@PathVariable("reviewNo") int reviewNo, @RequestBody ReviewVO vo) {
		vo.setReviewNo(reviewNo);
		logger.info("reviewPno = " + vo.getReviewPno());
		logger.info("vo : " + vo.toString());
		
		int result = reviewService.update(vo);
		ResponseEntity<String> entity = null;
		if (result == 1) { 
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else { 
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	} 
	
	@DeleteMapping("/{reviewNo}")
	public ResponseEntity<Double> deleteReview(
			@PathVariable("reviewNo") int reviewNo,
			@RequestBody ReviewVO vo) throws Exception {
		logger.info("reviewPno = " + vo.getReviewPno());
		int reviewPno = vo.getReviewPno();
		int result = reviewService.delete(vo.getReviewNo(), reviewPno);
		double grade = 0.0;
		
		if (result == 1) {
			int count = reviewService.countReviewPno(reviewPno);
			logger.info("상품평 삭제 성공");
			reviewService.delete(reviewNo, reviewPno);
			reviewService.updateGrade(reviewPno);
			
			if (count-1 == 0) {
				logger.info("상품평 없음 count : " + count);
				reviewService.gradeReset(reviewPno);
			} else {
				logger.info("상품평 있음 count : " + count);
			}
			
			grade = productService.read(reviewPno).getGrade();
			logger.info("평점 : " + grade);
			
			return new ResponseEntity<Double>(grade, HttpStatus.OK);
		}
			logger.info("상품평 삭제 실패");
			return new ResponseEntity<Double>(grade, HttpStatus.OK);
		
	} 
	
}