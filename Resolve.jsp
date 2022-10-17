<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.infinite.demo.Resolve"%>
<%@page import="com.infinite.demo.Complaint"%>
<%@page import="com.infinite.demo.ComplaintDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resolve</title>
</head>
<body>

  <form method="get"  action="Resolve.jsp">
  <center>
  Complaint Id:
    <input type="text" name="id" value="<%=request.getParameter("id") %>"readonly /><br/><br/>
    Resolved By :
    <input type="text" name="resolvedBy" /><br/><br/>
    Comments :
    <input type="text" name="comments" /><br/><br/>
    <input type="submit" value="Insert" /><br/><br/>
  </center>
  </form>
		<%
		if(request.getParameter("resolvedBy") != null){
			
			ComplaintDAO dao = new ComplaintDAO();
			Complaint complaint = dao.searhComplaint(request.getParameter("id"));
			Resolve resolve = new Resolve();
			resolve.setComplaintId(request.getParameter("id"));
			resolve.setComplaintDate(complaint.getComplaintDate());
			resolve.setResolvedBy(request.getParameter("resolvedBy"));
			resolve.setComments(request.getParameter("comments"));
			dao.addResolve(resolve);
}
		%>
	<center>	
	<a href = "ResolveShow.jsp" ><input type="button" value ="ResolveShow"></a>
	</center>
</body>
</html>