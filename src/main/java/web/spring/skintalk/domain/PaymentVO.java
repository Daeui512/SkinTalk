package web.spring.skintalk.domain;

import oracle.sql.DATE;

public class PaymentVO {
	private String paymentNo;
	private String userId;
	private int productNo;
	private int price;
	private String productName;
	private int amount;
	private DATE pdate;
	private String email;
	private String phone;
	
	public PaymentVO() {}

	public PaymentVO(String paymentNo, String userId, int productNo, int price, String productName, int amount,
			DATE pdate, String email, String phone) {
		super();
		this.paymentNo = paymentNo;
		this.userId = userId;
		this.productNo = productNo;
		this.price = price;
		this.productName = productName;
		this.amount = amount;
		this.pdate = pdate;
		this.email = email;
		this.phone = phone;
	}

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public DATE getPdate() {
		return pdate;
	}

	public void setPdate(DATE pdate) {
		this.pdate = pdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "PaymentVO [paymentNo=" + paymentNo + ", userId=" + userId + ", productNo=" + productNo + ", price="
				+ price + ", productName=" + productName + ", amount=" + amount + ", pdate=" + pdate + ", email="
				+ email + ", phone=" + phone + "]";
	}
	
	

	
	
	
}
