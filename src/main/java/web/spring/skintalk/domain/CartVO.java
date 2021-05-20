package web.spring.skintalk.domain;

public class CartVO {
	private int cartNo;
    private String userId;
    private String userName;
    private int productNo;
    private String productName;
    private int price;
    private int amount;
    private int money;
    
    public CartVO() {
		// TODO Auto-generated constructor stub
	}

	public CartVO(int cartNo, String userId, String userName, int productNo, String productName, int price, int amount,
			int money) {
		super();
		this.cartNo = cartNo;
		this.userId = userId;
		this.userName = userName;
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.amount = amount;
		this.money = money;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", userId=" + userId + ", userName=" + userName + ", productNo=" + productNo
				+ ", productName=" + productName + ", price=" + price + ", amount=" + amount + ", money=" + money + "]";
	}
    
    
    
}
