<%@page import="com.zderko.dao.EmployeeDao"%>
<jsp:useBean id="e" class="com.zderko.bean.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="e" />

<%
	int i = EmployeeDao.save(e);
	if (i > 0) {
		response.sendRedirect("addEmployeeSuccess.jsp");
	} else {
		response.sendRedirect("addEmployeeError.jsp");
	}
%>
