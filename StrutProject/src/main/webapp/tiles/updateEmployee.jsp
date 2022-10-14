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
<script>
function confirmFunction()
{
	return confirm("Are you sure you want to update ?");
}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1>This is update Page</h1>

<form action="updateEmpAction.do" method='post' onsubmit="return confirmFunction()">

<div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Id</label>
    <input type="text" class="form-control w-50" name='id' value='${employee.id }' id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" class="form-control w-50" name='firstName' value="${employee.firstName}" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email</label>
    <input type="text" class="form-control w-50" name='email' value='${employee.email }' id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Salary</label>
    <input type="text" class="form-control w-50" name='salary' value="${employee.salary}" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>
  <div class="mb-3 w-50">
  <label for="exampleInputEmail1" class="form-label">Department</label>
  <select class="form-select" name='deptid' aria-label="Default select example">
  <option selected value=" ">Choose....</option>
  
  <c:forEach var="department" items="${departments}">
   <option value="${department.id}">${department.name}</option>
  </c:forEach>
  
  
</select>
  </div>
  <button type="submit" class="btn btn-primary">Update</button>
</form>


</body>
</html>