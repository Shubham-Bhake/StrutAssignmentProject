package com.yash.technology.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import com.yash.technology.form.Department;



public class DepartmentDAO  {

	public List<Department> getDepartmentDetails()
	{
		List<Department> departments=new LinkedList<Department>();
		try {
			Connection c=DAOConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("select count(e.ename) as total,d.dname as name,d.deptid as id,d.city as city from employee e,department d where e.deptid=d.deptid group by d.dname");
			ResultSet rs=ps.executeQuery();
			Department d;
			while(rs.next())
			{
				d=new Department();
				d.setTotal(rs.getInt("total"));
				d.setCity(rs.getString("city"));
				d.setName(rs.getString("name"));
				d.setId(rs.getInt("id"));
				departments.add(d);
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return departments;
	}
	
	public List<Department> getDepartments()
	{
		List<Department> departments=new LinkedList<Department>();
		try {
			Connection c=DAOConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("select dname,deptid from department");
			ResultSet rs=ps.executeQuery();
			Department dept=null;
			while(rs.next())
			{
			dept=new Department();
			dept.setName(rs.getString("dname"));
			dept.setId(rs.getInt("deptid"));
			departments.add(dept);
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return departments;
	}
}
