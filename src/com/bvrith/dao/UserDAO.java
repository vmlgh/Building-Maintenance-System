package com.ts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ts.dbutility.DBConnection;

public class UserDAO {
	public int getUserType(String id,String password){
		final String QUERY="select type from users where userId=? and password=?";
		PreparedStatement pst = null;
		System.out.println("inuserDAO:" + id);
		
		int type = 0;
		ResultSet rst = null;
		
		try(Connection con=DBConnection.getConnection();) {
			
			pst=con.prepareStatement(QUERY);
			pst.setString(1, id);
			pst.setString(2, password);
			rst =  pst.executeQuery();
			if(rst.next()){
				type = rst.getInt(1);
				System.out.println("type:" + type);
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return type;
	}
}
