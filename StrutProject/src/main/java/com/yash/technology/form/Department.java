package com.yash.technology.form;

import org.apache.struts.action.ActionForm;

public class Department extends ActionForm{

	private int id;
	private String name;
	private String city;
	private int total;
	
	
	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", city=" + city + ", total=" + total + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
}
