<%@page import="com.zderko.dao.EmployeeDao"%>
<jsp:useBean id="e" class="com.zderko.entity.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="e" />
<%
	EmployeeDao.delete(e);
	int pageNum= Integer.parseInt(session.getAttribute("currentPage").toString());
	int size= Integer.parseInt(session.getAttribute("listSize").toString());
	if(size==1){
		response.sendRedirect("viewEmployee.jsp?page="+(pageNum-1));
	}else{
		response.sendRedirect("viewEmployee.jsp?page="+pageNum);	
	}
	
%>
