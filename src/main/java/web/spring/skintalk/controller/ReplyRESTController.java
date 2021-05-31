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

import web.spring.skintalk.domain.ReplyVO;
import web.spring.skintalk.service.ReplyService;

@RestController
@RequestMapping(value="/replies")
public class ReplyRESTController {
   private static final Logger logger = LoggerFactory.getLogger(ReplyRESTController.class);
   
   @Autowired
   private ReplyService replyService;
   
   @PostMapping
   public ResponseEntity<Integer> createReply(@RequestBody ReplyVO vo) {
      logger.info(vo.toString());
      int result;
      
      try {
         result = replyService.create(vo);
         return new ResponseEntity<Integer>(result, HttpStatus.OK);
      } catch (Exception e) {
         return new ResponseEntity<Integer>(0, HttpStatus.OK);
      }
   }
   
   @GetMapping("/all/{replyBno}")
   public ResponseEntity<List<ReplyVO>> readReplies(@PathVariable("replyBno") int replyBno){
      List<ReplyVO> list = replyService.read(replyBno);
      return new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
   }
   
   @PutMapping("/{replyNo}")
   public ResponseEntity<String> updateReply(@PathVariable("replyNo") int replyNo, @RequestBody ReplyVO vo) {
      vo.setReplyNo(replyNo);
      logger.info("replyBno = " + vo.getReplyBno());
      int result = replyService.update(vo);
      ResponseEntity<String> entity = null;
      if(result == 1) {
         entity = new ResponseEntity<String>("success", HttpStatus.OK);
      } else {
         entity = new ResponseEntity<String>("fail", HttpStatus.OK);
      }
      return entity;
   }
   
   @DeleteMapping("/{replyNo}")
   public ResponseEntity<String> deleteReply(@PathVariable("replyNo") int replyNo, @RequestBody ReplyVO vo ){
      logger.info("replyBno = " + vo.getReplyBno());
      
      try{
         replyService.delete(replyNo, vo.getReplyBno());
         return new ResponseEntity<String>("success", HttpStatus.OK);
      } catch(Exception e){
         return new ResponseEntity<String>("fail", HttpStatus.OK);
      }
      
   }
   
}