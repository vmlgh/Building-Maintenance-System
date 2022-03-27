package com.ts.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.dao.VisitorDAO;
import com.ts.dto.Visitor;

/**
 * Servlet implementation class GetVisitorDetails
 */
@WebServlet("/GetVisitorDetails")
public class GetVisitorDetails extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flatNo = request.getParameter("flatNo");
		System.out.println(flatNo);
        VisitorDAO dao=new VisitorDAO();
		
		List<Visitor> visitorList=dao.getVisitorDetails(flatNo);
		for(Visitor visitor : visitorList) {
			System.out.println(visitor.getVisitTime());
		}
		request.setAttribute("visitorList", visitorList);
		request.setAttribute("activeTab", "getvinfo");
		RequestDispatcher dispatcher=request.getRequestDispatcher("/SecurityHomeTry.jsp");
		dispatcher.forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
