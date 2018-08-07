package com.playground.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.playground.beans.Project;
import com.playground.beans.ProjectReply;
import com.playground.beans.Recommend;

public class ProjectDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static DataSource ds;
	private static ProjectDao instance = new ProjectDao();

	private ProjectDao() {
	}

	public static ProjectDao getInstance() {
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

	public int getProjectCount(String tab, String keyword) {
		int count = 0;
		try {

			String sql = "SELECT Count(*) FROM gesipan ";

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

	public ArrayList<Project> getProject(int pagenum, String tab, String keyword) {
		ArrayList<Project> proList = null;
		try {

			String sql = "SELECT * FROM (SELECT ROWNUM num, t1.*  FROM (SELECT * FROM gesipan ";

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

				proList = new ArrayList<Project>();

				do {
					Project p = new Project();

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

	public ArrayList<Project> getProject() {
		ArrayList<Project> proList = null;
		try {

			String sql = "SELECT * FROM gesipan";

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			proList = new ArrayList<Project>();

			while (rs.next()) {
				Project p = new Project();

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

	public void insertproject(Project Project) {

		String prosql = "INSERT INTO gesipan" 
				+ " VALUES(seq_gesipan.NEXTVAL,?,?,?,?,1,SYSDATE,0,?,null,0)";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(prosql);
			pstmt.setString(1, Project.getId());
			pstmt.setString(2, Project.getPeople());
			pstmt.setString(3, Project.getLinklist());
			pstmt.setString(4, Project.getGesimul());
			pstmt.setString(5, Project.getPass());

			System.out.println("id : " + Project.getId());
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

	public Project getproject(int no) {
		String sqlproList = "SELECT * FROM gesipan WHERE no=?";
		Project Project = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlproList);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Project = new Project();

				Project.setNo(rs.getInt("no"));
				Project.setPass(rs.getString("pass"));
				Project.setId(rs.getString("id"));
				Project.setGesimul(rs.getString("gesimul"));
				Project.setLinklist(rs.getString("linklist"));
				Project.setTableNum(rs.getInt("tableNum"));
				Project.setPeople(rs.getString("people"));
				Project.setPass(rs.getString("pass"));
				Project.setDbdate(rs.getTimestamp("dbdate"));
				Project.setGood(rs.getString("good"));
				Project.setRecommend(rs.getInt("good2"));
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
		return Project;
	}

	public void UpdateProject(Project Project) {

		String updateSql = "UPDATE gesipan SET  linklist=?, id=?,pass=? ,people=?, dbdate=sysdate, good=?, gesimul=?"
				+ " WHERE no=?";

		String sqlFileUpdate = "UPDATE gesipan SET  linklist=?, id=?,pass=? ,people=?, dbdate=sysdate, good=?, gesimul=?"
				+ " WHERE no=?";
		try {

			// 번호 번호 제목 아이디 작성자 날짜 조회수 게시물 내용
			conn = DBManager.getConnection();
			if (Project.getFile1() == null) {
				pstmt = conn.prepareStatement(updateSql);

				pstmt.setString(1, Project.getLinklist());
				pstmt.setString(2, Project.getId());
				pstmt.setString(3, Project.getPass());
				pstmt.setString(4, Project.getPeople());
				pstmt.setString(5, Project.getGood());
				pstmt.setString(6, Project.getGesimul());
				pstmt.setInt(7, Project.getNo());
				System.out.println(Project.getNo());

			} else {
				pstmt = conn.prepareStatement(sqlFileUpdate);

				pstmt.setString(1, Project.getLinklist());
				pstmt.setString(2, Project.getId());
				pstmt.setString(3, Project.getPass());
				pstmt.setString(4, Project.getPeople());
				pstmt.setString(5, Project.getGood());
				pstmt.setString(6, Project.getGesimul());
				pstmt.setInt(7, Project.getNo());
			}
			int e = pstmt.executeUpdate();
			System.out.println("e : " + e);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
			System.out.println("업로드끝");
		}
	}

	public boolean isPassCheck(int no, String pass) {
		boolean isPass = false;
		String sqlPass = "SELECT pass FROM gesipan WHERE no=?";
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

	public void deleteProject(int no) {

		String sqlDelete = "DELETE FROM gesipan WHERE no=?";
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

	public ArrayList<ProjectReply> getReplyList(int projectNo) {

		String replyListSql = "SELECT * FROM ProjectReply WHERE projectNo=?" + "ORDER BY no DESC";
		ProjectReply reply = null;
		ArrayList<ProjectReply> replyList = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(replyListSql);
			pstmt.setInt(1, projectNo);

			rs = pstmt.executeQuery();

			replyList = new ArrayList<ProjectReply>();

			while (rs.next()) {

				reply = new ProjectReply();
				reply.setNo(rs.getInt("no"));
				reply.setProjectNo(rs.getInt("projectNo"));
				reply.setProjectreply(rs.getString("projectreply"));
				reply.setProjectwriter(rs.getString("projectWriter"));
				reply.setProjectdbdate(rs.getTimestamp("projectdbdate"));
				replyList.add(reply);

			} // 어디서 문제인지 못찾겠네 syso좀 할게

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			System.out.println("ProjectDao - replyList(no)");
			DBManager.close(conn, pstmt, rs);
		}

		return replyList;

	}

	public ArrayList<Integer> getRecommend(int no) {
		ArrayList<Integer> re = new ArrayList<Integer>();
		int recommend = 0;
		System.err.println(1);
		String addRecommendSql = "UPDATE gesipan set good2=good2 + 1 WHERE no=?";
		String selectResultSql = "SELECT good2 FROM gesipan WHERE no=?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(addRecommendSql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			System.err.println(2);
			pstmt = conn.prepareStatement(selectResultSql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				recommend = rs.getInt("good2");
				System.err.println(3);
			}

			DBManager.commit(conn);
			System.err.println(4);
			re.add(recommend);
		} catch (Exception e) {
			DBManager.rollback(conn);
			System.out.println("추천수 수정이 실패했습니다");
			e.printStackTrace();

		} finally {
			DBManager.close(conn, pstmt, rs);
			System.err.println(5);
		}

		return re;

	}

	public void addReply(ProjectReply p) {

		String replyInsertSql = "INSERT INTO ProjectReply  VALUES(ProjectReply_seq.NEXTVAL,?,?,?,SYSDATE )";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(replyInsertSql);

			pstmt.setInt(1, p.getProjectNo());
			pstmt.setString(2, p.getProjectreply());
			pstmt.setString(3, p.getProjectwriter());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

	}

}
