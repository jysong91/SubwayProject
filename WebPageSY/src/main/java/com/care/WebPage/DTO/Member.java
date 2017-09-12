package com.care.WebPage.DTO;

// 로그인은 많이 쓰이므로, 로그인 할때에는 필요한 정보만 사용하기위해 Login DTO는 따로 만들고, 
// 나머지들로 그걸 상속받는 Member클래스를 만든다.
public class Member extends Login{
	private String email; 
	private String gender; 
	private String zipcode; 
	private String addr1; 
	private String addr2;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	} 

}
