package com.yash.technology.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAOConnection {

	public static Connection getConnection()
	{
		try
		{
		Class.forName("com.mysql.cj.jdbc.Driver");	
		String url="jdbc:mysql://localhost:3306/springdata";
		Connection c=DriverManager.getConnection(url,"root","root");
		return c;
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return null;
	}
	
}
