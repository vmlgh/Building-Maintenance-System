<%@page import="java.sql.*" %> 
<%@page import="com.ts.dbutility.DBConnection" %>
<%String flatNo = session.getAttribute("flatNo").toString();%>
<%try{
           //Class.forName("com.mysql.jdbc.Driver");
           //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
           Connection con = DBConnection.getConnection();
           Statement st=con.createStatement();
           int j = st.executeUpdate("delete from bills where flatNo="+flatNo+"");
           int k = st.executeUpdate("delete from amenities where flatNo="+flatNo+"");
           int l = st.executeUpdate("delete from visitors where flatNo="+flatNo+"");
           int i=st.executeUpdate("delete from Residents where flatNo="+flatNo+"");
           int m = st.executeUpdate("delete from users where userId='"+flatNo+"'");
           //response.sendRedirect("SecretaryHome.jsp");
        //response.getWriter().println("<h1>Resident Record deleted</h1>");
   		RequestDispatcher dispatcher=request.getRequestDispatcher("secretaryHometry1.jsp");
   		session.setAttribute("resident", null);
   		dispatcher.include(request, response);
}
catch (Exception e){
System.out.println(e);
}
%>