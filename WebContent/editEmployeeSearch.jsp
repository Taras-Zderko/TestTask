<%@page import="com.zderko.dao.EmployeeDao"%>
<jsp:useBean id="e" class="com.zderko.bean.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="e" />
<%
	int em_id = EmployeeDao.update(e);
	int pageNum= Integer.parseInt(session.getAttribute("searchPageNum").toString());
	String em_name = request.getParameter("em_name");
	response.sendRedirect("searchview.jsp?em_name="+em_name+"&page="+pageNum);
%>