package com.ts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.ts.dbutility.DBConnection;
import com.ts.dto.Resident;

public class ResidentDAO {

	public int add(Resident resident){
		final String QUERY="insert into Residents values(?,?,?,?,?,?,?,?,?,?)";
		final String USER_QUERY = "insert into users values(?,?,?)";
		final String SELECTQUERY = "insert into Bills values(?,?,?,?)";
		
		
		
		PreparedStatement pst = null;
		PreparedStatement pst1 = null;
		PreparedStatement pst3 = null;
		int status=0;
		
		try(Connection con=DBConnection.getConnection();) {
			pst1=con.prepareStatement(USER_QUERY);
			pst1.setString(1, resident.getFlatNo());
			pst1.setString(2, resident.getPassword());
			pst1.setInt(3, 2);
			
			pst=con.prepareStatement(QUERY);
			pst.setString(1, resident.getFlatNo());
			pst.setString(2, resident.getUserName());
			pst.setString(3, resident.getPassword());
			pst.setInt(4, resident.getFamilySize());
			pst.setString(5, resident.getContactNo());
			pst.setString(6, resident.getEmail());
			pst.setString(7, resident.getStatus());
			pst.setString(8, resident.getOccupation());
			pst.setString(9, resident.getPlace());
			pst.setString(10, resident.getOwnerContactNo());
			
			pst3 = con.prepareStatement(SELECTQUERY);
			pst3.setString(1,resident.getFlatNo());
			pst3.setDouble(2,0);
			pst3.setDouble(3,0);
			pst3.setDouble(4,0);
			
			
			pst1.executeUpdate();
			status=pst.executeUpdate();
			int rs1 = pst3.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	
}
	public List<Resident> getAllResidents(){
		List<Resident> list=new ArrayList<>();
		
		PreparedStatement pst = null;
		ResultSet rst = null;
	final String SELECT_QUERY = "select * from Residents";
	try(Connection con = DBConnection.getConnection();){
		pst = con.prepareStatement(SELECT_QUERY);
		rst = pst.executeQuery();
		while(rst.next()){
			Resident resident=new Resident();
			resident.setFlatNo(rst.getString(1));
			resident.setUserName(rst.getString(2));
			resident.setPassword(rst.getString(3));
			resident.setFamilySize(rst.getInt(4));
			resident.setContactNo(rst.getString(5));
			resident.setEmail(rst.getString(6));
			resident.setStatus(rst.getString(7));
			resident.setOccupation(rst.getString(8));
			resident.setPlace(rst.getString(9));
			resident.setOwnerContactNo(rst.getString(10));
			
			list.add(resident);
		}
		Collections.sort(list);
		System.out.println(list.toString());
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	}
	public Resident getResident(String flatNo) {
		PreparedStatement pst = null;
		ResultSet rst = null;
		Resident resident=null;
	final String SELECT_QUERY = "select * from Residents where flatNo=?";
	try(Connection con = DBConnection.getConnection();){
		
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setString(1, flatNo);
		rst = pst.executeQuery();
		if(rst.next()){
			 resident =new Resident();
			 resident.setFlatNo(rst.getString(1));
			 resident.setUserName(rst.getString(2));
				resident.setPassword(rst.getString(3));
				resident.setFamilySize(rst.getInt(4));
				resident.setContactNo(rst.getString(5));
				resident.setEmail(rst.getString(6));
				resident.setStatus(rst.getString(7));
				resident.setOccupation(rst.getString(8));
				resident.setPlace(rst.getString(9));
				resident.setOwnerContactNo(rst.getString(10));
		System.out.println(resident);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return resident;// TODO Auto-generated method stub
		
	}
	
	public Resident getResidentProfile(String userId,String password){
		
		PreparedStatement pst = null;
		
		ResultSet rst = null;
		Resident resident=null;
	final String SELECT_QUERY = "select * from Residents where flatNo = ? and password = ?";
	try(Connection con = DBConnection.getConnection();){
		
		pst = con.prepareStatement(SELECT_QUERY);
		pst.setString(1, userId);
		pst.setString(2, password);
		rst = pst.executeQuery();
		while(rst.next()){
			 resident =new Resident();
			 resident.setFlatNo(rst.getString(1));
			 resident.setUserName(rst.getString(2));
				resident.setPassword(rst.getString(3));
				resident.setFamilySize(rst.getInt(4));
				resident.setContactNo(rst.getString(5));
				resident.setEmail(rst.getString(6));
				resident.setStatus(rst.getString(7));
				resident.setOccupation(rst.getString(8));
				resident.setPlace(rst.getString(9));
				resident.setOwnerContactNo(rst.getString(10));
		System.out.println(resident);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return resident;
	}
	
}


