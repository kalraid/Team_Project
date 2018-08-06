package com.playground.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.playground.beans.Recommend;

public class RecommendDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static DataSource ds;
	private static RecommendDao instance = new RecommendDao();
	
	private RecommendDao() {
	}

	public static RecommendDao getInstance() {
		return instance;
	}

	static {
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:/comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/apiDBPool");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Connection getConnection() {
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int getRecommendCount(String tab, String keyword) {
		int count = 0;
		try {

			String sql = "SELECT Count(*) FROM Recommendgesipan ";

			if (!tab.equals("all")) {
				sql += "WHERE " + tab + " LIKE '%'||'" + keyword + "'||'%'";
			}

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	public ArrayList<Recommend> getRecommend(int pagenum, String tab, String keyword) {
		ArrayList<Recommend> proList = null;
		try {

			String sql = "SELECT * FROM (SELECT ROWNUM num, t1.*  FROM (SELECT * FROM Recommendgesipan ";

			if (!tab.equals("all")) {
				sql += "WHERE " + tab + " LIKE '%'||'" + keyword + "'||'%' ";
			}

			sql += "order by no desc)  t1)  WHERE num BETWEEN ? and ?";

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, (((pagenum * 10) / 10) * 10) - 9);
			pstmt.setInt(2, ((pagenum * 10) / 10) * 10);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				proList = new ArrayList<Recommend>();

				do {
					Recommend p = new Recommend();

					p.setNo(rs.getInt("no"));
					p.setLinklist(rs.getString("linklist"));
					p.setId(rs.getString("id"));
					p.setGesimul(rs.getString("gesimul"));
					p.setTableNum(rs.getInt("tablenum"));
					p.setPeople(rs.getString("people"));
					p.setDbdate(rs.getTimestamp("dbdate"));
					p.setGood(rs.getString("good"));

					proList.add(p);

				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return proList;
	}
	
	
	public ArrayList<Recommend> getRecommend() {
		ArrayList<Recommend> proList = null;
		try {

			String sql = "SELECT * FROM Recommendgesipan";

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			proList = new ArrayList<Recommend>();

			while (rs.next()) {
				Recommend p = new Recommend();

				p.setNo(rs.getInt("no"));
				p.setLinklist(rs.getString("linklist"));
				p.setId(rs.getString("id"));
				p.setPass(rs.getString("pass"));
				p.setGesimul(rs.getString("gesimul"));
				p.setTableNum(rs.getInt("tablenum"));
				p.setPeople(rs.getString("people"));
				p.setDbdate(rs.getTimestamp("dbdate"));
				p.setGood(rs.getString("good"));
				proList.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return proList;
	}
	
	public void insertRecommend(Recommend Recommend) {

		String prosql = "INSERT INTO Recommendgesipan(no , linklist , id, people ,gesimul,pass, dbdate,good)"
				+ "VALUES(seq_gesipan.NEXTVAL,?,?,?,?,1,sysdate,0,?,NULL,0)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(prosql);
			pstmt.setString(1, Recommend.getLinklist());
			pstmt.setString(2, Recommend.getId());
			pstmt.setString(3, Recommend.getPeople());
			pstmt.setString(4, Recommend.getGesimul());
			pstmt.setString(5, Recommend.getPass());

			System.out.println("id : " + Recommend.getId());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	
	public Recommend getRecommend(int no) {
		String sqlproList = "SELECT * FROM Recommendgesipan WHERE no=?";
		Recommend Recommend = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlproList);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Recommend = new Recommend();

				Recommend.setNo(rs.getInt("no"));
				Recommend.setPass(rs.getString("pass"));
				Recommend.setId(rs.getString("id"));
				Recommend.setGesimul(rs.getString("gesimul"));
				Recommend.setLinklist(rs.getString("linklist"));
				Recommend.setTableNum(rs.getInt("tableNum"));
				Recommend.setPeople(rs.getString("people"));
				Recommend.setPass(rs.getString("pass"));
				Recommend.setDbdate(rs.getTimestamp("dbdate"));
				Recommend.setGood(rs.getString("good"));
				Recommend.setRecommend(rs.getInt("good2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return Recommend;
	}



}
