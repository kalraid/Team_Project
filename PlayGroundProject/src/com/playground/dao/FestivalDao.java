package com.playground.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.playground.vo.AreaCode;
import com.playground.vo.ChartMonth;
import com.playground.vo.Festival;
import com.playground.vo.FestivalCount;
import com.playground.vo.FestivalInfo;

public class FestivalDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static FestivalDao instance = new FestivalDao();
	private FestivalDao() {}
	
	public static FestivalDao getInstance() {
		return instance;
	}	
	
	
	public ArrayList<AreaCode> getAreaCode(){
		ArrayList<AreaCode> array = new ArrayList<AreaCode>();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM area_code");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AreaCode a = new AreaCode();
				a.setCode(rs.getInt("code"));
				a.setName(rs.getString("name"));
				array.add(a);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);		
		}
		return array;
	}
	
	
//	sum_area, a_code값 구하기
	public ArrayList<Festival> getSumArea(){
		ArrayList<Festival> array = new ArrayList<Festival>();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement("select distinct a.sum_area, b.a_code from (select distinct content_id, sum_area from festival) a,"
					+ "(select distinct content_id, a_code from festival) b where a.content_id = b.content_id and a.sum_area is not null order by b.a_code");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Festival f = new Festival();
				f.setSumArea(rs.getString("sum_area"));
				f.setAreaCode(rs.getInt("a_code"));
				array.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);		
		}
		return array;
	}
	
	//페이징 처리 list
	public ArrayList<Festival> getFestivalList(int acode, String sumArea, int startRow, int endRow){
		ArrayList<Festival> array = new ArrayList<Festival>();
		String sql1 = "SELECT * FROM (SELECT ROWNUM num, content_id, fe_place, feImg, title, tel, latitude, longitude, eventStart_date,"
				+ "eventEnd_date, a_code, d_no, good, sum_area FROM festival where a_code=? ) WHERE num >= ? AND num <= ?";
		String sql2 = "SELECT * FROM (SELECT ROWNUM num, content_id, fe_place, feImg, title, tel, latitude, longitude, eventStart_date,"
				+ "eventEnd_date, a_code, d_no, good, sum_area FROM festival where a_code=? and sum_area=?) WHERE num >= ? AND num <= ?";
		
		try {
			conn = DBManager.getConnection();
			
		if(sumArea == null || sumArea.equals("")){
			pstmt = conn.prepareStatement(sql1);
			
			pstmt.setInt(1, acode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
		} else {
			pstmt = conn.prepareStatement(sql2);
			
			pstmt.setInt(1, acode);
			pstmt.setString(2, sumArea);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
		}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Festival f = new Festival();
				f.setContentId(rs.getInt("content_id"));
				f.setFePlace(rs.getString("fe_place"));
				f.setFeImg1(rs.getString("feImg"));
				f.setTitle(rs.getString("title"));
				f.setTel(rs.getString("tel"));
				f.setXmap(rs.getString("latitude"));
				f.setYmap(rs.getString("longitude"));
				f.setEventStartdate(rs.getDate("eventStart_date"));
				f.setEventEndDate(rs.getDate("eventEnd_date"));
				f.setAreaCode(rs.getInt("a_code"));
				f.setdCode(rs.getInt("d_no"));
				f.setGood(rs.getInt("good"));
				f.setSumArea(rs.getString("sum_area"));
				
				array.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);		
		}
		return array;
	}
	
	
	//지역 별 게시글 수 반환
	public int getFestivalAreaCount(int acode, String sumArea) {
		
		String sqlCount = "SELECT COUNT(*) FROM festival where a_code = ?";
		String sqlCount2 = "SELECT COUNT(*) FROM festival where a_code = ? and sum_area = ?";
		int count = 0;
		
		try{			
			conn = DBManager.getConnection();
			
			if(sumArea == null || sumArea.equals("")){
				pstmt = conn.prepareStatement(sqlCount);
				pstmt.setInt(1, acode);
			} else {
				System.out.println("dao 에서의 sumArea if 문 안 : " + sumArea);
				
				pstmt = conn.prepareStatement(sqlCount2);
				pstmt.setInt(1, acode);
				pstmt.setString(2, sumArea);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch(Exception e) {			
			e.printStackTrace();
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		System.out.println("디비에서 가져온 지역별 리스트 개수  : "+count);
		return count;
	}
	
	//축제 상세보기 메소드
	public FestivalInfo getFestivalInfo(int contentId){
		String sql = "SELECT * FROM festival_info where content_id=?";
		FestivalInfo f = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				f = new FestivalInfo();
				f.setContentId(rs.getInt("content_id"));
				f.setEventplace(rs.getString("eventplace"));
				f.setPlaceinfo(rs.getString("placeinfo"));
				f.setProgram(rs.getString("program"));
				f.setUsetimefestival(rs.getString("usetimefestival"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			DBManager.close(conn, pstmt, rs);		
		}
		return f;
	}
	
	
	//메인 축제 페이지
	public ArrayList<Festival> getMainFestivalList(){
		ArrayList<Festival> array = new ArrayList<Festival>();
		String sql = "select * from(SELECT ROWNUM num, a.content_id, a.fe_place, a.feImg, a.title, a.tel, a.latitude, a.longitude, a.eventStart_date, "
				+ "a.eventEnd_date, a.a_code, a.d_no, a.good, a.sum_area FROM(select trunc(sysdate,'MM') adate, content_id, fe_place, feImg, title, tel, latitude, longitude, eventStart_date, "
				+ "eventEnd_date, a_code, d_no, good, sum_area from festival  order by eventEnd_date, good desc) a, "
				+ "(select last_day(sysdate) bdate, content_id, eventEnd_date from festival) b "
				+ "where a.content_id = b.content_id and a.eventEnd_date >= a.adate and a.eventEnd_date <= b.bdate) "
				+ "where num>=1 and num<=6";
		
		try{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Festival f = new Festival();
				f.setContentId(rs.getInt("content_id"));
				f.setFePlace(rs.getString("fe_place"));
				f.setFeImg1(rs.getString("feImg"));
				f.setTitle(rs.getString("title"));
				f.setTel(rs.getString("tel"));
				f.setXmap(rs.getString("latitude"));
				f.setYmap(rs.getString("longitude"));
				f.setEventStartdate(rs.getDate("eventStart_date"));
				f.setEventEndDate(rs.getDate("eventEnd_date"));
				f.setAreaCode(rs.getInt("a_code"));
				f.setdCode(rs.getInt("d_no"));
				f.setGood(rs.getInt("good"));
				f.setSumArea(rs.getString("sum_area"));
				
				array.add(f);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally{
			DBManager.close(conn, pstmt, rs);
		}
		return array;
	}
	
	//차트결과:지역별 좋아요 수 8개 까지만
	public ArrayList<Festival> getChartResult(){
		ArrayList<Festival> array = new ArrayList<Festival>();
		String sql = "select no, a_code, good from(select rownum no, d.a_code, d.good from "
				+ "(select a_code, sum(good) good from festival f GROUP by a_code order by good desc) d) where no BETWEEN 1 AND 8";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Festival f = new Festival();
				f.setAreaCode(rs.getInt("a_code"));
				f.setGood(rs.getInt("good"));
				array.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return array;
	}
	
	//차트결과 : 지역별 축제의 개수
	public ArrayList<FestivalCount> getChartResultCount(){
		ArrayList<FestivalCount> array = new ArrayList<FestivalCount>();
		String sql = "select * from(select rownum no, a_code, a.cnt from( select a_code, count(*) cnt from festival GROUP BY a_code ORDER BY cnt DESC)a) "
				+ "where no between 1 and 6 order by a_code";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FestivalCount f = new FestivalCount();
				f.setaCode(rs.getInt("a_code"));
				f.setCount(rs.getInt("cnt"));
				array.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return array;
	}
	
	//차트 결과 : 지역별 월별 good 합계
	public ArrayList<ChartMonth> getChartMonth(){
		ArrayList<ChartMonth> array = new ArrayList<ChartMonth>();
		String sql = "select a_code, TO_CHAR(eventstart_date, 'YYYY-MM') month, sum(good) sgood from festival "
				+ "WHERE TO_CHAR(eventstart_date, 'YYYY') = '2018' AND a_code IN(1, 31, 32) "
				+ "GROUP BY a_code, TO_CHAR(eventstart_date, 'YYYY-MM') ORDER BY a_code";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ChartMonth f = new ChartMonth();
				f.setAcode(rs.getInt("a_code"));
				f.setMonth(rs.getString("month"));
				f.setSumGood(rs.getInt("sgood"));
				array.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return array;
	}
	
	
	

	
	/* public ArrayList<Festival> getFesSeachSumList(String sumArea){
		ArrayList<Festival> array = new ArrayList<Festival>();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement("select * from festival where sum_area = ?");
			pstmt.setString(1, sumArea);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Festival f = new Festival();
				f.setContentId(rs.getInt("content_id"));
				f.setFePlace(rs.getString("fe_place"));
				f.setFeImg1(rs.getString("feImg"));
				f.setTitle(rs.getString("title"));
				f.setTel(rs.getString("tel"));
				f.setXmap(rs.getString("latitude"));
				f.setYmap(rs.getString("longitude"));
				f.setEventStartdate(rs.getDate("eventStart_date"));
				f.setEventEndDate(rs.getDate("eventEnd_date"));
				f.setAreaCode(rs.getInt("a_code"));
				f.setdCode(rs.getInt("d_no"));
				f.setGood(rs.getInt("good"));
				f.setSumArea(rs.getString("sum_area"));
				
				array.add(f);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);		
		}
		return array;
	}
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	public ArrayList<District> getDistrict(){
		ArrayList<District> array = new ArrayList<District>();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM area_district");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				District a = new District();
				
				
				array.add(a);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);		
		}
		return array;
	}*/
	
	
	
	
	
	
	
	
	
	
}
