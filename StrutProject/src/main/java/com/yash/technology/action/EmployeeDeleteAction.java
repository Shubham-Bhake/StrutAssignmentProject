package com.yash.technology.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yash.technology.DAO.EmployeeDAO;
import com.yash.technology.form.EmployeeDeleteForm;

public class EmployeeDeleteAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession(false);
		if(session==null || session.getAttribute("username")==null)
		{
			System.out.println("session "+session+" "+session.getAttribute("username"));
			request.setAttribute("message", "Please login first");
			return mapping.findForward("failure");
			
		}
		
		EmployeeDeleteForm edf=(EmployeeDeleteForm)form;
	//	System.out.println(edf);
		String ids[]=edf.getIds().split(",");
		System.out.println("sshshhshshsh");
		new EmployeeDAO().deleteEmployee(ids);
		return mapping.findForward("success");
	}

	
	
}
