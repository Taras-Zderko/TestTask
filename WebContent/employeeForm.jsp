<%@ page import="com.zderko.dao.DepartmentDao,com.zderko.bean.Department"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%	
	List<Department> deplist = DepartmentDao.getAllRecords();
	request.setAttribute("list", deplist);
	request.setAttribute("pageNum", Integer.parseInt(session.getAttribute("s").toString()));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>
<a href="viewEmployee.jsp?page=${pageNum}"><input type="button" value="View All Records"></a>
<br/>

<h1>Add New Employees</h1>
	
<form action="addEmployee.jsp" method="post">
	<table>
		<tr>
			<td>emName:</td>
			<td><input type="text" name="em_name" required=""/></td>
		</tr>
		<tr>
			<td>emActive:</td>
			<td><input type="checkbox" name="em_active" value="true"/>Active</td>
		</tr>
		<tr>
			<td>emID</td>
				<td><select name="em_dp_id">
						<c:forEach var="item" items="${list}">
							<option value="${item.dp_id}">${item.dp_name}</option>
						</c:forEach>
					</select>
				</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Add"/>
				<a href="/TestProject/viewEmployee.jsp?page=${pageNum}"><input type="button" value="Cancell"/></a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>
