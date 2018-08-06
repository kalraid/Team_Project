package com.playground.festivalservice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.playground.dao.FestivalDao;
import com.playground.service.CommandProcess;
import com.playground.service.ForwardService;
import com.playground.vo.AreaCode;
import com.playground.vo.Festival;

public class FastivalProcess implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AreaDistrictgetMethod method = new AreaDistrictgetMethod();
		ArrayList<AreaCode> areaList = new ArrayList<AreaCode>();
		ArrayList<Festival> fList = new ArrayList<Festival>();
		
		//HashMap<Integer ,ArrayList<String>> map1 = new HashMap<Integer,ArrayList<String>>();
		
		/*for(int j=0;j<fList.size();j++){ //7
			for(int i=0; i<codeList.size(); i++){ //3
				
				ArrayList<String> sum = new ArrayList<String>(); //fList=7
				if(fList.get(j).getAreaCode()== codeList.get(i) && codeList.get(i)==1){
					int number = codeList.get(i);
					
					sum.add(fList.get(j).getSumArea());
					map1.put(number, sum);
				}
			}
		}
		*/
	
		ArrayList<String> array1 = new ArrayList<String>();
		ArrayList<String> array2 = new ArrayList<String>();
		ArrayList<String> array3 = new ArrayList<String>();
		
		
		areaList = method.getAreaCode(); //지역 이름, 코드
		fList = method.getSumArea(); //sumArea, 지역코드
		String str = "";
		for(int i=0;i<fList.size();i++){
			
			if(fList.get(i).getAreaCode() == 1){
				str = fList.get(i).getSumArea();
				array1.add(str);
			} else if(fList.get(i).getAreaCode() == 31){
				str = fList.get(i).getSumArea();
				array2.add(str);
			} else if(fList.get(i).getAreaCode() == 32){
				str = fList.get(i).getSumArea();
				array3.add(str);
			}
			
		}
		
		request.setAttribute("areaList", areaList);
		request.setAttribute("array1", array1);
		request.setAttribute("array2", array2);
		request.setAttribute("array3", array3);
		
		
		//메인 페이지에 뿌려질 축제리스트
		FestivalDao dao = FestivalDao.getInstance();
		ArrayList<Festival> searchList = new ArrayList<Festival>();
		searchList = dao.getMainFestivalList();
		request.setAttribute("searchList", searchList);
		
		
		
		//차트뿌리기
		ArrayList<Festival> chartList = new ArrayList<Festival>();//acode, good 정보
		ArrayList<AreaCode> aList = new ArrayList<AreaCode>(); //acode, aname 정보 
		ArrayList<String> nameList = new ArrayList<String>(); //aname 정보
		aList = dao.getAreaCode();
		chartList = dao.getChartResult();
		System.out.println("aList 사이즈 : "+aList.size());
		System.out.println("chartList 사이즈 : "+chartList.size());
		
		for(int i = 0; i<aList.size(); i++){ //17개
			for(int j = 0; j<chartList.size(); j++){ //8개
				
				if(aList.get(i).getCode() == chartList.get(j).getAreaCode()){
					String astr = aList.get(i).getName();
					nameList.add(astr);
				}
			}
		}
				
		Gson gson = new Gson();
		String jsonChartList = gson.toJson(chartList);		
		String jsonAList = gson.toJson(aList);		
		String jsonNameList = gson.toJson(nameList);
		
		//PrintWriter out = new PrintWriter(result);
		
		
		// 자바스크립트에서 직접 접근할려면 -> json 형태로
		request.setAttribute("chartList", jsonChartList);
		request.setAttribute("aList", jsonAList);
		request.setAttribute("nameList", jsonNameList);
		
		request.setAttribute("tChartList", chartList);
		//차트 뿌리기 끝
		System.out.println("chartList : " + jsonChartList);
		System.out.println("aList : " + jsonAList);
		System.out.println("nameList : " + jsonNameList);
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=festival/festivalMain.jsp?home=festivalView.jsp&chart=chart01.jsp");
		return forward;
		
	}

}
