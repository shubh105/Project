package com.cdac.annotation;


public class ServiceResponse {

	private String Status;
	private Object data;
	public ServiceResponse(String status, Object data) {
		super();
		Status = status;
		this.data = data;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	
}
