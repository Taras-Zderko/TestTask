<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.zderko.dao.EmployeeDao,com.zderko.bean.*,java.util.*"%>	
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
	request.setAttribute("s", pageid);
	session.setAttribute("searchPageNum", pageid);
	int pageNumSearch= Integer.parseInt(session.getAttribute("s").toString());
	request.setAttribute("num", pageNumSearch);
	if(pageid==1){}  
	else{  
	    pageid=pageid-1;  
	    pageid=pageid*total+1;  
	}  
		
		String em_name = request.getParameter("em_name");
		request.setAttribute("em_name", em_name);
		if(em_name==""){
			response.sendRedirect("viewEmployee.jsp?page="+pageNumSearch);
		}
		List<Employee> list = EmployeeDao.Search(em_name, pageid,total);
		request.setAttribute("list", list);
		
		
%>
<a href="viewEmployee.jsp?page=${num}"><input type="button" value="Back to all"></input></a>
 <c:if test = "${list.size()==0}">
   <p>No employee found<p>
</c:if>
<c:if test = "${list.size()>0}">
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
	<c:if test = "${list.size()>=10}">
   		<a href="searchview.jsp?em_name=${em_name}&page=${s-1}">prev</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s}">${s}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+1}">${s+1}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+2}">${s+2}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+3}">${s+3}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+4}">${s+4}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+5}">${s+5}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+6}">${s+6}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+7}">${s+7}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+8}">${s+8}</a>  
		<a href="searchview.jsp?em_name=${em_name}&page=${s+9}">${s+9}</a> 
		<a href="searchview.jsp?em_name=${em_name}&page=${s+1}">next</a>
	</c:if>
</c:if>
</body>
</html>