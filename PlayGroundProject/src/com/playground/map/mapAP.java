package com.playground.map;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class mapAP {

	public ArrayList<Double> mapLngLat(String address) {
		ArrayList<Double> LngLatList = new ArrayList<Double>();
		String uStr;
		String key = "AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU";
		StringBuilder mResponseBuilder = new StringBuilder();
		
		try {
			uStr = "http://maps.googleapis.com/maps/api/geocode/json?"
					+ "sensor=false&language=ko&address=" + address
					+ "&key=" + key;
			/*https://maps.googleapis.com/maps/api/geocode/json?
				sensor=false&language=ko&address=%EC%84%9C%EC%9A%B8%20%EA%B5%AC%EB%A1%9C%EA%B5%AC%20%EB%8F%84%EB%A6%BC%EC%B2%9C%EB%A1%9C%20477(%EA%B5%AC%EB%A1%9C%EB%8F%99,%EA%B5%AC%EB%A1%9C%EB%94%94%EC%A7%80%ED%84%B8%EB%8B%A8%EC%A7%80%EC%97%AD)&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU*/
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
			if (status.equals("OK")) {
				System.out.println("통신에 성공헀습니다");
			}else {
				System.out.println("통신에 실패했습니다");
				return null;
			}
			
			// 실제 결과값들이 들어있는 변수 저장
			JSONArray results = (JSONArray) obj.get("results");
			JSONObject temp = (JSONObject) results.get(0);
			JSONObject geometry = (JSONObject) temp.get("geometry");
			JSONObject location = (JSONObject) geometry.get("location");

			double lat = (double) location.get("lat");
			double lng = (double) location.get("lng");
			System.out.println("위도(lat) : "+lat + " 경도(lng)"+lng);
			LngLatList.add(lat);
			LngLatList.add(lng);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return LngLatList;

	}

}
