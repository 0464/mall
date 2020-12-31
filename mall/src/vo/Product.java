package vo;

public class Product {
	private int productId;
	private int categoryId;
	private String categoryName;
	private String productName;
	private int productPrice;
	private String productContent;
	private String productSoldout;
	private String productPic;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getProductSoldout() {
		return productSoldout;
	}
	public void setProductSoldout(String productSoldout) {
		this.productSoldout = productSoldout;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", categoryId=" + categoryId + ", categoryName=" + categoryName
				+ ", productName=" + productName + ", productPrice=" + productPrice + ", productContent="
				+ productContent + ", productSoldout=" + productSoldout + ", productPic=" + productPic + "]";
	}
}
