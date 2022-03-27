package com.ts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.*;

import com.ts.dbutility.DBConnection;
import com.ts.dto.Resident;
import com.ts.dto.Visitor;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class VisitorDAO {

	public int add(Visitor visitor){
		final String QUERY="insert into Visitors (flatNo, visitorName, noOfVisitors, purpose) values (?,?,?,?)";
		final String PNO_QUERY = "select contactNo from residents where flatNo = ?";
		
		PreparedStatement pst = null;
		PreparedStatement pst1 = null;
		ResultSet rs = null;
		String ph_number = "";
		VisitorDAO v = new VisitorDAO();
//		Timestamp t = v.getTime(visitor.getFlatNo(), visitor.getVisitorName());
//		String sms_message = "Please note - " + visitor.getVisitorName() + " has come for you. " + "Purpose - " + visitor.getPurpose() + "."+"at "+t;
//		System.out.println(sms_message);
		
		int status=0;
		
		try(Connection con=DBConnection.getConnection();) {
			pst=con.prepareStatement(QUERY);
			pst1 = con.prepareStatement(PNO_QUERY);
			
			pst.setString(1, visitor.getFlatNo());
			pst.setString(2, visitor.getVisitorName());
			pst.setInt(3, visitor.getNoOfVisitors());
			pst.setString(4, visitor.getPurpose());
	
			pst1.setString(1, visitor.getFlatNo());
			
			status=pst.executeUpdate();
			
			Timestamp t = v.getTime(visitor.getFlatNo(), visitor.getVisitorName());
			String sms_message = "Please note - " + visitor.getVisitorName() + " has come for you. " + "Purpose - " + visitor.getPurpose() +" at "+t;
			System.out.println(sms_message);
			rs = pst1.executeQuery();
			
			while(rs.next()) {
				ph_number = rs.getString(1);
				System.out.println(ph_number);
			}
			
			try {
				// Construct data
				String apiKey = "apikey=" + URLEncoder.encode("UgEVRITI+3s-yQoru3YpdRiuFge3GYFJ7h6KLsl9tb", "UTF-8");
				String message = "&message=" + URLEncoder.encode(sms_message, "UTF-8");
				String sender = "&sender=" + URLEncoder.encode("TXTLCL", "UTF-8");
				String numbers = "&numbers=" + URLEncoder.encode(ph_number, "UTF-8");
				
				// Send data
				String data = "https://api.textlocal.in/send/?" + apiKey + numbers + message + sender;
				URL url = new URL(data);
				URLConnection conn = url.openConnection();
				conn.setDoOutput(true);
				
				// Get the response
				BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line;
				String sResult="";
				while ((line = rd.readLine()) != null) {
				// Process line...
					sResult=sResult+line+" ";
				}
				rd.close();
				
				System.out.println(sResult);
			} catch (Exception e) {
				System.out.println("Error SMS "+e);
				System.out.println("Error "+e);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	
}
	public List<Visitor> getVisitorDetails(String flatNo) {
		List<Visitor> list=new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rst = null;
	final String SELECT_QUERY = "select * from Visitors where flatNo = ?";
	try(Connection con = DBConnection.getConnection();){
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setString(1, flatNo);
		rst = pst.executeQuery();
		while(rst.next()){
			Visitor visitor=new Visitor();
			visitor.setFlatNo(rst.getString(1));
			visitor.setVisitorName(rst.getString(2));
			visitor.setNoOfVisitors(rst.getInt(3));
			visitor.setVisitTime(rst.getTimestamp(4));
			visitor.setPurpose(rst.getString(5));
			list.add(visitor);
		}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	return list;
	}
	
	public Timestamp getTime(String flatNo, String name) {
		final String QUERY = "select visitTime from visitors where flatNo = ? and visitorName = ?";
		PreparedStatement pst = null;
		ResultSet rst = null;
		Timestamp t = null;
		System.out.println(flatNo + " " + name);
		try(Connection con = DBConnection.getConnection();){
			pst = con.prepareStatement(QUERY);
			pst.setString(1, flatNo);
			pst.setString(2, name);
			rst = pst.executeQuery();
			System.out.println("entered");
			while(rst.next()){
				t = rst.getTimestamp("visitTime");
				System.out.println(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t;
	}
}