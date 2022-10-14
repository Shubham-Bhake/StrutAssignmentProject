
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Hello, world!</title>
<script>
	function find() {
		let data = document.getElementById("exampleInputEmail1").value
				.toUpperCase();
		let myTable = document.getElementById("myTable");
		let tr = myTable.getElementsByTagName("tr");
		for (var i = 0; i < tr.length; i++) {
			let td = tr[i].getElementsByTagName('td')[1];
			if (td) {
				let textValue = td.textContent || td.innerHTML;
				if (textValue.toUpperCase().indexOf(data) > -1) {
					tr[i].style.display = "";
				}
				else
					{
					tr[i].style.display="none";
					}
			}
		}
	}
	
	function checkedRow()
	{
		var lst=[];
		let msg='';
		var myTable=document.getElementById('myTable');
		
		var checks=myTable.getElementsByTagName('input');
		for(var i=0;i<checks.length;i++)
			{
			if(checks[i].checked)
				{
				data=checks[i].parentNode.parentNode;
				//alert(data.cells[0].innerHTML);
				lst.push(data.cells[0].innerHTML);
				msg+=data.cells[0].innerHTML+",";
				}
			}
		if(lst.length==0) 
			{
			alert("No Data selected");
			return false;
			}
	let dec=confirm("Are you sure you want to delete selected data");
	if(!dec)
		return false;
	document.getElementById('set').value=msg;
	alert(document.getElementById('set').value);
		return true;
	}
</script>
</head>
<body>

<% HttpSession session1=request.getSession(false);
if( session1==null || session1.getAttribute("username")==null)
{
	request.setAttribute("message", "Please Login First");
	request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
}
	%>

	<!-- below is table code -->

	<div class="mb-3" style='margin-left:20px;margin-top:5px;font-weight:bold'>
		<label for="exampleInputEmail1" class="form-label">Employee
			First Name</label> <input type="text" name='lastName' class="form-control  w-50"
			id="exampleInputEmail1" aria-describedby="emailHelp"
			placeholder="search..." onkeyup="find()">
	</div>

	<table class="table" id="myTable">
		<thead>
			<tr>
				
				<th scope='col'>Id</th>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Salary</th>
				<th scope="col">Email</th>
				<th scope="col">Age</th>
				<th scope='col'>Action</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="employee" items="${employees}">
				<tr>
					<td><c:out value="${employee.id}" /></td>
					<td><c:out value="${employee.firstName}" /></td>
					<td><c:out value="${employee.lastName}" /></td>
					<td><c:out value="${employee.salary}" /></td>
					<td><c:out value="${employee.email}" /></td>
					<td><c:out value="${employee.age}" /></td>
					<td>
					 
    <input class="form-check-input mt-0" type="checkbox"  value="${employee.id}" aria-label="Checkbox for following text input">
 
					</td>

				</tr>
			</c:forEach>


		</tbody>
	</table>
<form class="text-center" onsubmit="return checkedRow()" action="employeeDelete.do">
<input type='hidden' value='' name='ids' id='set'>
<button class="btn btn-danger"  type="submit" >Delete</button>
</form>
</body>
</html>