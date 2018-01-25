package com.zderko.entity;

public class Employee {
	
	private int em_id;
	private String em_name;
	private boolean em_active;
	private String em_dp_id;
	
	public int getEm_id() {
		return em_id;
	}
	public void setEm_id(int em_id) {
		this.em_id = em_id;
	}
	public String getEm_name() {
		return em_name;
	}
	public void setEm_name(String em_name) {
		this.em_name = em_name;
	}
	public boolean isEm_active() {
		return em_active;
	}
	public void setEm_active(boolean em_active) {
		this.em_active = em_active;
	}
	public String getEm_dp_id() {
		return em_dp_id;
	}
	public void setEm_dp_id(String em_dp_id) {
		this.em_dp_id = em_dp_id;
	}
	@Override
	public String toString() {
		return "Employee [em_id=" + em_id + ", em_name=" + em_name + ", em_active=" + em_active + ", em_dp_id=" + em_dp_id + "]";
	}
}
