<%@page import="com.zderko.dao.EmployeeDao,com.zderko.entity.*, java.util.List"%>
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
	session.setAttribute("currentPage", pageid);
	if(pageid==1){}  
	else{  
	    pageid=pageid-1;  
	    pageid=pageid*total+1;  
	}
		List<Employee> list = EmployeeDao.getAllRecords(pageid,total);
		request.setAttribute("list", list);
		session.setAttribute("listSize", list.size());
		request.setAttribute("count", EmployeeDao.getCountEmployee());
		int noOfRecords  = EmployeeDao.getCountEmployee();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / total);
		request.setAttribute("noOfPages", noOfPages);
		
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
	</br>
	
	<c:if test="${count > 10}">
	    <c:if test="${currentPage != 1}">
	    	<td><a href="viewEmployee.jsp?page=1">First</a></td>
	        <td><a href="viewEmployee.jsp?page=${currentPage - 1}">Previous</a></td>
	    </c:if>
	    
	    <c:if test="${count <= 100}">
	    <c:forEach begin="${1}" end="${noOfPages}" var="i">
	       <c:choose>
	          <c:when test="${currentPage eq i}">
	             <td>${i}</td>
	          </c:when>
	          <c:otherwise>
	             <c:if test="${i lt noOfPages+1}"> 
	             	<td><a href="viewEmployee.jsp?page=${i}">${i}</a></td>
	             </c:if> 
	          </c:otherwise>
	       </c:choose>
	    </c:forEach>
		</c:if> 
		
	    <c:if test="${count >= 101}">
		 <c:forEach begin="${currentPage}" end="${currentPage +9}" var="i">
			<c:choose>
			   <c:when test="${currentPage eq i}">
			      <td>${i}</td>
			   </c:when>
				<c:otherwise>
				  <c:if test="${i lt noOfPages+1}"> 
				   	<td><a href="viewEmployee.jsp?page=${i}">${i}</a></td>
				  </c:if> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:if> 
		
	    <c:if test="${currentPage lt noOfPages}">
	        <td><a href="viewEmployee.jsp?page=${currentPage + 1}">Next</a></td>
	        <td><a href="viewEmployee.jsp?page=${noOfPages}">Last</a></td>
	    </c:if>
    </c:if>
</body>
</html>
