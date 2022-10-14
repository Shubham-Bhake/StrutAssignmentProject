package com.yash.technology.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yash.technology.DAO.EmployeeDAO;
import com.yash.technology.form.LoginForm;

public class EmployeeLoginAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		LoginForm data=(LoginForm)form;
		System.out.println(form);
		if(new EmployeeDAO().isValidEmployee(data)==1)
		{
			HttpSession session=request.getSession();
			session.setAttribute("username", data.getUsername());
			return mapping.findForward("success");
		}
		request.setAttribute("message", "Invalid Username or Password");
		return mapping.findForward("failure");	
			
	}

	
	
}
