package com.playground.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.playground.dao.DBManager;

public class dbInsert {
	Connection conn;

	PreparedStatement pstmt;
	ResultSet rs;

	public int st_check(String name) {
		conn = DBManager.getConnection();
		String pChecksql = "SELECT s_thema_num FROM smallthema where s_thema_name = ? ";
		int num = 0;
		try {
			pstmt = conn.prepareStatement(pChecksql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt("s_thema_num");
				System.out.println("가져온 소테마 번호 : " + num);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);

		}

		return num;
	}

	public void P_insert(ArrayList<placeinsert> result) {
		String sql = "INSERT INTO place VALUES " + "(PLACE_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		int sum = 0;
		try {
			for (int i = 0; i < result.size(); i++) {
				conn = DBManager.getConnection();
				int resultnum = 0;
				try {
					placeinsert p = result.get(i);

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, p.getNames());
					pstmt.setString(2, p.getTypes().toString());
					pstmt.setDouble(3, p.getLats());
					pstmt.setDouble(4, p.getLngs());
					pstmt.setString(5, p.getPhoto_references());
					pstmt.setObject(6, p.getRatings());
					pstmt.setString(7, p.getVicinitys());

					resultnum = pstmt.executeUpdate();
					sum += resultnum;
					System.out.println(i + "번째 내용이 등록되었습니다.");

				} catch(SQLIntegrityConstraintViolationException e) {
					System.out.println(i+"번 내용이 이미 들어있습니다.");
				}catch (SQLException e) {
				
					/* System.out.println(i + "번째 내용이 등록되지 못했습니다. SQL문을 확인해 주세요"); */
					/*
					 * e.getMessage(); e.getSQLState(); e.getCause(); e.getErrorCode();
					 */
					e.printStackTrace();
				}catch (NullPointerException e) {
					e.printStackTrace();
				}finally {

					DBManager.close(conn, pstmt);
				}
				Thread.sleep(200);
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DBManager.close(conn, pstmt);
		}

	}

	public ArrayList<Integer> pn_check(ArrayList<placeinsert> result) {
		// name에 해당하는 번호를 가져오는 부분

		String checkSql = "SELECT PLACE_NUM FROM place where  place_name  = ?";
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			
			for (int i = 0; i < result.size(); i++) {
				try {
					conn = DBManager.getConnection();
					placeinsert p = result.get(i);
					pstmt = conn.prepareStatement(checkSql);
					pstmt.setString(1, p.getNames());
					rs = pstmt.executeQuery();

					if (rs.next()) {
						list.add(rs.getInt("PLACE_NUM"));
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBManager.close(conn, pstmt, rs);
				}

			}
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;

	}

	public void lastInsert(ArrayList<Integer> list, int num) {

		int p_t_sum = 0;
		try {
			for (int j = 0; j < list.size(); j++) {
				conn = DBManager.getConnection();
				String sql = "INSERT INTO pla_thema values(p_thema_SEQ.nextval, ?,?)";
				int p_t_num = 0;
				System.out.println("두번째 for문 " + j + "번째");

				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, list.get(j));
					pstmt.setInt(2, num);
					p_t_num = pstmt.executeUpdate();
					p_t_sum += p_t_num;
					System.out.println(p_t_sum + "번 장소가"+num+"번 소테마로 pla_thema에 입력되었습니다");
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBManager.close(conn, pstmt);
				}
				Thread.sleep(200);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		System.out.println(p_t_sum + "개가 pla_thema에 입력되었습니다.");

	}

}
