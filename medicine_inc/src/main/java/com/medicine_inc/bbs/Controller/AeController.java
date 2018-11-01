package com.medicine_inc.bbs.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medicine_inc.bbs.aehee.HealthSupportService;

import com.medicine_inc.bbs.domain.HealthSupport;

@Controller
public class AeController {
	@SuppressWarnings("unused")
	
private final static String DEFAULT_PATH = "/resources/images/Aehee";
	
	
	@Autowired
	private HealthSupportService healthSupportService;
	
	
	
	@RequestMapping(value= 
		{"/HealthSupport","/healthSupport","/Healthsupport","/healthsupport"})
	public String healthSupport
		(Model model,
				@RequestParam(value="pageNum", required=false,
				defaultValue="1") int pageNum,
				@RequestParam(value="cateCode", required=false,
				defaultValue="0") String cateCode,
				@RequestParam(value="type", required=false,  
				defaultValue="null") String type,
				@RequestParam(value="keyword", required=false,
				defaultValue="null") String keyword) {	
				
				int cateCode2;
				cateCode2 =Integer.parseInt(cateCode);
				System.out.println(cateCode2);
		//Map<String, Object> modelMap = boardService.boardList(pageNum, cateCode2, type, keyword);
			Map<String, Object> modelMap = healthSupportService.boardList(pageNum, cateCode2);
			
		model.addAllAttributes(modelMap);
		return "/Aehee/HealthSupport";
	}
	
	
	@RequestMapping(value="HealthSupportDetail")
	public String boardDetail(Model model, int no,
			@RequestParam(value="pageNum", required=false, 
			defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null")
				|| keyword.equals("null")) ? false : true;
		
		HealthSupport healthSupport = healthSupportService.getBoard(no);
		
		model.addAttribute("board", healthSupport);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		System.out.println("boardDatail : " + healthSupport.getConsumerPrice()   + ",  " + healthSupport.getSellingPrice());
		
		if(searchOption) {			
			model.addAttribute("keyword", URLEncoder.encode(keyword, "utf-8"));
			model.addAttribute("type", type);
			model.addAttribute("word", keyword);
		}
		
		return "/Aehee/HealthSupportDetail";
	}
	
	//writeForm에서 들어온 요청 데이터를 DB에 저장하는 메서드
	@RequestMapping(value="/HealthSupportWriteProcess", method=RequestMethod.POST)
	public String insertBoard(
			HttpServletRequest request,
			String name, int consumerPrice, int sellingPrice, String capacity, 
			String shape, int cateCode, String explanation,
			@RequestParam(value="image", required=false) MultipartFile multipartFile1,
			@RequestParam(value="bigImage", required=false) MultipartFile multipartFile2) 
					throws IOException {		
		
		System.out.println("image : " + multipartFile1.getOriginalFilename());
		System.out.println("bigImage" + multipartFile2.getName());	
		
		HealthSupport healthSupport = new HealthSupport();
		
		healthSupport.setName(name);
		healthSupport.setConsumerPrice(consumerPrice);
		healthSupport.setSellingPrice(sellingPrice);
		healthSupport.setCapacity(capacity);
		healthSupport.setShape(shape);
		healthSupport.setCateCode(cateCode);
		healthSupport.setExplanation(explanation);
		
		if(!multipartFile1.isEmpty()) { // 업로드된 파일 데이터가 존재하면
			
			// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String imageName = 
					uid.toString() + "_" + multipartFile1.getOriginalFilename();
			String bigName = 
					uid.toString() + "_" + multipartFile2.getOriginalFilename();
			
			File imgFile = new File(filePath, imageName);
			File bigFile = new File(filePath, bigName);
			System.out.println("insertBoard - imgFile : " + imgFile.getName());	
			System.out.println("insertBoard - bigFile : " + bigFile.getName());			
			
			// 업로드 되는 파일을 upload 폴더로 저장한다.
			multipartFile1.transferTo(imgFile);
			multipartFile2.transferTo(bigFile);
			
			healthSupport.setImage(imageName);
			healthSupport.setBigImage(bigName);
		}
		
		/* BoardService 클래스를 이용해
		 * 폼에서 넘어온 게시 글 정보를 게시 글 테이블에 추가한다.
		 **/
		healthSupportService.insertBoard(healthSupport);
				
		
		/* 클라이언트 요청을 처리한 후 리다이렉트 해야 할 경우 아래와 같이 redirect:
		 * 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
		 * HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다. 
		 * redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
		 * 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재 
		 * 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
		 * 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
		 **/		
		return "redirect:HealthSupport";
	}
		
	
	
	// UPDATE 폼에서 들어오는 데이터를 db에 수정하는 메서드
	@RequestMapping(value="HealthSupportUpdate", method=RequestMethod.POST)
	public String updateBoard(HttpServletResponse response, 
			PrintWriter out, HealthSupport healthSupport,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) throws Exception {	
		
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		// 게시글 수정하는 코드
		healthSupportService.updateBoard(healthSupport);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			
			reAttrs.addAttribute("keyword", keyword);
			reAttrs.addAttribute("type", type);
		}
		
		System.out.println("Post - updateBoard() 실행됨");
		
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:HealthSupport";
	}
	
	// Detail에서 수정 폼 요청이 들어오면 실행되는 메서드
	@RequestMapping(value="HealthSupportUpdateForm")
	public String updateBoard(Model model, HttpServletResponse response,
		PrintWriter out, HealthSupport healthSupport, int no) {
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다.
		boolean result = healthSupportService.isPassCheck(healthSupport.getNo(), healthSupport.getPass());
		// 비밀번호가 맞지 않으면
		if(! result) {
			/* 컨트롤러에서 null을 반환하거나 메서드의 반환 타입이 void일 경우
			* Writer나 OutputStream을 이용해 응답 결과를 직접 작성할 수 있다.
			* DispatcherServlet을 경유해 리소스 자원에 접근하는 경우에
			* 자바스크립트의 history.back()은 약간의 문제를 일으킬 수 있다.
			* history 객체를 이용하는 경우 서버로 요청을 보내는 것이 아니라
			* 브라우저의 접속 이력에서 이전 페이지로 이동되기 때문에 발생한다.
			**/
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		/* Service 클래스를 이용해 게시 글 수정 폼에 출력할
		* no에 해당하는 게시 글을 가져온다.
		**/
		healthSupport = healthSupportService.getBoard(no);
		/* 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다.
		* 모델에는 도메인 객체나 비즈니스 로직을 처리한 결과를 저장한다.
		**/
		model.addAttribute("healthSupport", healthSupport);
		/* servlet-context.xml에 설정한 ViewResolver에서 prefix와 suffix에
		* 지정한 정보를 제외한 뷰 이름을 문자열로 반환하면 된다.
		*
		* 아래와 같이 뷰 이름을 반환하면 포워드 되어 제어가 뷰 페이지로 이동한다.
		**/
		return "HealthSupportUpdateForm";
	}
	
	
	
	
	
/*	@RequestMapping({"/delete", "deleteBoard"})
	public String deleteBoard(HttpServletResponse response, 
			PrintWriter out, int no, String pass,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) throws Exception {
		
	
		
		boolean searchOption = (type.equals("null")
				|| keyword.equals("null")) ? false : true;
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		boardService.deleteBoard(no);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			
			reAttrs.addAttribute("keyword", keyword);
			reAttrs.addAttribute("type", type);
		}
		
		reAttrs.addAttribute("pageNum", pageNum);
		return "redirect:boardList";
	}
*/
/*}*/
}
