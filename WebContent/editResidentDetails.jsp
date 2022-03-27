<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import = "com.ts.dbutility.DBConnection" %>
<%
String flatNo = session.getAttribute("flatNo").toString();
String email = request.getParameter("email");
String userName = request.getParameter("userName");
int familySize = Integer.parseInt(request.getParameter("noOfOccupants"));
String contactNo = request.getParameter("contactNo");
String occupation = request.getParameter("occupation");
String place = request.getParameter("place");
//session.setAttribute("flatNo",flatNo);
try(Connection conn = DBConnection.getConnection();){
Statement st=null;
st=conn.createStatement();

st.executeUpdate("update Residents set userName='"+userName+"',familySize="+familySize+",contactNo='"+contactNo+"',email='"+email+"',occupation='"+occupation+"',place='"+place+"' where flatNo="+flatNo+"");
response.sendRedirect("ResidentProfileTry.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>