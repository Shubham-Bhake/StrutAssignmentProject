<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page isELIgnored="false" %>
 
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Hello, world!</title>
    
    <!--  -->
    <!--  -->
  </head>
  <body>
  <% if(request.getSession(false)==null)
  {
	  request.setAttribute("message", "Please Login first");
	  request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
  }
	  %>
  
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Admin Panel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="tileact.do?parameter=all">All Employee</a>
        </li>
        <li class="nav-item">
         <a class="nav-link active" href="tileact.do?parameter=add">Add Employee</a> 
        
        </li>
        
         <li class="nav-item">
         <a class="nav-link active" href="tileact.do?parameter=getDepartments">Departments</a> 
        
        </li>
        
        <li class="nav-item">
         <a class="nav-link active" href="adminLogout.jsp">Logout</a> 
        
        </li>
       
      </ul>
   <form class="d-flex">
        
        <button class="btn btn-success" type="button" onclick="find()" >${username}</button>
      </form>  
    </div>
  </div>
</nav>


</body>
</html>