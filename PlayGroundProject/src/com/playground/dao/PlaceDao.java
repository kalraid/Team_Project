package com.playground.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.playground.beans.thema;
import com.playground.beans.themaPlace;

public class PlaceDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 테마이름과 번호를 가져오는 메소드
	public ArrayList<thema> getThemaN(){
		ArrayList<thema> list = new ArrayList<thema>();
		String getThemaNsql = 
				"SELECT thema_name, thema_num FROM thema order by thema_num";
		try {
		conn = DBManager.getConnection();
		pstmt = conn.prepareStatement(getThemaNsql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			thema th = new thema();
			th.setThemaNum(rs.getInt("thema_num"));
			th.setThemaName(rs.getString("thema_name"));
			list.add(th);
		}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	// 테마번호를 받아서 소테마 이름,번호가 들은 어레이리스트<테마> 반환 메소드
	public ArrayList<thema> getThema(int thema) {
		ArrayList<thema> themaList = new ArrayList<thema>();
		String getThema =
				"select t.thema_num, t.thema_name, s.s_thema_num,s.s_thema_name"
				+ " FROM thema t, smallthema s"
				+ " where t.thema_num=s.thema_num and s.thema_num = ?";

		try {
			conn=DBManager.getConnection();
			pstmt = conn.prepareStatement(getThema);
			pstmt.setInt(1, thema);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				thema th = new thema();
				th.setS_themaNum(rs.getInt("s_thema_num"));
				th.setS_themaName(rs.getString("s_thema_name"));
				th.setThemaName(rs.getString("thema_name"));
				th.setThemaNum(rs.getInt("THEMA_NUM"));
				
				themaList.add(th);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		
		
		
		return themaList;
	}
	
	// 소테마번호를 넣고 해당 소테마번호에 맞는 장소 어레이리스트 반환
	public ArrayList<themaPlace>  getThemaPlace(int s_thema) {
		ArrayList<themaPlace> themaPlaceList = new ArrayList<themaPlace>();
		String getThema =
				"select distinct(p.place_num), p.* "
				+ " FROM place p, pla_thema pl "
				+ " where p.place_num = pl.place_num and pl.s_thema_num = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(getThema);
			pstmt.setInt(1, s_thema);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				themaPlace thpl = new themaPlace();
				thpl.setPlaceName(rs.getString("place_name"));
				thpl.setPlaceIntro(rs.getString("place_intro"));
				thpl.setPlaceImg(rs.getString("place_img"));
				thpl.setAddress(rs.getString("address"));
				thpl.setGrade(rs.getDouble("grade"));
				thpl.setLatitude(rs.getDouble("latitude"));
				thpl.setLongitude(rs.getDouble("longitude"));
				
				
				themaPlaceList.add(thpl);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return themaPlaceList;
		
	}
	
	// 소테마번호와 위도,경도를 넣고 해당 소테마번호에 맞는 장소 어레이리스트 반환
		public ArrayList<themaPlace>  getThemaPlace(int s_thema, double lat, double lng) {
			ArrayList<themaPlace> themaPlaceList = new ArrayList<themaPlace>();
			String getThema =
					"select distinct(p.place_num), p.* "
					+ " FROM place p, pla_thema pl "
					+ " where p.place_num = pl.place_num "
					+ " and pl.s_thema_num = ? "
					+ " and p.longitude between (?-0.5) and (?+0.5) "
					+ " and p.latitude between (?-0.5) and (?+0.5)";

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(getThema);
				pstmt.setInt(1, s_thema);
				pstmt.setDouble(2, lng);
				pstmt.setDouble(3, lng);
				pstmt.setDouble(4, lat);
				pstmt.setDouble(5, lat);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					themaPlace thpl = new themaPlace();
					thpl.setPlaceName(rs.getString("place_name"));
					thpl.setPlaceIntro(rs.getString("place_intro"));
					thpl.setPlaceImg(rs.getString("place_img"));
					thpl.setAddress(rs.getString("address"));
					thpl.setGrade(rs.getDouble("grade"));
					thpl.setLatitude(rs.getDouble("latitude"));
					thpl.setLongitude(rs.getDouble("longitude"));
					themaPlaceList.add(thpl);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				DBManager.close(conn, pstmt, rs);
				
			}
			
			return themaPlaceList;
			
		}
	
	// 이름으로 검색하는 메서드
	public ArrayList<themaPlace>  getThemaPlace(String placeName) {
		ArrayList<themaPlace> themaPlaceList = new ArrayList<themaPlace>();
		String getThema =
				"select distinct(p.place_num), p.* "
				+ " FROM place p, pla_thema pl "
				+ " where p.place_num = pl.place_num and p.place_name = ?";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(getThema);
			pstmt.setString(1, placeName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				themaPlace thpl = new themaPlace();
				thpl.setPlaceName(rs.getString("place_name"));
				thpl.setPlaceIntro(rs.getString("place_intro"));
				thpl.setPlaceImg(rs.getString("place_img"));
				thpl.setAddress(rs.getString("address"));
				thpl.setGrade(rs.getDouble("grade"));
				thpl.setLatitude(rs.getDouble("latitude"));
				thpl.setLongitude(rs.getDouble("longitude"));
				
				
				themaPlaceList.add(thpl);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return themaPlaceList;
		
	}
	
	
	// 이름으로 검색하는 메서드
		public ArrayList<themaPlace>  searchPlace(String placeName) {
			ArrayList<themaPlace> themaPlaceList = new ArrayList<themaPlace>();
			String getThema =
					"SELECT distinct(p.place_num), p.* "
					+ " FROM place p, pla_thema pl "
					+ " where p.place_num = pl.place_num "
					+ " and p.place_name like '%' ||?||'%'";

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(getThema);
				pstmt.setString(1, placeName);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					themaPlace thpl = new themaPlace();
					thpl.setPlaceName(rs.getString("place_name"));
					thpl.setPlaceIntro(rs.getString("place_intro"));
					thpl.setPlaceImg(rs.getString("place_img"));
					thpl.setAddress(rs.getString("address"));
					thpl.setGrade(rs.getDouble("grade"));
					thpl.setLatitude(rs.getDouble("latitude"));
					thpl.setLongitude(rs.getDouble("longitude"));
					
					
					themaPlaceList.add(thpl);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			return themaPlaceList;
			
		}
	
}
