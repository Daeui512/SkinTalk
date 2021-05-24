package web.spring.skintalk.domain;

public class ProductLikeVO {

	private int likeNo;
	private int productNo;
	private String userId;
	
	public ProductLikeVO() {}

	public ProductLikeVO(int likeNo, int productNo, String userId) {
		super();
		this.likeNo = likeNo;
		this.productNo = productNo;
		this.userId = userId;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "ProductLikeVO [likeNo=" + likeNo + ", productNo=" + productNo + ", userId=" + userId + "]";
	}
	
	
	
}
