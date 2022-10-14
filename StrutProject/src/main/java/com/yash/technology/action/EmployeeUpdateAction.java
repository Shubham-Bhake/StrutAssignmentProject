package com.yash.technology.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yash.technology.DAO.EmployeeDAO;
import com.yash.technology.form.Employee;

public class EmployeeUpdateAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		Employee emp=(Employee)form;
		System.out.println(emp);
		new EmployeeDAO().updateEmployee(emp);
		return mapping.findForward("success");
	}

	
	
}
