package com.yash.technology.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import com.yash.technology.form.Employee;
import com.yash.technology.form.LoginForm;
public class EmployeeDAO {

	public List<Employee> getAllEmployees()
	{
		List<Employee> employees=new LinkedList<>();
		try
		{
		Connection c=DAOConnection.getConnection();
		PreparedStatement ps=c.prepareStatement("select * from employee1");
		ResultSet rs=ps.executeQuery();
		Employee employee=null;
		while(rs.next())
		{
			employee=new Employee();
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setId(rs.getInt("id"));
			employee.setAge(rs.getInt("age"));
			employee.setEmail(rs.getString("email"));
			employee.setSalary(rs.getInt("salary"));
			employees.add(employee);
		}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return employees;
		
	}
	
	public void addEmployee(Employee emp)
	{
		try
		{
			Connection c=DAOConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("insert into employee1 values (?,?,?,?,?,?,?)");
			ps.setInt(1, emp.getId());
			ps.setString(2, emp.getFirstName());
			ps.setString(3, emp.getLastName());
			ps.setString(4, emp.getEmail());
			ps.setInt(5, emp.getAge());
			ps.setInt(6, emp.getSalary());
			ps.setString(7, "567");
			ps.executeUpdate();
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	public int isValidEmployee(LoginForm login)
	{
		try
		{
			Connection c=DAOConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("select email,password from employee1 where email=?");
			ps.setString(1, login.getUsername());
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				if(login.getPassword().equals(rs.getString("password")))
				{
					return 1;
				}
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return 0;
		
	}
	
	public void deleteEmployee(String ids[])
	{
		try
		{
			Connection c=DAOConnection.getConnection();
			for(int i=0;i<ids.length;i++)
			{
				int id=Integer.parseInt(ids[i]);
			PreparedStatement ps=c.prepareStatement("delete from employee1 where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	public List<Employee> getAllEmployeesByDepartment(int id)
	{
		List<Employee> employees=new LinkedList<Employee>();
		try
		{
			Connection c=DAOConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("select * from employee where deptid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			Employee employee;
			while(rs.next())
			{
				employee=new Employee();
				employee.setEmail(rs.getString("email"));
				employee.setFirstName(rs.getString("ename"));
				employee.setSalary(rs.getInt("salary"));
				employee.setId(rs.getInt("eid"));
				employees.add(employee);
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return employees;
		
	}
	public Employee getEmployeeById(int id)
	{
		Employee e=new Employee();
		try
		{
			Connection c=DAOConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("select * from employee where eid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				e.setEmail(rs.getString("email"));
				e.setFirstName(rs.getString("ename"));
				e.setSalary(rs.getInt("salary"));
				e.setId(rs.getInt("eid"));
			}
		}catch(Exception ex)
		{
			System.out.println(ex);
		}
		return e;
	}
	
	public void updateEmployee(Employee e)
	{
		System.out.println(e);
		try
		{
			Connection c=DAOConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("update employee set ename=?,email=?,salary=?,deptid=? where eid=?");
			ps.setString(1, e.getFirstName());
			ps.setString(2, e.getEmail());
			ps.setInt(3, e.getSalary());
			ps.setInt(4, e.getDeptid());
			ps.setInt(5, e.getId());
			ps.executeUpdate();
		}catch(Exception ex)
		{
			System.out.println(ex);
		}
		
	}
	
}
