package web.spring.skintalk.controller;

import java.util.List;

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
import web.spring.skintalk.service.ReviewService;
import web.spring.skintalk.service.RreviewService;

@RestController
@RequestMapping(value="/reviews")
public class ReviewRESTController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewRESTController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping
	public ResponseEntity<Integer> createReviewPost(@RequestBody ReviewVO vo){
		logger.info(vo.toString());
		int result;
		
		try {
			result = reviewService.create(vo);
			reviewService.updateGrade(vo.getReviewPno());
			logger.info("vo : " + vo.toString());
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			logger.info("vo : " + vo.toString());
			e.printStackTrace();
			return new ResponseEntity<Integer>(0, HttpStatus.OK);
		}
	} 
	
	@GetMapping("/all/{reviewPno}")
	public ResponseEntity<List<ReviewVO>> readReviewsGet(@PathVariable("reviewPno") int reviewPno) {
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
	public ResponseEntity<String> deleteReview(@PathVariable("reviewNo") int reviewNo, @RequestBody ReviewVO vo) {
		logger.info("reviewPno = " + vo.getReviewPno());
		
		try {
			reviewService.delete(reviewNo, vo.getReviewPno());
			reviewService.updateGrade(vo.getReviewPno());
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("fail", HttpStatus.OK);
		}

	}
	
}