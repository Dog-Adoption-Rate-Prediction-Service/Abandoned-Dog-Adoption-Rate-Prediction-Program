package com.model;

import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO extends BaseDAO {
	public ArrayList<BoardDTO> LoadNotice(){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		getConnection();
		
		String sql = "select * from notice order by num";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new BoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),(rs.getString(5))));
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		
		return list;
	}
	public ArrayList<AdoptDTO> LoadAdopt(int num){
		ArrayList<AdoptDTO> list = new ArrayList<AdoptDTO>();
		
		getConnection();
		
		String sql = "select * from dogs_view where num > ? and num < ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, (num-1)*10);
			psmt.setInt(2,num*10+1);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(new AdoptDTO(rs.getString(1), rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
						rs.getString(8),rs.getString(9),rs.getString(10)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		
		return list;
	}
	public ArrayList<BoardDTO> LoadNotice(int num){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		getConnection();
		
		//String sql = "select * from notice where rownum between ? and ? order by num desc";
		String sql = "select * from notice_view where notice_num >? and notice_num < ?";
		//중앙 행 추출하기

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, (num-1)*10);
			psmt.setInt(2, num*10+1);		
			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new BoardDTO(rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),(rs.getString(6))));
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		
		return list;
	}
	
	public ArrayList<BoardDTO> LoadNotice(int num, int len){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		getConnection();
		
		//String sql = "select * from notice where rownum between ? and ? order by num desc";
		String sql = "select * from notice_view where notice_num >? and notice_num < ?";
		//중앙 행 추출하기

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, (num-1)*10);
			psmt.setInt(2, num*10+len+1);		
			rs = psmt.executeQuery();

			while (rs.next()) {
				list.add(new BoardDTO(rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),(rs.getString(6))));
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		
		return list;
	}
	
	public BoardDTO SelectNotice(int num){
		BoardDTO board = new BoardDTO();
		getConnection();
		
		String sql = "select * from notice where num = " + num;

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				board = new BoardDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),(rs.getString(5)));
			}
			close();
			return board;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		
		return null;
	}
	
	public int CountAdopt() {
		int num = 0;
		getConnection();
		
		String sql = "Select count(num) from dogs_view";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			num = rs.getInt(1);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return num;
	}
	
	public int CountNotice() {
		
		int num = 0;
		getConnection();
		
		String sql = " SELECT COUNT(NUM) FROM NOTICE";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			num = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return num;
	}
	
	public ArrayList<AdoptDTO> LoadAdoptPre(int num){
		ArrayList<AdoptDTO> list = new ArrayList<AdoptDTO>();
		
		getConnection();
		
		String sql = "select * from dogs_view_pre where num > ? and num < ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, (num-1)*10);
			psmt.setInt(2,num*10+1);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(new AdoptDTO(rs.getString(1), rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
						rs.getString(8),rs.getString(9),rs.getString(10)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		
		return list;
	}

	public int CountAdoptPre() {
		int num = 0;
		getConnection();
		
		String sql = "Select count(num) from dogs_view_pre";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			num = rs.getInt(1);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return num;
	}
		
	
	public ArrayList<BoardDTO> LoadAdoptBoard(){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		return list;
	}
}
