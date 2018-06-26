package com.orange.domain;

public class Food {

	private String foodId;           //食物Id
	private String foodName;         //食物名称
	private String foodUri;          //食物图片地址
	private double foodPrice;        //食物价格
	private int salesNum;            //食物销量
	private int count;               //订单食物数量
	private String foodType;         //商品种类
	private String foodDescription;  //商品介绍
	private String storeId;             //商家ID
	
	
	
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String string) {
		this.storeId = string;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public String getFoodDescription() {
		return foodDescription;
	}
	public void setFoodDescription(String foodDescription) {
		this.foodDescription = foodDescription;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFoodId() {
		return foodId;
	}
	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodUri() {
		return foodUri;
	}
	public void setFoodUri(String foodUri) {
		this.foodUri = foodUri;
	}
	public double getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(double foodPrice) {
		this.foodPrice = foodPrice;
	}
	public int getSalesNum() {
		return salesNum;
	}
	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}
	@Override
	public String toString() {
		return "Food [foodId=" + foodId + ", foodName=" + foodName + ", foodUri=" + foodUri + ", foodPrice=" + foodPrice
				+ ", salesNum=" + salesNum + ", count=" + count + "]";
	}
	
	
	
}
