package com.model;

import java.util.ArrayList;

public class Test {

	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		ArrayList<AdoptDTO> list = new ArrayList<AdoptDTO>();
		list = dao.LoadAdopt(1);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getNoticeNum());
		}
		System.out.println(dao.CountAdopt());
	}
	

}
