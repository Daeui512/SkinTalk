package web.spring.skintalk.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import web.spring.skintalk.domain.KeyboardVO;
import web.spring.skintalk.domain.MessageButtonVO;
import web.spring.skintalk.domain.MessageVO;
import web.spring.skintalk.domain.PhotoVO;
import web.spring.skintalk.domain.RequestMessageVO;
import web.spring.skintalk.domain.ResponseMessageVO;

@RestController
public class ChanBotController {
	
	@GetMapping("/keyboard")
	public KeyboardVO keyboard() {
		KeyboardVO keyboard = new KeyboardVO(new String[] {"사진", "라벨", "에코메시지"});
		
		return keyboard;
	}
	
	@PostMapping("/message")
	public ResponseMessageVO message(@RequestBody RequestMessageVO vo) {
		
		ResponseMessageVO resVO = new ResponseMessageVO();
		MessageVO mesVO = new MessageVO();
		
		if(vo.getContent().equals("메인화면")) {
			mesVO.setText("첫 화면을 호출합니다.");
			KeyboardVO keyboard = new KeyboardVO(new String[] {"사진", "라벨", "에코메시지"});
			
			resVO.setKeyboard(keyboard);
		}else if(vo.getContent().equals("사진")){
			PhotoVO photo = new PhotoVO();
			
			photo.setUrl("http://placehold.it/640x480.jpg");
			photo.setWidth(640);
			photo.setHeight(480);
			
			mesVO.setPhoto(photo);
			mesVO.setText(vo.getContent());
		}else if(vo.getContent().equals("라벨")) {
			MessageButtonVO messageButton = new MessageButtonVO();
			
			messageButton.setLabel("GITHUB");
			messageButton.setUrl("");
			
			mesVO.setMessageButton(messageButton);
			mesVO.setText("많은 피드백 부탁드립니다.");
		}else {
			mesVO.setText(vo.getContent());
		}
		resVO.setMessage(mesVO);
		
		return resVO;
	}

}
