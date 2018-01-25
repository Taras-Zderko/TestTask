<%@ page import="com.zderko.dao.EmployeeDao,com.zderko.entity.Employee"%>
<%@ page import="com.zderko.dao.DepartmentDao,com.zderko.entity.Department"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%
	String em_id = request.getParameter("em_id");
	String em_name = request.getParameter("em_name");
	Employee employee = EmployeeDao.getRecordById(Integer.parseInt(em_id));
	List<Department> deplist = DepartmentDao.getAllRecords();
	request.setAttribute("list", deplist);
	request.setAttribute("pageNum", Integer.parseInt(session.getAttribute("searchPageNum").toString()));
	request.setAttribute("em_name", request.getParameter("em_name"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>		
	<h1>Edit Form</h1>
	<form action="editEmployeeSearch.jsp" method="post">
		<input type="hidden" name="em_id" value="<%=employee.getEm_id()%>" />
		<table>
			<tr>
				<td>EmName:</td>
				<td><input type="text" name="em_name" value="<%=employee.getEm_name()%>" required=""/></td>
			</tr>
			<tr>
				<td>EmActive:</td>
				<td><input type="checkbox" name="em_active" value="true"/>Active</td>
			</tr>
			<tr>
				<td>EmDpID:</td>
				<td><select name="em_dp_id">
						<c:forEach var="item" items="${list}">
							<option value="${item.dp_id}">${item.dp_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Save"/>
					<a href="searchview.jsp?em_name=${em_name}&page=${pageNum}"><input type="button" value="Cancell"/></a>
				</td>
			</tr>
		</table>
	</form>
	name - "${em_name}"
	page - "${pageNum}"

</body>
</html>
