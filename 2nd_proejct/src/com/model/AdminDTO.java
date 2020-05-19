package com.model;

public class AdminDTO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String phone;
	private String address;
	private String hireDate;
	
	

	public AdminDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public AdminDTO(String id, String pw, String name, String birth, String phone, String address, String hireDate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.hireDate = hireDate;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getId() {
		return id;
	}
}
