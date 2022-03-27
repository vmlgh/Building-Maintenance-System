package com.ts.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ts.dbutility.DBConnection;
import com.ts.dto.Resident;
//import java.sql.*;
/**
 * Servlet implementation class AmenitiesServlet
 */
@WebServlet("/AmenitiesServlet")
public class AmenitiesServlet extends HttpServlet {
	//public int count = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int count = 0;
		String action = request.getParameter("action");
		if("FootballInServlet".equals(action)) {
			
			 HttpSession session=request.getSession(false);  
		        int flatNo= (int)session.getAttribute("flatNo");  
		         System.out.println(flatNo); 
		        
		     String name = request.getParameter("name");
			count++;
			PreparedStatement pst = null;
			ResultSet rst = null;
		    final String SELECT_QUERY = "select * from Amenities where activity=?";
		    try(Connection con = DBConnection.getConnection();){
			
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, "Football");
			rst = pst.executeQuery();
			int limit = 0;
			while(rst.next()) {
				count += rst.getInt(2);
				limit = rst.getInt(3);
			}
			System.out.println(count);
			rst.beforeFirst();
			final String QUERY = "update Amenities set status = "+count+" where activity = 'Football'";
			PreparedStatement pst1 = con.prepareStatement(QUERY);
			int x = 0;
			if(count <= limit){
			x = pst1.executeUpdate();
			}
			if(x != 0){
				final String QUERY1 = "insert into AmenitiesUsage values(?,'football',?)";
				PreparedStatement pst2 = con.prepareStatement(QUERY1);
				pst2.setInt(1,flatNo);
				pst2.setString(2,name);
				pst2.executeUpdate();
			}
			rst = pst.executeQuery();
	        //int a = 0,b = 0;
			//while(rst.next()) {
			  //  a = rst.getInt(2);
			//	b = rst.getInt(3);
			//}
			//request.setAttribute("a",a);
			//request.setAttribute("b",b);
			//RequestDispatcher dispatcher=request.getRequestDispatcher("Entertainment/index1.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("Entertainment/index1.jsp");
			
			
			
			
		} catch(SQLException e) {}
		} else if("FootballOutServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	         
			
			String name = request.getParameter("name");
			PreparedStatement pst = null;
			ResultSet rst = null;
		    final String SELECT_QUERY = "select * from Amenities where activity=?";
		    try(Connection con = DBConnection.getConnection();){
			
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, "Football");
			rst = pst.executeQuery();
			
			final String QUERY1 = "delete from AmenitiesUsage where flatNo=? and name=? and activity='Football'";
			PreparedStatement pst1 = con.prepareStatement(QUERY1);
			pst1.setInt(1, flatNo);
			pst1.setString(2,name);
			int rst1 = pst1.executeUpdate();
			
			if(rst1 != 0){
			while(rst.next()) {
				count = rst.getInt(2) - 1;
			}
			rst.beforeFirst();
			final String QUERY = "update Amenities set status = "+count+" where activity = 'Football'";
			PreparedStatement pst2 = con.prepareStatement(QUERY);
			pst2.executeUpdate();
			}
			response.sendRedirect("Entertainment/index1.jsp");
			//rst = pst.executeQuery();
			//while(rst.next()) {
				//if(rst.getInt(2) == 0) {
					
				//}
			//}
			
		} catch(SQLException e) {}
		} else if("BadmintonInServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
	        
	     String name = request.getParameter("name");
		count++;
		PreparedStatement pst = null;
		ResultSet rst = null;
	    final String SELECT_QUERY = "select * from Amenities where activity=?";
	    try(Connection con = DBConnection.getConnection();){
		
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setString(1, "Badminton");
		rst = pst.executeQuery();
		int limit = 0;
		while(rst.next()) {
			count += rst.getInt(2);
			limit = rst.getInt(3);
		}
		System.out.println(count);
		rst.beforeFirst();
		final String QUERY = "update Amenities set status = "+count+" where activity = 'Badminton'";
		PreparedStatement pst1 = con.prepareStatement(QUERY);
		int x = 0;
		if(count <= limit){
		x = pst1.executeUpdate();
		}
		if(x != 0){
			final String QUERY1 = "insert into AmenitiesUsage values(?,'Badminton',?)";
			PreparedStatement pst2 = con.prepareStatement(QUERY1);
			pst2.setInt(1,flatNo);
			pst2.setString(2,name);
			pst2.executeUpdate();
		}
		rst = pst.executeQuery();
        
		response.sendRedirect("Entertainment/index1.jsp");
		
		
		} catch(SQLException e) {}
		} else if("BadmintonOutServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
			
			String name = request.getParameter("name");
			PreparedStatement pst = null;
			ResultSet rst = null;
		    final String SELECT_QUERY = "select * from Amenities where activity=?";
		    try(Connection con = DBConnection.getConnection();){
			
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, "Badminton");
			rst = pst.executeQuery();
			
			final String QUERY1 = "delete from AmenitiesUsage where flatNo=? and name=? and activity='Badminton'";
			PreparedStatement pst1 = con.prepareStatement(QUERY1);
			pst1.setInt(1, flatNo);
			pst1.setString(2,name);
			int rst1 = pst1.executeUpdate();
			
			if(rst1 != 0){
			while(rst.next()) {
				count = rst.getInt(2) - 1;
			}
			rst.beforeFirst();
			final String QUERY = "update Amenities set status = "+count+" where activity = 'Badminton'";
			PreparedStatement pst2 = con.prepareStatement(QUERY);
			pst2.executeUpdate();
			}
			response.sendRedirect("Entertainment/index1.jsp");
			//rst = pst.executeQuery();
		} catch(SQLException e) {}
		} else if("TheatreInServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
	        
	     String name = request.getParameter("name");
		count++;
		PreparedStatement pst = null;
		ResultSet rst = null;
	    final String SELECT_QUERY = "select * from Amenities where activity=?";
	    try(Connection con = DBConnection.getConnection();){
		
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setString(1, "Theatre");
		rst = pst.executeQuery();
		int limit = 0;
		while(rst.next()) {
			count += rst.getInt(2);
			limit = rst.getInt(3);
		}
		System.out.println(count);
		rst.beforeFirst();
		final String QUERY = "update Amenities set status = "+count+" where activity = 'Theatre'";
		PreparedStatement pst1 = con.prepareStatement(QUERY);
		int x = 0;
		if(count <= limit){
		x = pst1.executeUpdate();
		}
		if(x != 0){
			final String QUERY1 = "insert into AmenitiesUsage values(?,'Theatre',?)";
			PreparedStatement pst2 = con.prepareStatement(QUERY1);
			pst2.setInt(1,flatNo);
			pst2.setString(2,name);
			pst2.executeUpdate();
		}
		rst = pst.executeQuery();
        //int a = 0,b = 0;
		//while(rst.next()) {
		  //  a = rst.getInt(2);
		//	b = rst.getInt(3);
		//}
		//request.setAttribute("a",a);
		//request.setAttribute("b",b);
		//RequestDispatcher dispatcher=request.getRequestDispatcher("Entertainment/index1.jsp");
		//dispatcher.forward(request, response);
		response.sendRedirect("Entertainment/index1.jsp");
		} catch(SQLException e) {}
		} else if("TheatreOutServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
			
			String name = request.getParameter("name");
			PreparedStatement pst = null;
			ResultSet rst = null;
		    final String SELECT_QUERY = "select * from Amenities where activity=?";
		    try(Connection con = DBConnection.getConnection();){
			
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, "Theatre");
			rst = pst.executeQuery();
			
			final String QUERY1 = "delete from AmenitiesUsage where flatNo=? and name=? and activity='Theatre'";
			PreparedStatement pst1 = con.prepareStatement(QUERY1);
			pst1.setInt(1, flatNo);
			pst1.setString(2,name);
			int rst1 = pst1.executeUpdate();
			
			if(rst1 != 0){
			while(rst.next()) {
				count = rst.getInt(2) - 1;
			}
			rst.beforeFirst();
			final String QUERY = "update Amenities set status = "+count+" where activity = 'Theatre'";
			PreparedStatement pst2 = con.prepareStatement(QUERY);
			pst2.executeUpdate();
			}
			response.sendRedirect("Entertainment/index1.jsp");
			//rst = pst.executeQuery();
		} catch(SQLException e) {}
		} else if("GymInServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
	        
	     String name = request.getParameter("name");
		count++;
		PreparedStatement pst = null;
		ResultSet rst = null;
	    final String SELECT_QUERY = "select * from Amenities where activity=?";
	    try(Connection con = DBConnection.getConnection();){
		
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setString(1, "Gym");
		rst = pst.executeQuery();
		int limit = 0;
		while(rst.next()) {
			count += rst.getInt(2);
			limit = rst.getInt(3);
		}
		System.out.println(count);
		rst.beforeFirst();
		final String QUERY = "update Amenities set status = "+count+" where activity = 'Gym'";
		PreparedStatement pst1 = con.prepareStatement(QUERY);
		int x = 0;
		if(count <= limit){
		x = pst1.executeUpdate();
		}
		if(x != 0){
			final String QUERY1 = "insert into AmenitiesUsage values(?,'Gym',?)";
			PreparedStatement pst2 = con.prepareStatement(QUERY1);
			pst2.setInt(1,flatNo);
			pst2.setString(2,name);
			pst2.executeUpdate();
		}
		rst = pst.executeQuery();
        //int a = 0,b = 0;
		//while(rst.next()) {
		  //  a = rst.getInt(2);
		//	b = rst.getInt(3);
		//}
		//request.setAttribute("a",a);
		//request.setAttribute("b",b);
		//RequestDispatcher dispatcher=request.getRequestDispatcher("Entertainment/index1.jsp");
		//dispatcher.forward(request, response);
		response.sendRedirect("Entertainment/index1.jsp");
		} catch(SQLException e) {}
		} else if("GymOutServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
			
			String name = request.getParameter("name");
			PreparedStatement pst = null;
			ResultSet rst = null;
		    final String SELECT_QUERY = "select * from Amenities where activity=?";
		    try(Connection con = DBConnection.getConnection();){
			
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, "Gym");
			rst = pst.executeQuery();
			
			final String QUERY1 = "delete from AmenitiesUsage where flatNo=? and name=? and activity='Gym'";
			PreparedStatement pst1 = con.prepareStatement(QUERY1);
			pst1.setInt(1, flatNo);
			pst1.setString(2,name);
			int rst1 = pst1.executeUpdate();
			
			if(rst1 != 0){
			while(rst.next()) {
				count = rst.getInt(2) - 1;
			}
			rst.beforeFirst();
			final String QUERY = "update Amenities set status = "+count+" where activity = 'Gym'";
			PreparedStatement pst2 = con.prepareStatement(QUERY);
			pst2.executeUpdate();
			}
			response.sendRedirect("Entertainment/index1.jsp");
			//rst = pst.executeQuery();
		} catch(SQLException e) {}
		} else if("SwimmingpoolInServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
	        
	     String name = request.getParameter("name");
		count++;
		PreparedStatement pst = null;
		ResultSet rst = null;
	    final String SELECT_QUERY = "select * from Amenities where activity=?";
	    try(Connection con = DBConnection.getConnection();){
		
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setString(1, "Swimmingpool");
		rst = pst.executeQuery();
		int limit = 0;
		while(rst.next()) {
			count += rst.getInt(2);
			limit = rst.getInt(3);
		}
		System.out.println(count);
		rst.beforeFirst();
		final String QUERY = "update Amenities set status = "+count+" where activity = 'Swimmingpool'";
		PreparedStatement pst1 = con.prepareStatement(QUERY);
		int x = 0;
		if(count <= limit){
		x = pst1.executeUpdate();
		}
		if(x != 0){
			final String QUERY1 = "insert into AmenitiesUsage values(?,'Swimmingpool',?)";
			PreparedStatement pst2 = con.prepareStatement(QUERY1);
			pst2.setInt(1,flatNo);
			pst2.setString(2,name);
			pst2.executeUpdate();
		}
		rst = pst.executeQuery();
        //int a = 0,b = 0;
		//while(rst.next()) {
		  //  a = rst.getInt(2);
		//	b = rst.getInt(3);
		//}
		//request.setAttribute("a",a);
		//request.setAttribute("b",b);
		//RequestDispatcher dispatcher=request.getRequestDispatcher("Entertainment/index1.jsp");
		//dispatcher.forward(request, response);
		response.sendRedirect("Entertainment/index1.jsp");
		} catch(SQLException e) {}
		} else if("SwimmingpoolOutServlet".equals(action)) {
			HttpSession session=request.getSession(false);  
	        int flatNo= (int)session.getAttribute("flatNo");  
	        System.out.print("Hello "+flatNo);  
			
			String name = request.getParameter("name");
			PreparedStatement pst = null;
			ResultSet rst = null;
		    final String SELECT_QUERY = "select * from Amenities where activity=?";
		    try(Connection con = DBConnection.getConnection();){
			
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, "Swimmingpool");
			rst = pst.executeQuery();
			
			final String QUERY1 = "delete from AmenitiesUsage where flatNo=? and name=? and activity='Swimmingpool'";
			PreparedStatement pst1 = con.prepareStatement(QUERY1);
			pst1.setInt(1, flatNo);
			pst1.setString(2,name);
			int rst1 = pst1.executeUpdate();
			
			if(rst1 != 0){
			while(rst.next()) {
				count = rst.getInt(2) - 1;
			}
			rst.beforeFirst();
			final String QUERY = "update Amenities set status = "+count+" where activity = 'Swimmingpool'";
			PreparedStatement pst2 = con.prepareStatement(QUERY);
			pst2.executeUpdate();
			}
			response.sendRedirect("Entertainment/index1.jsp");
		} catch(SQLException e) {}
		}
		    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
