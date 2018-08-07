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
import com.playground.vo.ChartMonth;
import com.playground.vo.Festival;
import com.playground.vo.FestivalCount;

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
		
		
		
		//차트뿌리기 (막대)
		ArrayList<Festival> chartList = new ArrayList<Festival>();//acode, good 정보
		ArrayList<AreaCode> aList = new ArrayList<AreaCode>(); //acode, aname 정보 
		ArrayList<String> nameList = new ArrayList<String>(); //aname 정보
		ArrayList<Integer> goodList1 = new ArrayList<Integer>(); //good 정보
		aList = dao.getAreaCode();
		chartList = dao.getChartResult();

		
		for(int i = 0; i<aList.size(); i++){ //17개
			for(int j = 0; j<chartList.size(); j++){ //8개
				
				if(aList.get(i).getCode() == chartList.get(j).getAreaCode()){
					int good = chartList.get(j).getGood();
					String astr = aList.get(i).getName();
					nameList.add(astr);
					goodList1.add(good);
				}
			}
		}
		ArrayList<Integer> goodList = new ArrayList<Integer>();
		for(int i = 0; i<goodList1.size(); i++){
			int number =goodList1.get(i);
			number = Math.abs(number/10000);
			goodList.add(number);
		}
		
		Gson gson = new Gson();
		String jsonGoodList = gson.toJson(goodList);		
		String jsonNameList = gson.toJson(nameList);
		
		// 자바스크립트에서 직접 접근할려면 -> json 형태로
		request.setAttribute("goodList", jsonGoodList);
		request.setAttribute("nameList", jsonNameList);
		
		
		
		// 지역별 축제 개수 차트 뿌리기
		ArrayList<FestivalCount> cntList = new ArrayList<FestivalCount>();
		nameList.clear();
		cntList = dao.getChartResultCount();
		
		for(int i = 0; i<aList.size(); i++){ //17개
			for(int j = 0; j<cntList.size(); j++){ //6개
				if(cntList.get(j).getaCode() == aList.get(i).getCode()){
					String astr = aList.get(i).getName();
					nameList.add(astr);
				}
			}
		}
		
		String jsonNameList2 = gson.toJson(nameList);
		String jsonCntList = gson.toJson(cntList);
	
		request.setAttribute("jsonNameList2", jsonNameList2);
		request.setAttribute("jsonCntList", jsonCntList);
		//지역별 축제 끝
		
		
		//월별 지역별 good 합계
		ArrayList<ChartMonth> monthArray = new ArrayList<ChartMonth>();
		nameList.clear();
		monthArray = dao.getChartMonth();
		String astr1 = "";
		String astr2 = "";
		String astr3 = "";
		
		for(int i = 0; i<aList.size(); i++){ //17개
			for(int j = 0; j<monthArray.size(); j++){ //6개
				if(aList.get(i).getCode() == 1){
					astr1 = aList.get(i).getName();
				} else if(aList.get(i).getCode() == 31){
					astr2 = aList.get(i).getName();
				} else if(aList.get(i).getCode() == 32){
					astr3 = aList.get(i).getName();
				}
			}
		}
		nameList.add(astr1); nameList.add(astr2); nameList.add(astr3);
		ArrayList<Integer> sumGood1 = new ArrayList<Integer>(); //좋아요 합계
		ArrayList<Integer> sumGood31 = new ArrayList<Integer>();
		ArrayList<Integer> sumGood32 = new ArrayList<Integer>();
		for(int i=0; i<monthArray.size(); i++){
			if(monthArray.get(i).getAcode() == 1){
				int num = monthArray.get(i).getSumGood();
				num = Math.abs(num/10000);
				sumGood1.add(num);
			} else if(monthArray.get(i).getAcode() == 31){
				int num = monthArray.get(i).getSumGood();
				num = Math.abs(num/10000);
				sumGood31.add(num);
			} else if(monthArray.get(i).getAcode() == 32){
				int num = monthArray.get(i).getSumGood();
				num = Math.abs(num/10000);
				sumGood32.add(num);
			}
		}
		
		String jsonsumGood1 = gson.toJson(sumGood1);
		String jsonsumGood31 = gson.toJson(sumGood31);
		String jsonsumGood32 = gson.toJson(sumGood32);
		String nameSumList = gson.toJson(nameList);
		
		
		request.setAttribute("jsonsumGood1", jsonsumGood1);
		request.setAttribute("jsonsumGood31", jsonsumGood31);
		request.setAttribute("jsonsumGood32", jsonsumGood32);
		request.setAttribute("nameSumList", nameSumList);
		
		System.out.println(jsonsumGood1);
		System.out.println(jsonsumGood31);
		System.out.println(jsonsumGood32);
		System.out.println(nameSumList);
		////월별 지역별 good 합계 끝
		
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=festival/festivalMain.jsp?home=festivalView.jsp&chart=chart01.jsp");
		return forward;
		
	}

}
