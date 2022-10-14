<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
<% HttpSession session1=request.getSession(false);
if( session1==null || session1.getAttribute("username")==null)
{
	request.setAttribute("message", "Please Login First");
	request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
}
	%>
<div class="d-flex flex-row">
<c:forEach var="department" items="${departments}">

<div class="card" style="width: 18rem;margin-top:30px;margin-left:20px">
  <div class="card-body">
    <h5 class="card-title">${department.name}</h5>
    <h6 class="card-subtitle mb-2 text-muted">${department.city}</h6>
    <p class="card-text">${department.total} Employees working</p>
    <form class="text-center" action="tileact.do">
 <input type='hidden' value='${department.id}' name='deptId' id='set'> 
 <input type='hidden' value='displayEmp' name='parameter'>
 <input type='hidden' value='${department.name}' name='dname'>
<button class="btn btn-primary"  type="submit" >Display Employees</button>
</form>
  </div>
</div>
</c:forEach>
</div>
</body>
</html>