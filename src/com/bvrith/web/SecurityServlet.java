package com.ts.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.dao.ResidentDAO;
import com.ts.dao.VisitorDAO;
import com.ts.dto.Resident;
import com.ts.dto.Visitor;

/**
 * Servlet implementation class SecurityServlet
 */
@WebServlet("/SecurityServlet")
public class SecurityServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");

		if ("GetVisitorDetailsServlet".equals(action)) {
		    // Invoke FirstServlet's job here.
			String flatNo = request.getParameter("flatNo");
			System.out.println(flatNo);
	        VisitorDAO dao=new VisitorDAO();
			
			List<Visitor> visitorList=dao.getVisitorDetails(flatNo);
			for(Visitor visitor : visitorList) {
				System.out.println(visitor.getVisitTime());
			}
			request.setAttribute("visitorList", visitorList);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/displayVisitorDetails.jsp");
			dispatcher.forward(request, response);	
			
		} else if ("SecurityResidentServlet".equals(action)) {
		    // Invoke SecondServlet's job here.
			PrintWriter out=response.getWriter();
			String flatNo = request.getParameter("flatNo");
			System.out.println(flatNo);
			ResidentDAO residentDAO = new ResidentDAO();
			Resident resident = residentDAO.getResident(flatNo);
			if(resident != null){
			RequestDispatcher dispatcher=request.getRequestDispatcher("/securityResident.jsp");
			request.setAttribute("resident", resident);
			response.setContentType("text/html");
			dispatcher.forward(request, response);
			} else {
				//RequestDispatcher dispatcher = request.getRequestDispatcher("SecretaryHome.jsp");
				out.println("<body bgcolor=white text=#CODO22><h3>flat is unoccupied</body>");
				RequestDispatcher dispatcher=request.getRequestDispatcher("/SecurityHome.jsp");
						dispatcher.include(request, response);		
				//response.sendRedirect("SecretaryHome.jsp");
			}
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
