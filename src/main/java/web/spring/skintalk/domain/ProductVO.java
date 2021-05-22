package web.spring.skintalk.domain;


public class ProductVO {
	private int productNo; 		
	private String productName;		
	private int price;			
	private String point;			
	private float grade;				
	private int good;
	private int productType;
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}

	public ProductVO(int productNo, String productName, int price, String point, float grade, int good,
			int productType) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.point = point;
		this.grade = grade;
		this.good = good;
		this.productType = productType;
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

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public float getGrade() {
		return grade;
	}

	public void setGrade(float grade) {
		this.grade = grade;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", price=" + price + ", point="
				+ point + ", grade=" + grade + ", good=" + good + ", productType=" + productType + "]";
	}
	
	
	
}
