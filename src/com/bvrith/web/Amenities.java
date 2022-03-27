package com.ts.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        String d = request.getParameter("datepicker");
        Date date = null;
		try {
			date = new SimpleDateFormat("MM/dd/yyyy").parse(d);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        int slot = Integer.parseInt(request.getParameter("slotpicker").toString().charAt(0) + "");
        int bookings = Integer.parseInt(request.getParameter("bookings"));
        
        PreparedStatement pst = null;
		ResultSet rst = null;
	    final String SELECT_QUERY = "select count from amenities where activity=? and book_date=? and slotNo=?";
	    try(Connection con = DBConnection.getConnection();){
			System.out.println("entered try");
			pst = con.prepareStatement(SELECT_QUERY);
			pst.setString(1, action);
			pst.setDate(2, new java.sql.Date(date.getTime()));
			pst.setInt(3, slot);
			rst = pst.executeQuery();
			while(rst.next()) {
				count += rst.getInt(1);
				System.out.println(rst.getInt(1));
				
			}
			rst.beforeFirst();
			if(bookings > 6) {
				bookings = 6;
			}
			final String QUERY = "insert into amenities values(?,?,?,?,?)";
			PreparedStatement pst1 = con.prepareStatement(QUERY);
			pst1.setString(1,flatNo);
			pst1.setString(2,action);
			pst1.setDate(3,new java.sql.Date(date.getTime()) );
			pst1.setInt(4, slot);
			pst1.setInt(5, bookings);
			int x = 0;
			if(count + bookings <= 30){
				System.out.println("entered try executing update");
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
