package com.yash.technology.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yash.technology.DAO.EmployeeDAO;
import com.yash.technology.form.Employee;

public class FirstAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession(false);
		if(session==null || session.getAttribute("username")==null)
		{
			System.out.println("session "+session+" "+session.getAttribute("username"));
			request.setAttribute("message", "Please login first");
			return mapping.findForward("failure");
			
		}
		
		Employee emp=(Employee)form;
		new EmployeeDAO().addEmployee(emp);
		return mapping.findForward("success");
	}

	
	
}
