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

import web.spring.skintalk.domain.RreviewVO;
import web.spring.skintalk.service.RreviewService;

@RestController
@RequestMapping(value="/rreviews")
public class RreviewRESTController {
	private static final Logger logger = LoggerFactory.getLogger(RreviewRESTController.class);
	
	@Autowired
	private RreviewService rReviewService;
	
	@PostMapping
	public ResponseEntity<Integer> createRreview(@RequestBody RreviewVO vo){
		logger.info("createReview()");
		logger.info(vo.toString());
		
		int result = rReviewService.create(vo);
		
		if (result == 1) {
			return new ResponseEntity<Integer>(result,HttpStatus.OK);
		}else {
			return new ResponseEntity<Integer>(result,HttpStatus.OK);
		}
		
	}
	
	@GetMapping("/all/{rReviewRno}")
	public ResponseEntity<List<RreviewVO>> readRreviews(@PathVariable("rReviewRno") int rReviewRno){
		logger.info("readRreviews() : rReviewRno = " + rReviewRno);
		List<RreviewVO> list = rReviewService.read(rReviewRno);
		return new ResponseEntity<List<RreviewVO>>(list,HttpStatus.OK);

	}
	
	@PutMapping("/{rReviewNo}")
	public ResponseEntity<Integer> updateRreviews(@PathVariable("rReviewNo") int rReviewNo, @RequestBody RreviewVO vo){
		logger.info("vo = " + vo.toString());
		int result = rReviewService.update(vo);
		
		if (result == 1) {
			logger.info("대댓글 수정 성공");
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		}else {
			logger.info("대댓글 수정 실패");
			return new ResponseEntity<Integer>(0, HttpStatus.OK);
		}
		
	}
	
	@DeleteMapping("/{rReviewNo}")
	public ResponseEntity<Integer> deleteRreviews(@PathVariable("rReviewNo") int rReviewNo, @RequestBody RreviewVO vo){
		logger.info("deleteRreviews() rReviewNo = " + rReviewNo);
		int result = rReviewService.delete(rReviewNo);
		
		if (result == 1) {
			logger.info("대댓글 삭제 성공()");
			return new ResponseEntity<Integer>(result,HttpStatus.OK);
		}else {
			logger.info("대댓글 삭제 실패()");
			return new ResponseEntity<Integer>(0,HttpStatus.OK);
		}
		
	}
	
}