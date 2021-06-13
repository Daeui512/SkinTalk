package web.spring.skintalk.controller;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import web.spring.skintalk.domain.PaymentVO;
import web.spring.skintalk.service.NonMemberService;
import web.spring.skintalk.service.PaymentService;

@RestController
@RequestMapping(value="/payment")
public class PaymentRESTController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentRESTController.class);

	@Autowired
	private NonMemberService nonMemberService;
	
	@Autowired
	private PaymentService paymentService;
	

    @PostMapping("/result/{i}/{cartLength}")
    public ResponseEntity<Integer> MemberPaymentPOST(@RequestBody PaymentVO vo, @PathVariable("i") int i, @PathVariable("cartLength") int cartLength) throws CoolsmsException {
       logger.info("MemberPaymentPOST()");
       logger.info(vo.toString());
       int result;
   
       String api_key = "NCSWWGJKHOWO5SJC";
       String api_secret = "WIRYIRLBU3UZOGBCFMLPQ2UBZ5EYPFB7";
       Message coolsms = new Message(api_key, api_secret);
 
       HashMap<String, String> params = new HashMap<String, String>();
       params.put("to", vo.getPhone());
       params.put("from", "01094984201");
       params.put("type", "SMS");
       params.put("text", vo.getUserId()+"님 "+vo.getProductName()+"외 "+ (cartLength-1) +"건 주문이 완료되었습니다.");
       params.put("app_version", "test app 1.2"); // application name and version
   
		 try {
		 	result = paymentService.create(vo);
		 	logger.info("결과 : " + result);
		 	if(i == 0) {
		 		try {
					JSONObject obj = (JSONObject) coolsms.send(params);
					System.out.println(obj.toString());
				} catch (CoolsmsException e) {
					System.out.println(e.getMessage());
					System.out.println(e.getCode());
				}					
			}
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Integer>(0, HttpStatus.OK);
		}
    }

    @PostMapping("/nonMember/{userId}")
    public ResponseEntity<Integer> nonMemberSelectPOST( @PathVariable("userId") String userId) {
       logger.info("nonMemberSelectPOST()");
       logger.info("nonMemberSelectPOST() userID = " + userId);
       int result;
       try {
          result = nonMemberService.readCount(userId);
          logger.info("결과 : " + result);
          return new ResponseEntity<Integer>(result, HttpStatus.OK);
       } catch (Exception e) {
          return new ResponseEntity<Integer>(0, HttpStatus.OK);
       }
    }
	
}