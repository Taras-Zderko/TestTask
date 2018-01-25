<%@page import="com.zderko.dao.EmployeeDao"%>
<jsp:useBean id="e" class="com.zderko.entity.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="e" />
<%
	int em_id = EmployeeDao.update(e);
	int pageNum= Integer.parseInt(session.getAttribute("currentPage").toString());
	response.sendRedirect("viewEmployee.jsp?page="+ pageNum);
%>
