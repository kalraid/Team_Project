package com.playground.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.playground.vo.Festival;

public class MainpageDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	

	
	public ArrayList<Object> getMainPageFestival(){
		ArrayList<Object> MainArr = new ArrayList<Object>();
		String sql = 
				"select distinct c.name, a.* from festival a ,(select a_code,"+
				" row_number() over (order by max(good) desc) as rank,"+ 
				" max(good) as maxgood from festival group by a_code) b, area_code c"+
				" where  a.a_code = c.code and a.a_code = b.a_code and b.rank<=3 and a.good = b.maxgood";
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArrayList<Object> list = new ArrayList<Object>();
				String img = (rs.getString("feImg"));
				String title = (rs.getString("title"));
				String tel = (rs.getString("tel"));
				String c_name = rs.getString("name");
				int good = (rs.getInt("good"));
				String name = (rs.getString("fe_place"));
				Date start = (rs.getDate("eventStart_date"));
				Date end = (rs.getDate("eventEnd_date"));
				int content_id = (rs.getInt("content_id"));
				list.add(img);
				list.add(title);
				list.add(tel);
				list.add(c_name);
				list.add(good);
				list.add(name);
				list.add(start);
				list.add(end);
				list.add(content_id);
				MainArr.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return MainArr; 
	}
	
}
