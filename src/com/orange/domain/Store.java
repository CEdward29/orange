package com.orange.domain;

import java.util.Date;
import java.util.List;

public class Store {

	private String storeId;          //商铺Id
	private String storeName;        //商铺名称
	private String password;         //商家密码
	private double sendAtLeast;      //起送费
	private double sendCost;         //运送费
	private String sendTime;         //运送时间
	private String imgUri;           //商铺图片地址
	private String type;             //商铺类型（如西餐）
	private String description;      //商铺描述
	private String openTime;         //商铺开门时间
	private String address;          //商铺地址
	private String email;            //商家邮箱
	private String telephone;        //商家电话
	private int order_num;           //订单量
	private String registime;        //注册时间
	private List<Food> food;         //商铺显示食物
	private int state;               //商铺激活码，0表示未被通过，1表示被通过
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getRegistime() {
		return registime;
	}
	public void setRegistime(String registime) {
		this.registime = registime;
	}
	public List<Food> getFood() {
		return food;
	}
	public void setFood(List<Food> food) {
		this.food = food;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public double getSendAtLeast() {
		return sendAtLeast;
	}
	public void setSendAtLeast(double sendAtLeast) {
		this.sendAtLeast = sendAtLeast;
	}
	public double getSendCost() {
		return sendCost;
	}
	public void setSendCost(double sendCost) {
		this.sendCost = sendCost;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getImgUri() {
		return imgUri;
	}
	public void setImgUri(String imgUri) {
		this.imgUri = imgUri;
	}
	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storeName=" + storeName + ", sendAtLeast=" + sendAtLeast + ", sendCost="
				+ sendCost + ", sendTime=" + sendTime + ", imgUri=" + imgUri + ", type=" + type + ", description="
				+ description + ", openTime=" + openTime + ", address=" + address + ", food=" + food + "]";
	}
	
	
	
}
