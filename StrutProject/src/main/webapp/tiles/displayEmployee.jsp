<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h3>${dname} Department Employees</h3>

<!--  -->

<table class="table table-striped table-hover" style="margin-left:20px;margin-right:20px">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Name</th>
      <th scope="col">Salary</th>
      <th scope="col">Email</th>
      <th scope="col">Update</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var='employee' items="${employees}">
    <tr>
      <th scope="row">${employee.id}</th>
      <td>${employee.firstName}</td>
      <td>${employee.salary}</td>
      <td>${employee.email}</td>
      <td><a class="btn btn-warning" href="tileact.do?parameter=updateEmp&deptId=${employee.id}">Update</a>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<div class="text-center">
<a class="btn btn-primary" href="tileact.do?parameter=getDepartments">Back To Departments</a> 
</div>
<!--  -->
</body>
</html>