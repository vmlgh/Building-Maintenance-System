package com.ts.dto;
//import java.sql.Date;
import java.sql.Timestamp;

public class Visitor {
	private String flatNo;
	private String visitorName;
	private int noOfVisitors;
	private Timestamp visitTime;
	private String purpose;
	public String getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(String flatNo) {
		this.flatNo = flatNo;
	}
	public String getVisitorName() {
		return visitorName;
	}
	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}
	public int getNoOfVisitors() {
		return noOfVisitors;
	}
	public void setNoOfVisitors(int noOfVisitors) {
		this.noOfVisitors = noOfVisitors;
	}
	public void setVisitTime(Timestamp visitTime) {
		this.visitTime = visitTime;
	}
	public Timestamp getVisitTime() {
		return visitTime;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	
	
}
