package com.ts.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ts.dao.ResidentDAO;
import com.ts.dao.UserDAO;
import com.ts.dto.Resident;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		session.setAttribute("loggedUser", userName);
		//session.setAttribute("flatNo", userName);
		
		
		response.setContentType("text/html");
	    	
		UserDAO user = new UserDAO();
	    int type = user.getUserType(userName, password);
	    System.out.println(type);
	    if(type == 1) {
//	    	session.removeAttribute("flatNo");
	    	RequestDispatcher dispatcher=request.getRequestDispatcher("secretaryHometry1.jsp");	
	    	request.setAttribute("activeTab", "getrinfo");
	    	session.setAttribute("flatNo", "");
	    	request.setAttribute("resident", null);
	    	session.setAttribute("resident", null);
			dispatcher.forward(request, response);
	    } else if(type == 2) {
//	    	ResidentDAO residentDAO = new ResidentDAO();
//	    	Resident resident = residentDAO.getResidentProfile(userName,password);
//	    	if(resident != null){
	    		RequestDispatcher dispatcher=request.getRequestDispatcher("ResidentProfileTry.jsp");
	    		//session.setAttribute("resident", resident);
	    		session.setAttribute("userName", userName);
	    		session.setAttribute("password", password);
//	    		response.getWriter().println("<div style='max-width: 500px;height: 50px;position:sticky;top:0;right:0;' class=\"alert alert-dismissible alert-success\">\r\n" + "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
//	    				"  <strong>Well done!</strong> You logged in <a href=\"#\" class=\"alert-link\">successfully</a>.\r\n" + 
//	    				"</div>");
	    		dispatcher.forward(request, response);
	    	//}
	    } else if(type == 3) {
	    	session.setAttribute("flatNo", "");
	    	request.setAttribute("resident", null);
	    	session.setAttribute("resident", null);
	    	RequestDispatcher dispatcher=request.getRequestDispatcher("SecurityHomeTry.jsp");	
			dispatcher.forward(request, response);
	    } else {
	    	response.sendRedirect("welcome.html");
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
