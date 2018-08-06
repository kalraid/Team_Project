package com.playground.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.playground.beans.Member;

public class MemberDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private static MemberDao instance = new MemberDao();
	
	private MemberDao() { }
	
	public static MemberDao getInstance() {
		return instance;
	}
	public boolean idCheck(String id) {
		String checkSql="SELECT id FROM memberlist WHERE id=?";
		boolean check = false;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(checkSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = true;
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return check;
	}
	
	public boolean passCheck(String id, String pass) {
		String passSql = "SELECT password FROM memberlist WHERE id=?";
		boolean check = false;
		String passconfirm ="";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(passSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				passconfirm = rs.getString(1);
				System.err.println(passconfirm.equals(pass));
				System.err.println(id + " , " + pass);
				if(passconfirm.equals(pass)) {
					check = true;
				}
				
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		System.out.println("passconfirm.equals(pass) : " + passconfirm.equals(pass));
		return check;
	}
	
	public void insertMember(Member member) {
		String inMemberSql = "INSERT into memberList VALUES(memberList_seq.NEXTVAL, ?, ?, ?, to_date(?,'yyyy-mm-dd'), ?, ?, ?, ?, ?)";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(inMemberSql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getBirthday());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getGender());
			pstmt.setString(8, member.getPhone());
			pstmt.setString(9, member.getAdmin());
			pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public int memberlogin(String id, String pass) {
		String logInSql = "SELECT password FROM memberlist WHERE id=?";
		String password = "";
		int result = -1;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(logInSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				password = rs.getString("password");
			}else {
				return result;
			}
			if(password.equals(pass)) {
				result = 1;
			}else {
				result = 0;
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public Member getMember(String id) {
		String getMemberSql ="SELECT name, id, password, to_Char(birthday,'yyyy/mm/dd') AS birthday, address, email, gender, phone, admin FROM memberlist WHERE id = ?";
		Member m = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(getMemberSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setName(rs.getString("name"));
				m.setId(rs.getString("id"));
				m.setPassword(rs.getString("password"));
				m.setBirthday(rs.getString("birthday"));
				m.setAddress(rs.getString("address"));
				m.setEmail(rs.getString("email"));
				m.setGender(rs.getString("gender"));
				m.setPhone(rs.getString("phone"));
				m.setAdmin(rs.getString("admin"));
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return m;
	}
	
	public String getAdmin(String id) {
		String getAdminSql = "SELECT admin FROM memberlist WHERE id = ?";
		String admin = "";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(getAdminSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				admin = rs.getString("admin");
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return admin;
	}
	
	public String getGender(String id) {
		String getGenderSql = "SELECT gender FROM memberlist WHERE id=?";
		String gender = "";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(getGenderSql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				gender = rs.getString("gender");
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return gender;
	}
	public void upDateMember(Member m) {
		String upDateSql = "UPDATE memberlist SET name=?, password=?,"
				+" birthday=to_date(?,'yyyy-mm-dd '), address=?, email=?, gender=?, phone=?, admin=?"
				+" WHERE id=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(upDateSql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getBirthday());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getAdmin());
			pstmt.setString(9, m.getId());
			pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		} 
	}
	public void memberDelete(boolean passCheck, String id) {
		String memberDeleteSql = "DELETE FROM memberlist WHERE id=?";
		try {
			if(passCheck) {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(memberDeleteSql);
				pstmt.setString(1, id);
				pstmt.executeQuery();
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	public int getMemberCount() {
		String memberCountSql = "SELECT COUNT(*) FROM memberlist";
		int count = 0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(memberCountSql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}
	public int getMemberCount(String type, String keyword) {
		String memberCountSql = "SELECT COUNT(*) FROM memberlist WHERE " + type + " LIKE '%' || ? || '%'";
		int count = 0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(memberCountSql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}
	public ArrayList<Member> memberList(int startRow, int endRow){
		String memberListSql = "SELECT * FROM (SELECT ROWNUM num,"
				+ " name, id, password, to_Char(birthday,'yyyy-mm-dd') AS birthday, address, email, gender, phone,"
				+ " admin FROM (SELECT * FROM memberlist ORDER BY memnum)) "
				+ " WHERE num >= ? AND num <= ?";
		ArrayList<Member> memberlist = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(memberListSql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberlist = new ArrayList<Member>();
				do {
					Member m = new Member();
					m.setName(rs.getString("name"));
					m.setId(rs.getString("id"));
					m.setPassword(rs.getString("password"));
					m.setBirthday(rs.getString("birthday"));
					m.setAddress(rs.getString("address"));
					m.setEmail(rs.getString("email"));
					m.setGender(rs.getString("gender"));
					m.setPhone(rs.getString("phone"));
					m.setAdmin(rs.getString("admin"));
					memberlist.add(m);
				}while(rs.next());
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return memberlist;
	}
	public ArrayList<Member> membersearchList(String type, String keyword, int startRow, int endRow) {
		String memberSearchListSql = "SELECT * FROM (SELECT ROWNUM num, name, id, password, to_Char(birthday,'yyyy-mm-dd') AS birthday, address, email, gender, phone, admin FROM (SELECT * FROM memberlist WHERE " + type + " LIKE ? ORDER BY memnum)) WHERE num >= ? AND num <= ?";
		ArrayList<Member> memberlist = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(memberSearchListSql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberlist = new ArrayList<Member>();
				do {
					Member m = new Member();
					m.setName(rs.getString("name"));
					m.setId(rs.getString("id"));
					m.setPassword(rs.getString("password"));
					m.setBirthday(rs.getString("birthday"));
					m.setAddress(rs.getString("address"));
					m.setEmail(rs.getString("email"));
					m.setGender(rs.getString("gender"));
					m.setPhone(rs.getString("phone"));
					m.setAdmin(rs.getString("admin"));
					memberlist.add(m);
				}while(rs.next());
			}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return memberlist;
	}
	public void memberAdminUpDate(String id, String admin) {
		System.out.println("dao id : " + id + " admin : " + admin);
		String adminUpDateSql = "UPDATE memberlist SET admin=? WHERE id=?";
		String changeAdmin = "";
		if(admin.equals("admin")) {
			changeAdmin = "nomal";
		}else if(admin.equals("nomal")) {
			changeAdmin = "admin";
		}
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(adminUpDateSql);
			pstmt.setString(1, changeAdmin);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	public void memberAdminDelete(String id) {
		String adminDeleteSql = "DELETE FROM memberlist WHERE id=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(adminDeleteSql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
}
