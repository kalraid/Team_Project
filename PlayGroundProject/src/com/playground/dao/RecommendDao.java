package com.playground.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.playground.beans.ProjectReply;
import com.playground.beans.Recommend;
import com.playground.beans.RecommendReyply;


import com.playground.dao.DBManager;


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

		String prosql = "INSERT INTO Recommendgesipan"
				+ " VALUES(seq_Recommendgesipan.NEXTVAL,?,?,?,?,1,SYSDATE,0,?,?)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(prosql);
			pstmt.setString(1, Recommend.getId());
			pstmt.setString(2, Recommend.getPeople());
			pstmt.setString(3, Recommend.getLinklist());
			pstmt.setString(4, Recommend.getGesimul());
			pstmt.setString(5, Recommend.getPass());
			pstmt.setString(6, Recommend.getFile());
			
			System.out.println("id : " + Recommend.getId()+","+Recommend.getFile());
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
	
	//  리커멘드 게시판에서 글번호를 넣어서 리커멘드를 가져오는거
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
				Recommend.setFile(rs.getString("file1"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (SQLException e) {
			}
		}
		return Recommend;
	}

	public void UpdateRecommend(Recommend Recommend) {
		System.out.println("RecommendDao : " + Recommend);
		String updateSql = "UPDATE Recommendgesipan SET  linklist=?, id=?,pass=? ,people=?, dbdate=sysdate, good=?, gesimul=?,File1=?"
				+ " WHERE no=?";

		String sqlFileUpdate = "UPDATE Recommendgesipan SET  linklist=?, id=?,pass=? ,people=?, dbdate=sysdate, good=?, gesimul=?,File1=?"
				+ " WHERE no=?";
		try {

			// 번호 번호 제목 아이디 작성자 날짜 조회수 게시물 내용
			conn = DBManager.getConnection();
			if (Recommend.getFile() == null) {
				pstmt = conn.prepareStatement(updateSql);

				pstmt.setString(1, Recommend.getLinklist());
				pstmt.setString(2, Recommend.getId());
				pstmt.setString(3, Recommend.getPass());
				pstmt.setString(4, Recommend.getPeople());
				pstmt.setString(5, Recommend.getGood());
				pstmt.setString(6, Recommend.getGesimul());
				pstmt.setString(7, Recommend.getFile());
				pstmt.setInt(8, Recommend.getNo());
				System.out.println(Recommend.getNo());

			} else {
				pstmt = conn.prepareStatement(sqlFileUpdate);

				pstmt.setString(1, Recommend.getLinklist());
				pstmt.setString(2, Recommend.getId());
				pstmt.setString(3, Recommend.getPass());
				pstmt.setString(4, Recommend.getPeople());
				pstmt.setString(5, Recommend.getGood());
				pstmt.setString(6, Recommend.getGesimul());
				pstmt.setString(7, Recommend.getFile());
				pstmt.setInt(8, Recommend.getNo());
			}
			pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
			System.out.println("업로드끝");
		}
	}

	public boolean isPassCheck(int no, String pass) {
		boolean isPass = false;
		String sqlPass = "SELECT pass FROM Recommendgesipan WHERE no=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlPass);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isPass = rs.getString(1).equals(pass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return isPass;
	}

	public void deleteRecommend(int no) {

		String sqlDelete = "DELETE FROM Recommendgesipan WHERE no=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlDelete);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// 리커멘드 게시판에서 게시글 넘버를 리커멘드 리플리에 담아서 댓글용
	public ArrayList<RecommendReyply> getReplyList(int recommendNo) {

		String recommendListSql = "SELECT * FROM Recommendgesipan WHERE no=?" + "ORDER BY no DESC";
		RecommendReyply recommend = null;
		ArrayList<RecommendReyply> recommendList = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(recommendListSql);
			pstmt.setInt(1, recommendNo);

			rs = pstmt.executeQuery();

			recommendList = new ArrayList<RecommendReyply>();

			while (rs.next()) {

				recommend = new RecommendReyply();
				recommend.setNo(rs.getInt("no"));
				recommend.setRecommendNo(rs.getInt("no"));
				recommend.setRecommendreply(rs.getString("gesimul"));
				recommend.setRecommendwriter(rs.getString("people"));
				recommend.setRecommenddbdate(rs.getTimestamp("dbdate"));
				recommendList.add(recommend);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			System.out.println("ProjectDao - replyList(no)");
			DBManager.close(conn, pstmt, rs);
		}

		return recommendList;

	}
	
public void addReply(RecommendReyply p) {
		
		String replyInsertSql = "INSERT INTO Recommendgesipan  VALUES(seq_Recommendgesipan.NEXTVAL,?,?,?,SYSDATE )";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(replyInsertSql);
			
			pstmt.setInt(1, p.getRecommendNo());
			pstmt.setString(2, p.getRecommendreply());
			pstmt.setString(3, p.getRecommendwriter());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt,rs);
		}
		
		
	}

}
