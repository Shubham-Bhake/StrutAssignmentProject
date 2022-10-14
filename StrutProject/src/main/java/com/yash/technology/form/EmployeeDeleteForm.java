package com.yash.technology.form;

import org.apache.struts.action.ActionForm;

public class EmployeeDeleteForm extends ActionForm {

	private String ids;

	
	
	@Override
	public String toString() {
		return "EmployeeDeleteForm [ids=" + ids + "]";
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
}
