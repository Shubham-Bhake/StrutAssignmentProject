package com.yash.technology.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yash.technology.DAO.DepartmentDAO;
import com.yash.technology.form.Department;

public class GetDepartmentsInfo extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession(false);
		if(session==null || session.getAttribute("username")==null)
		{
			request.setAttribute("message", "Please Login first");
			return mapping.findForward("AdminLogin.jsp");
		}
		
		List<Department> departments=new DepartmentDAO().getDepartmentDetails();
		request.setAttribute("departments",departments);
		return mapping.findForward("success");
	}

	
	
}
