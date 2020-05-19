package com.model;

public class AdoptDTO {
	private String num;
	private String noticeNum;
	private String limitDate;
	private String day;
	private String kind;
	private String sex;
	private String centerName;
	private String phone;
	private String link;
	private String img;

	public AdoptDTO() {

	}

	public AdoptDTO(String num, String noticeNum, String limitDate, String day, String kind, String sex,
			String centerName, String phone, String link, String img) {
		super();
		this.num = num;
		this.noticeNum = noticeNum;
		this.limitDate = limitDate;
		this.day = day;
		this.kind = kind;
		this.sex = sex;
		this.centerName = centerName;
		this.phone = phone;
		this.link = link;
		this.img = img;
	}

	public String getNum() {
		return num;
	}

	public String getNoticeNum() {
		return noticeNum;
	}

	public String getLimitDate() {
		return limitDate;
	}

	public String getDay() {
		return day;
	}

	public String getKind() {
		return kind;
	}

	public String getSex() {
		return sex;
	}

	public String getCenterName() {
		return centerName;
	}

	public String getPhone() {
		return phone;
	}

	public String getLink() {
		return link;
	}

	public String getImg() {
		return img;
	}

}
