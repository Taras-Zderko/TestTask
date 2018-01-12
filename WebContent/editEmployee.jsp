<%@page import="com.zderko.dao.EmployeeDao"%>
<jsp:useBean id="e" class="com.zderko.bean.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="e" />
<%
	int em_id = EmployeeDao.update(e);
	int pageNum= Integer.parseInt(session.getAttribute("s").toString());
	response.sendRedirect("viewEmployee.jsp?page="+ pageNum);
%>
