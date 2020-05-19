package com.model;

import java.sql.SQLException;

public class AdminDAO extends BaseDAO {
	public AdminDTO login(AdminDTO admin) {

		getConnection();

		String sql = "select * from admin where id = ? and pw = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, admin.getId());
			psmt.setString(2, admin.getPw());
			rs = psmt.executeQuery();

			if (rs.next()) {
				admin = new AdminDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				close();
				return admin;

			} else {
				System.out.println("로그인 실패");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return null;

	}

	public int writeNotice(String title, String content, String written) {
		int cnt = 0;
		getConnection();

		String sql = "insert into notice values(notice_num_seq.nextval,'" + title + "','" + content + "',sysdate,'"
				+ written + "')";

		try {
			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, title);
//			psmt.setString(2, content);
//			psmt.setString(3, written);

			cnt = psmt.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
}
