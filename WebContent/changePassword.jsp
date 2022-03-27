<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %> 
<%@page import="com.ts.dbutility.DBConnection" %>
<%String flatNo = session.getAttribute("flatNo").toString();
  String password = request.getParameter("newPassword");
  String confirmPassword = request.getParameter("confirmPassword");
  //session.setAttribute("flatNo",flatNo);
  
  if(password.equals(confirmPassword)){
  try{
      //Class.forName("com.mysql.jdbc.Driver");
      //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
      Connection con = DBConnection.getConnection();
      Statement st1=con.createStatement();
      int j=st1.executeUpdate("update users set password='"+password+"' where userId='"+flatNo+"'");
      Statement st=con.createStatement();
      int i=st.executeUpdate("update Residents set password='"+password+"' where flatNo='"+flatNo+"'");
      
      session.setAttribute("password",confirmPassword);
      
		response.sendRedirect("ResidentProfileTry.jsp");
}
catch (Exception e){
System.out.println(e);
}}
  %>
