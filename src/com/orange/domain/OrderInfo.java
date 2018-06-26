package com.orange.domain;

import java.util.List;

public class OrderInfo {

	//private List<String> nos;
	private Order order;
	private Store store;
	
	
	/*public List<String> getNos() {
		return nos;
	}
	public void setNos(List<String> nos) {
		this.nos = nos;
	}*/
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	@Override
	public String toString() {
		return "OrderInfo [order=" + order + ", store=" + store + "]";
	}
	
	
	
}
