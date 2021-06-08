package web.spring.skintalk.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import web.spring.skintalk.domain.MemberVO;
import web.spring.skintalk.service.MemberService;
import web.spring.skintalk.service.NonMemberService;

@RestController
@RequestMapping(value="/checks")
public class MemberCheckRESTController {
	private static final Logger logger = LoggerFactory.getLogger(MemberCheckRESTController.class);
	
	@Autowired
	private MemberService memberService;
	
	@PostMapping("/userid_check")
	public ResponseEntity<Integer> userIdChkPost(@RequestBody MemberVO vo) {
		logger.info("userIdChkPost() : " + vo.getUserId());
		int result = memberService.userIdChk(vo.getUserId());
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(0,HttpStatus.OK);
		}
		
		return entity;
	}
	
	@PostMapping("/email_check")
	public ResponseEntity<Integer> emailChkPost(@RequestBody MemberVO vo) {
		logger.info("emailChkPost() : " + vo.getEmail());
		int result = memberService.emailChk(vo.getEmail());
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(0,HttpStatus.OK);
		}
		
		return entity;
	}
	
	@PostMapping("/phone_check")
	public ResponseEntity<Integer> phoneChkPost(@RequestBody MemberVO vo) {
		logger.info("phoneChkPost() : " + vo.getPhone());
		int result = memberService.phoneChk(vo.getPhone());
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			entity = new ResponseEntity<Integer>(result,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(0,HttpStatus.OK);
		}
		
		return entity;
	}
	
	@PostMapping("/nickname_check")
	public ResponseEntity<Integer> nickNameChkPost(@RequestBody MemberVO vo) {
		logger.info("nickNameChkPost() : " + vo.getNickName());
		int result = memberService.nickNameChk(vo.getNickName());
		ResponseEntity<Integer> entity = null;
		
		if (result == 1) {
			logger.info("닉네임 중복");
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(0, HttpStatus.OK);
		}
		return entity;
	}
	
}
