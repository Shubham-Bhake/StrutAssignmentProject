<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

System.out.println(request.getSession(false)+" "+session.getAttribute("username"));
if(request.getSession(false)==null || session.getAttribute("username")==null)
{
	request.setAttribute("message", " Please Login First");
	request.getRequestDispatcher("EmployeeLogin.jsp").forward(request, response);
}
	%>

<!-- Code of header -->	
<%request.getRequestDispatcher("EmployeeHeader.jsp").include(request, response); %>

<h1>Welcome to Your home page</h1>

</body>
</html>