package com.ts.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.dao.ResidentDAO;
import com.ts.dto.Resident;

/**
 * Servlet implementation class DisplayAllResidents
 */
@WebServlet("/DisplayAllResidents")
public class DisplayAllResidents extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResidentDAO dao=new ResidentDAO();
		
		List<Resident> residentList=dao.getAllResidents();
		RequestDispatcher dispatcher=request.getRequestDispatcher("/displayAllResidents1.jsp");
		request.setAttribute("residentList", residentList);
		dispatcher.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
