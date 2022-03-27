package com.ts.dto;

public class Resident implements Comparable<Resident> {
	private String flatNo;
	private String userName;
	private String password;
	private int familySize;
	private String contactNo;
	private String email;
	private String status;
	private String occupation;
	private String place;
	private String ownerContactNo;
	
	public String getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(String flatNo) {
		this.flatNo = flatNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getFamilySize() {
		return familySize;
	}
	public void setFamilySize(int familySize) {
		this.familySize = familySize;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public String getStatus(){
		return status;
	}
	public void setStatus(String status){
		this.status = status;
	}
	public String getOccupation(){
		return occupation;
	}
	public void setOccupation(String occupation){
		this.occupation = occupation;
	}
	public String getPlace(){
		return place;
	}
	public void setPlace(String place){
		this.place = place;
	}
	public String getOwnerContactNo(){
		return ownerContactNo;
	}
	public void setOwnerContactNo(String ownerContactNo){
		this.ownerContactNo = ownerContactNo;
	}
	//public String toString() {
		//return;
	//}
	@Override
	public int compareTo(Resident r) {
		// TODO Auto-generated method stub
		return Integer.parseInt(this.getFlatNo()) - Integer.parseInt(r.getFlatNo());
	}
	public String toString() {
		return this.getFlatNo() + "," + this.getUserName();
	}

}
