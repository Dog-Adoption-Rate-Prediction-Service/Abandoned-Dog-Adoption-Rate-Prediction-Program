package com.model;

import java.util.ArrayList;

public class BoardDTO {
	private int num;
	private String title;
	private String content;
	private String date;
	private String written;
	private ArrayList<String> img;

	public BoardDTO() {

	}
	
	public BoardDTO(int num, String title, String content, String date, String written) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.date = date.substring(5,10);
		this.written = written;
	}

	public BoardDTO(int num, String title, String content, String date, String written, ArrayList<String> img) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.date = date.substring(5,10);
		this.written = written;
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWritten() {
		return written;
	}

	public void setWritten(String written) {
		this.written = written;
	}

	public ArrayList<String> getImg() {
		return img;
	}

	public void setImg(ArrayList<String> img) {
		this.img = img;
	}

	public int getNum() {
		return num;
	}
}
