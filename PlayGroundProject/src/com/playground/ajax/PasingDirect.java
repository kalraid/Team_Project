package com.playground.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class PasingDirect implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uStr = request.getParameter("url");
		StringBuilder mResponseBuilder = new StringBuilder();

		try {
			URL url = new URL(uStr);
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				mResponseBuilder.append(inputLine);
			}
			in.close();

		} catch (

		MalformedURLException me) {
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
			JSONArray results = (JSONArray) obj.get("routes");
			JSONObject summary = (JSONObject) results.get(0);
			JSONArray legs = (JSONArray) summary.get("legs");
			JSONObject duration = (JSONObject) legs.get(0);
			
			// DistinctBase beans용
			
			// 출발 경위도 및 주소
			JSONObject start_location = (JSONObject) duration.get("start_location");
			Double st_lat = (Double) start_location.get("lat");
			Double st_lng = (Double) start_location.get("lng");
			JSONObject start_address = (JSONObject) duration.get("start_address"
					);
			
			
			// 도착 경위도 및 주소
			JSONObject end_location = (JSONObject) duration.get("end_location");
			Double end_lat = (Double) end_location.get("lat");
			Double end_lng = (Double) end_location.get("lng");
			JSONObject end_address = (JSONObject) duration.get("end_address");
			
			
			
			// 총 시간
			JSONObject dura = (JSONObject) duration.get("duration");
			String full_time = (String) dura.get("text");
			
			// 도착예상시간
			JSONObject arr_time = (JSONObject) duration.get("arrival_time");
			String arrival_time = (String) arr_time.get("text");
			
			// 총 거리
			JSONObject dis = (JSONObject) duration.get("distance");
			String distance = (String) dis.get("distance");
			
			JSONArray steps = (JSONArray) duration.get("steps");
			
			// DistinctDeep beans용
			ArrayList<String> durations = null;
			ArrayList<String> st_lats = null;
			ArrayList<String> st_lngs = null;
			ArrayList<String> end_lats = null;
			ArrayList<String> end_lngs = null;
			ArrayList<String> distances = null;
			ArrayList<String> travel_mode = null;
			ArrayList<String> polylines = null;
			for (int i = 0; i < steps.size(); i++) {
				JSONObject duration2 = (JSONObject) steps.get(i);
				JSONObject dura2 = (JSONObject) duration.get("duration");
				durations.add( (String) dura2.get("text"));
				JSONObject st_location = (JSONObject) duration.get("start_location");
				st_lats.add((String)st_location.get("lat"));
				st_lngs.add((String)st_location.get("lng"));
				JSONObject distanc = (JSONObject) duration.get("distance");
				distances.add((String)distanc.get("text"));
				travel_mode.add((String)duration.get("travel_mode"));
				JSONObject end_locations  = (JSONObject) duration.get("end_location");
				end_lats.add((String) duration.get("lat"));
				end_lngs.add((String) duration.get("lng"));
				polylines.add((String) duration.get("polylines"));
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * Gson gson = new Gson(); String result = gson.toJson(PList);
		 * response.setContentType("text/html; charset=utf-8");
		 */
		PrintWriter out = response.getWriter();
		/* out.println(url); */

	}

}
