<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.zderko.dao.EmployeeDao,com.zderko.entity.*,java.util.*"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
<%
	String spageid=request.getParameter("page");  
	int pageid =Integer.parseInt(spageid);  
	int total=10;
	if (pageid==0){
		pageid+=1;
	}
	request.setAttribute("currentPage", pageid);
	session.setAttribute("searchPageNum", pageid);
	int pageNumSearch= Integer.parseInt(session.getAttribute("currentPage").toString());
	request.setAttribute("numberOfPageInEmployeeList", pageNumSearch);
	if(pageid==1){}  
	else{  
	    pageid=pageid-1;  
	    pageid=pageid*total+1;  
	}  
		String em_name = request.getParameter("em_name");
		request.setAttribute("em_name", em_name);
		
		if(em_name.isEmpty()){
			response.sendRedirect("viewEmployee.jsp?page="+pageNumSearch);
		}
		
		List<Employee> list = EmployeeDao.Search(em_name, pageid,total);
		request.setAttribute("list", list);
		session.setAttribute("listSizeSearch", list.size());
		request.setAttribute("countInSearch", EmployeeDao.getCountSearch(em_name));
		int noOfRecords  = EmployeeDao.getCountSearch(em_name);
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / total);
		request.setAttribute("noOfPages", noOfPages);
		
		
%>
<a href="viewEmployee.jsp?page=${numberOfPageInEmployeeList}"><input type="button" value="Back to all"></input></a>
 <c:if test = "${list.isEmpty()}">
   <p>No employee found<p>
</c:if>
<c:if test = "${!list.isEmpty()}">
   	<br>
	<br>
	<table border="1" width="50%">
		<tr>
			<th>EmID</th>
			<th>EmName</th>
			<th>EmActive</th>
			<th>EmDpID</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="e">
			<tr>
				<td>${e.getEm_id()}</td>
				<td>${e.getEm_name()}</td>
				<td>${e.isEm_active()}</td>
				<td>${e.getEm_dp_id()}</td>
				<td><a href="editFormSearch.jsp?em_name=${em_name}&em_id=${e.getEm_id()}">Edit</a></td>
				<td><a href="deleteEmployeeSearch.jsp?em_name=${em_name}&em_id=${e.getEm_id()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	</br>
	
	<c:if test="${countInSearch > 10}">
	    <c:if test="${currentPage != 1}">
	    	<td><a href="searchview.jsp?em_name=${em_name}&page=1">First</a></td>
	        <td><a href="searchview.jsp?em_name=${em_name}&page=${currentPage - 1}">Previous</a></td>
	    </c:if>
	    
	    <c:if test="${countInSearch <= 100}">
	    <c:forEach begin="${1}" end="${noOfPages}" var="i">
	       <c:choose>
	          <c:when test="${currentPage eq i}">
	             <td>${i}</td>
	          </c:when>
	          <c:otherwise>
	             <c:if test="${i lt noOfPages+1}"> 
	             	<td><a href="searchview.jsp?em_name=${em_name}&page=${i}">${i}</a></td>
	             </c:if> 
	          </c:otherwise>
	       </c:choose>
	    </c:forEach>
		</c:if> 
		
	    <c:if test="${countInSearch >= 101}">
		 <c:forEach begin="${currentPage}" end="${currentPage +9}" var="i">
			<c:choose>
			   <c:when test="${currentPage eq i}">
			      <td>${i}</td>
			   </c:when>
				<c:otherwise>
				  <c:if test="${i lt noOfPages+1}"> 
				   	<td><a href="searchview.jsp?em_name=${em_name}&page=${i}">${i}</a></td>
				  </c:if> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:if> 
		
	    <c:if test="${currentPage lt noOfPages}">
	        <td><a href="searchview.jsp?em_name=${em_name}&page=${currentPage + 1}">Next</a></td>
	        <td><a href="searchview.jsp?em_name=${em_name}&page=${noOfPages}">Last</a></td>
	    </c:if>
    </c:if>
</c:if>
</body>
</html>