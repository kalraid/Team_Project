package com.playground.map;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.playground.service.CommandProcess;
import com.playground.service.ForwardService;

public class mapingtest extends HttpServlet implements CommandProcess 
{
	private static final long serialVersionUID = 1L;

	public mapingtest() {
		super();
	}
	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		double Latitude = Double.parseDouble(request.getParameter("Latitude"));
		double Hardness = Double.parseDouble(request.getParameter("Hardness"));
		double radius = Double.parseDouble(request.getParameter("radius"));
		String search = request.getParameter("search");
		String name2 = request.getParameter("name");
		String uStr;
		String key = "AIzaSyALJ7iILn3iNgPrON9XJ1q6vyNsc4ItTu8";

		StringBuilder mResponseBuilder = new StringBuilder();

		// url을 구한뒤 거기서 json을 StringBuilder에 저장
		try {
			if (search == "") {
				uStr = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + Latitude + ","
						+ Hardness + "&radius=" + radius + "&name=" + name2 + "&key=" + key;

			} else {
				uStr = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + Latitude + ","
						+ Hardness + "&radius=" + radius + "&name=" + name2 + "&types=" + search + "&key=" + key;
			}
			URL url = new URL(uStr);
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				mResponseBuilder.append(inputLine);
			}
			in.close();

		} catch (MalformedURLException me) {
			me.printStackTrace();
		} catch (UnsupportedEncodingException ue) {
			ue.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();

		}

		// 받아온 StringBuilder를 파싱하는 부분
		try {

			JSONParser parser = new JSONParser();
			String input = mResponseBuilder.toString();
			JSONObject obj = (JSONObject) parser.parse(input);

			String status = (String) obj.get("status");

			// 실제 결과값들이 들어있는 변수 저장
			JSONArray results = (JSONArray) obj.get("results");
			ArrayList<placeinsert> result = new ArrayList<placeinsert>();

			/*
			 * 이름 = name, 위도 = gemery{location{lat}} 경도 : gemery{location{lng}} 주소 =
			 * vincinity 추천별 = rating 이미지 =photsos[photo_reference] 장소설명 : types[]
			 */
			for (int i = 0; i < results.size(); i++) {
				placeinsert pl = new placeinsert();
				JSONObject temp = (JSONObject) results.get(i);
				JSONObject geometry = (JSONObject) temp.get("geometry");
				JSONObject location = (JSONObject) geometry.get("location");
				
				
				JSONArray photos = (JSONArray) temp.get("photos");
				/*String photo_reference = (String)temp.get("reference");
				pl.setPhoto_references(photo_reference);*/
				
				
				if(photos!=null) {
				JSONObject references = (JSONObject) photos.get(0);
				String photo_reference = (String)references.get("photo_reference");
				pl.setPhoto_references(photo_reference);
				}
				
				String name = (String) temp.get("name");
				String vicinity = (String) temp.get("vicinity");
				Object rating = (Object) temp.get("rating");
				double lat = (double) location.get("lat");
				double lng = (double) location.get("lng");
				
				ArrayList<Object> type = (ArrayList<Object>)temp.get("types");
				
				pl.setNames(name);
				pl.setVicinitys(vicinity);
				pl.setLngs(lng);
				pl.setLats(lat);
				pl.setRatings(rating);
				
				pl.setTypes(type);
				result.add(pl);
			}

			request.setAttribute("result", result);
			request.setAttribute("size", results.size());
			request.setAttribute("name2", name2);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/index.jsp?body=dbInsertTools/View.jsp");
		return forward;

		
	}

}


