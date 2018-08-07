package com.playground.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

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
			
			Gson gson = new Gson();
			String result = gson.toJson(obj);
			response.setContentType("text/html; charset=utf-8");		
			PrintWriter out = response.getWriter();
			out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
	
	}

}
