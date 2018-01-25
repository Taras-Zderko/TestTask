<%@page import="com.zderko.dao.EmployeeDao"%>
<jsp:useBean id="e" class="com.zderko.entity.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="e" />
<%
	EmployeeDao.delete(e);
	String em_name = request.getParameter("em_name");
	int pageNum= Integer.parseInt(session.getAttribute("searchPageNum").toString());
	int size= Integer.parseInt(session.getAttribute("listSizeSearch").toString());
	if(size==1){
		response.sendRedirect("searchview.jsp?em_name=" +em_name+ "&page="+(pageNum-1));
	}else{
		response.sendRedirect("searchview.jsp?em_name=" +em_name+ "&page="+ pageNum);	
	}
	
%>
