package com.ts.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ts.dbutility.DBConnection;

/**
 * Servlet implementation class Amenities
 */
@WebServlet("/Amenities")
public class Amenities extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int count = 0;
		String action = request.getParameter("action").toString();
		HttpSession session=request.getSession(false);  
        String flatNo= session.getAttribute("flatNo").toString();  
        System.out.println("entered amenities" + flatNo);
        String date = request.getParameter("datepicker");
        int slot = Integer.parseInt(request.getParameter("slotpicker"));
        int bookings = Integer.parseInt(request.getParameter("bookings"));
        
        PreparedStatement pst = null;
		ResultSet rst = null;
	    final String SELECT_QUERY = "select count from amenities where activity=? and book_date=? and slotNo=?";
	    try(Connection con = DBConnection.getConnection();){
			
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, action);
			pst.setString(2, date);
			pst.setInt(3, slot);
			rst = pst.executeQuery();
			int limit = 0;
			while(rst.next()) {
				count += rst.getInt(1);
			}
			System.out.println(count);
			rst.beforeFirst();
			final String QUERY = "insert into amenities values(?,?,?,?,?)";
			PreparedStatement pst1 = con.prepareStatement(QUERY);
			pst1.setString(1,flatNo);
			pst1.setString(2,action);
			pst1.setDate(3, java.sql.Date.valueOf(date));
			pst1.setInt(4, slot);
			pst1.setInt(5, bookings);
			int x = 0;
			if(count <= 30){
			   x = pst1.executeUpdate();
			}
			response.sendRedirect("ResidentProfileTry.jsp");
			} catch(SQLException e) {}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
