<%@page import="com.zderko.dao.EmployeeDao,com.zderko.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Employee</title>
</head>
<body>
<%
	int pageid = Integer.parseInt(request.getParameter("page"));  
	int total=10;
	if (pageid==0){
		pageid+=1;
	}
	session.setAttribute("s", pageid);
	if(pageid==1){}  
	else{  
	    pageid=pageid-1;  
	    pageid=pageid*total+1;  
	}
		List<Employee> list = EmployeeDao.getAllRecords(pageid,total);
		request.setAttribute("list", list);
		request.setAttribute("count", EmployeeDao.getCountEmployee(total));	
		session.setAttribute("listSize", list.size());
		
%>

<form action="searchview.jsp?page=1" method="post">
	<table>
		<tr>
			<td>emName:</td>
			<td><input type="text" name="em_name"/></td>
			<td><input type="submit" value="Search"/></td>
		</tr>
	</table>
</form>
	
	<table>
		<tr>
			<td><h3>Employees List</h3></td>
			<td width="400"></td>
			<td> <a href="addEmployeeForm.jsp"><input type="button" value="Add New employee"/></a></td>
		</tr>
	</table>
		
	<table border="1" width="50%">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Active</th>
			<th>Department</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="e">
			<tr>
				<td>${e.getEm_id()}</td>
				<td>${e.getEm_name()}</td>
				<td>${e.isEm_active()}</td>
				<td>${e.getEm_dp_id()}</td>
				<td><a href="editForm.jsp?em_id=${e.getEm_id()}">Edit</a></td>
				<td><a href="deleteEmployee.jsp?em_id=${e.getEm_id()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<div>
		<a href="viewEmployee.jsp?page=1">first</a>
		<a href="viewEmployee.jsp?page=${s-1}">prev</a>  
		<a href="viewEmployee.jsp?page=${s}">${s}</a>  
		<a href="viewEmployee.jsp?page=${s+1}">${s+1}</a>  
		<a href="viewEmployee.jsp?page=${s+2}">${s+2}</a>  
		<a href="viewEmployee.jsp?page=${s+3}">${s+3}</a>  
		<a href="viewEmployee.jsp?page=${s+4}">${s+4}</a>  
		<a href="viewEmployee.jsp?page=${s+5}">${s+5}</a>  
		<a href="viewEmployee.jsp?page=${s+9}">${s+6}</a>  
		<a href="viewEmployee.jsp?page=${s+7}">${s+7}</a>  
		<a href="viewEmployee.jsp?page=${s+8}">${s+8}</a>  
		<a href="viewEmployee.jsp?page=${s+9}">${s+9}</a> 
		<a href="viewEmployee.jsp?page=${s+1}">next</a>
		<a href="viewEmployee.jsp?page=${count+1}">last</a>
	</div>
</body>
</html>
