package com.ts.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.dao.ResidentDAO;
import com.ts.dao.VisitorDAO;
import com.ts.dto.Visitor;

/**
 * Servlet implementation class VisitorServlet
 */
@WebServlet("/VisitorServlet")
public class VisitorServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flatNo=request.getParameter("flatNo");
		String visitorName=request.getParameter("visitorName");
		int noOfVisitors = Integer.parseInt(request.getParameter("noOfVisitors"));
		String purpose = request.getParameter("purpose");
		
		Visitor visitor = new Visitor();
		visitor.setFlatNo(flatNo);
		visitor.setVisitorName(visitorName);
		visitor.setNoOfVisitors(noOfVisitors);
		visitor.setPurpose(purpose);
		
		response.setContentType("text/html"); 
		
		VisitorDAO visitorDAO=new VisitorDAO();
		if(visitorDAO.add(visitor)!=0){
		
//		response.getWriter().println("<h1>Visitor details added</h1>");
		RequestDispatcher dispatcher=request.getRequestDispatcher("SecurityHomeTry.jsp");
		dispatcher.include(request, response);
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
