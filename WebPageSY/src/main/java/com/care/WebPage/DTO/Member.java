package com.care.WebPage.DTO;

// �α����� ���� ���̹Ƿ�, �α��� �Ҷ����� �ʿ��� ������ ����ϱ����� Login DTO�� ���� �����, 
// ��������� �װ� ��ӹ޴� MemberŬ������ �����.
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
