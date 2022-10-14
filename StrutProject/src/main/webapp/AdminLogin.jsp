<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<%session.invalidate(); %>



<form style="margin-left:20px;margin-top:10px" action='adminLogin.do'>
<h2>Admin Login Form</h2>

<p style="color:red">${message}</p>
  <div class="mb-3 w-50">
    <label for="exampleInputEmail1" class="form-label">Username</label>
    <input type="text" name='username' class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>
  <div class="mb-3 w-50">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
  </div>
	
  <button type="submit" class="btn btn-primary">Login</button>
</form>

</body>
</html>