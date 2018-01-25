package com.zderko.entity;

public class Department {
	
	private int dp_id;
	private String dp_name;
	
	public int getDp_id() {
		return dp_id;
	}
	public void setDp_id(int dp_id) {
		this.dp_id = dp_id;
	}
	public String getDp_name() {
		return dp_name;
	}
	public void setDp_name(String dp_name) {
		this.dp_name = dp_name;
	}
	@Override
	public String toString() {
		return "Department [dp_id=" + dp_id + ", dp_name=" + dp_name + "]";
	}
}
