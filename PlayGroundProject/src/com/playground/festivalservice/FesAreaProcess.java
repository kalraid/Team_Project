package com.playground.festivalservice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.dao.FestivalDao;
import com.playground.service.CommandProcess;
import com.playground.service.ForwardService;
import com.playground.vo.AreaCode;
import com.playground.vo.Festival;

public class FesAreaProcess implements CommandProcess {
	
	//한 페이지에 보여줄 게시글의 수를 상수로 선언
	private static final int PAGE_SIZE = 6;
	
	//한 페이지에 보여질 페이지 그룹의 수를 상수로 선언
	private static final int PAGE_GROUP = 10;
	

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//nav바
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
		//nav 바 끝
		
		
		
		
		
		//페이징
		String pageNum = request.getParameter("pageNum");
		//맨처음 실행시 첫번째 페이지로
		if(pageNum == null) {
			pageNum = "1";
		}
		// 요청 파라미터의 pageNum을 int 형으로 변환하여 현재 페이지로 설정하고 있다.
		int currentPage = Integer.parseInt(pageNum);
		
		//startRow(11) = 3 * 5 - (5 - 1);
		int startRow = currentPage * PAGE_SIZE - (PAGE_SIZE - 1);
		
		int endRow = startRow + PAGE_SIZE - 1;
		
		int listCount = 0;
		
		FestivalDao dao = FestivalDao.getInstance();
		
		int acode = Integer.parseInt(request.getParameter("acode"));
		String sumArea = request.getParameter("sumArea");
		listCount = dao.getFestivalAreaCount(acode, sumArea); //count는 연산 처리 끝냄
		
		//페이징 끝
		
		
		
		
		
	
		
		
		ArrayList<Festival> searchList = new ArrayList<Festival>();
		searchList = dao.getFestivalList(acode, sumArea, startRow, endRow);
		
		
		
	
		
		//ArrayList<Festival> searchList = new ArrayList<Festival>();
		//int count = 0;
		
		System.out.println("view 에서 넘어온 sumArea : " +  sumArea);
		
		/*for(int i = 0; i<fList2.size(); i++){ //지역 안나눈 지역 list뿌리기
			if(sumArea == null || sumArea==""){
				Festival f = new Festival();
				f = fList2.get(i);
				searchList.add(f);
				count += 1;
				
			} else if(sumArea != null || sumArea != "" && sumArea.equals(fList2.get(i).getSumArea())){ //지역 나눈지역 list 뿌리기
				ArrayList<Festival> arraySum = new ArrayList<Festival>(); 
				
				//강남권만 들어 있는 arrayList를 새로 생성해야함
				
				Festival f = new Festival();
				f = fList2.get(i);
				searchList.add(f);
				count += 1;
				
				}
		}*/
		
		int pageCount = listCount / PAGE_SIZE 
				+ (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		// 현재 페이지 그룹의 마지막 페이지 : 10, 20, 30...
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
	
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}	
		
		
		request.setAttribute("searchList", searchList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageGroup", PAGE_GROUP);
		request.setAttribute("listCount", listCount);
		request.setAttribute("acode", acode);
		request.setAttribute("sumArea", sumArea);
		
		ForwardService forward = new ForwardService(); //각 if문마다 넣어줘야함
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=festival/festivalPage.jsp?home=searchFestivalView.jsp");
		return forward;
		
	}

}
