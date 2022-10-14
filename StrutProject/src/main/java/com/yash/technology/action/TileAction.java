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
import com.yash.technology.DAO.EmployeeDAO;
import com.yash.technology.form.Department;
import com.yash.technology.form.Employee;

public class TileAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String page=request.getParameter("parameter");
		System.out.println("Page is "+page);
		HttpSession session=request.getSession(false);
		if(session==null || session.getAttribute("username")==null)
		{
			request.setAttribute("message", "Please login first");
			return mapping.findForward("failure");
		}
		
		if(page.equals("add"))
			return mapping.findForward("add");
		if(page.equals("all"))
		{
			System.out.println("check "+page);
			List<Employee> employees=new EmployeeDAO().getAllEmployees();
			request.setAttribute("employees", employees);
			return mapping.findForward("all");
		}
		
		if(page.equals("getDepartments"))
		{
			List<Department> departments=new DepartmentDAO().getDepartmentDetails();
			request.setAttribute("departments",departments);
			return mapping.findForward("getDepartments");
		}
		
		if(page.equals("displayEmp"))
		{
			int id=Integer.parseInt(request.getParameter("deptId"));
			String name=request.getParameter("dname");
			List<Employee> employees=new EmployeeDAO().getAllEmployeesByDepartment(id);
			request.setAttribute("employees", employees);
			request.setAttribute("dname", name);
			return mapping.findForward("displayEmp");
		}
		
		if(page.equals("updateEmp"))
		{
			int id=Integer.parseInt(request.getParameter("deptId"));
			
			Employee employee=new EmployeeDAO().getEmployeeById(id);
			request.setAttribute("employee", employee);
			List<Department> departments=new DepartmentDAO().getDepartmentDetails();
			request.setAttribute("departments",departments);
			return mapping.findForward("updateEmp");
		}
		
		
		// TODO Auto-generated method stub
		return mapping.findForward("contact");
		}
	
}
