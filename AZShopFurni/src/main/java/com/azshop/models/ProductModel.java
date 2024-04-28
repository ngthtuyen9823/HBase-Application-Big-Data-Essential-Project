package com.azshop.models;

import java.util.List;

public class ProductModel {
	private int productID;
	private String productName;
	private String description;
	private String origin;
	private int supplierID;
	private int categoryID;
	private String material;

	private float avgRating;
	private int numOfRating;
	private int soldTotal;
	private int displayedPromotionPrice;
	private int displayedOriginalPrice;
	private List<ItemModel> listItem;
	private List<ItemImageModel> listItemImage;
	private String displayedImage;
	private String categoryName;
	private String supplierName;

	public ProductModel(int productID, String productName, String description, String origin, int supplierID,
			int categoryID, String material, float avgRating, int numOfRating, int soldTotal,
			int displayedPromotionPrice, int displayedOriginalPrice, List<ItemModel> listItem,
			List<ItemImageModel> listItemImage, String displayedImage, String categoryName, String supplierName) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.description = description;
		this.origin = origin;
		this.supplierID = supplierID;
		this.categoryID = categoryID;
		this.material = material;
		this.avgRating = avgRating;
		this.numOfRating = numOfRating;
		this.soldTotal = soldTotal;
		this.displayedPromotionPrice = displayedPromotionPrice;
		this.displayedOriginalPrice = displayedOriginalPrice;
		this.listItem = listItem;
		this.listItemImage = listItemImage;
		this.displayedImage = displayedImage;
		this.categoryName = categoryName;
		this.supplierName = supplierName;
	}

	public ProductModel() {
		super();
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public int getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public float getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(float avgRating) {
		this.avgRating = avgRating;
	}

	public int getNumOfRating() {
		return numOfRating;
	}

	public void setNumOfRating(int numOfRating) {
		this.numOfRating = numOfRating;
	}

	public int getSoldTotal() {
		return soldTotal;
	}

	public void setSoldTotal(int soldTotal) {
		this.soldTotal = soldTotal;
	}

	public int getDisplayedPromotionPrice() {
		return displayedPromotionPrice;
	}

	public void setDisplayedPromotionPrice(int displayedPromotionPrice) {
		this.displayedPromotionPrice = displayedPromotionPrice;
	}

	public int getDisplayedOriginalPrice() {
		return displayedOriginalPrice;
	}

	public void setDisplayedOriginalPrice(int displayedOriginalPrice) {
		this.displayedOriginalPrice = displayedOriginalPrice;
	}

	public List<ItemModel> getListItem() {
		return listItem;
	}

	public void setListItem(List<ItemModel> listItem) {
		this.listItem = listItem;
	}

	public List<ItemImageModel> getListItemImage() {
		return listItemImage;
	}

	public void setListItemImage(List<ItemImageModel> listItemImage) {
		this.listItemImage = listItemImage;
	}

	public String getDisplayedImage() {
		return displayedImage;
	}

	public void setDisplayedImage(String displayedImage) {
		this.displayedImage = displayedImage;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	@Override
	public String toString() {
		return "ProductModel [productID=" + productID + ", productName=" + productName + ", description=" + description
				+ ", origin=" + origin + ", supplierID=" + supplierID + ", categoryID=" + categoryID + ", material="
				+ material + ", avgRating=" + avgRating + ", numOfRating=" + numOfRating + ", soldTotal=" + soldTotal
				+ ", displayedPromotionPrice=" + displayedPromotionPrice + ", displayedOriginalPrice="
				+ displayedOriginalPrice + ", listItem=" + listItem + ", listItemImage=" + listItemImage
				+ ", displayedImage=" + displayedImage + ", categoryName=" + categoryName + ", supplierName="
				+ supplierName + "]";
	}

}
