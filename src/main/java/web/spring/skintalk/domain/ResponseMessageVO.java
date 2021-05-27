package web.spring.skintalk.domain;

public class ResponseMessageVO {
	private MessageVO message;
	private KeyboardVO keyboard;
	
	public ResponseMessageVO() {
		// TODO Auto-generated constructor stub
	}

	public ResponseMessageVO(MessageVO message, KeyboardVO keyboard) {
		super();
		this.message = message;
		this.keyboard = keyboard;
	}

	public MessageVO getMessage() {
		return message;
	}

	public void setMessage(MessageVO message) {
		this.message = message;
	}

	public KeyboardVO getKeyboard() {
		return keyboard;
	}

	public void setKeyboard(KeyboardVO keyboard) {
		this.keyboard = keyboard;
	}

	@Override
	public String toString() {
		return "ResponseMessageVO [message=" + message + ", keyboard=" + keyboard + "]";
	}
	
}
