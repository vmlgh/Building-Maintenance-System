package com.ts.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ts.dao.ResidentDAO;
import com.ts.dto.Resident;






/**
 * Servlet implementation class ResidentDetailsServlet
 */
@WebServlet("/ResidentServlet")
public class ResidentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String flatNo=request.getParameter("flatNo");
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		int familySize = Integer.parseInt(request.getParameter("familySize"));
		String contactNo = request.getParameter("contactNo");
		String email = request.getParameter("email");
		String status = request.getParameter("status");
		String occupation = request.getParameter("occupation");
		String place = request.getParameter("place");
		String ownerContactNo = request.getParameter("ownerContactNo");
		
		Resident resident=new Resident();
		resident.setFlatNo(flatNo);
		resident.setUserName(userName);
		resident.setPassword(password);
		resident.setFamilySize(familySize);
		resident.setContactNo(contactNo);
		resident.setEmail(email);
		resident.setStatus(status);
		resident.setOccupation(occupation);
		resident.setPlace(place);
		resident.setOwnerContactNo(ownerContactNo);
		
		response.setContentType("text/html");                                  
		//System.out.println(resident.getUserName());
		ResidentDAO residentDAO=new ResidentDAO();
		if(residentDAO.add(resident)!=0){
		
		//response.getWriter().println("<h1>Registration Success</h1>");
		RequestDispatcher dispatcher=request.getRequestDispatcher("secretaryHometry1.jsp");
    	session.setAttribute("resident", null);
    	session.setAttribute("activeTab", "getrinfo");
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
