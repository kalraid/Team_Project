package com.medicine_inc.bbs.Controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.medicine_inc.bbs.Changmyoung.MemberService;
import com.medicine_inc.bbs.Changmyoung.NaverLoginBO;
import com.medicine_inc.bbs.domain.Member;
import com.medicine_inc.bbs.exception.MemberNotFoundException;
import com.medicine_inc.bbs.exception.MemberPassCheckFailException;

@Controller
//@SessionAttributes({"member", "m"})

public class ChangController {
	@SuppressWarnings("unused")
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping(value= 
		{"/depressed","/Depressed"})
	public String depressed(Model model){
	
		return "/Changmyoung/depressed";
	}
	
	@RequestMapping(value= {"/login","/Login"})
	public String login(Model model){
	
		return "/Changmyoung/login";
	}

	
	////////////  회원 MEMBER
	
	private MemberService memberService;
	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	//로그인결과
	@RequestMapping(value="/loginResult", method=RequestMethod.POST)	
	public String login(Model model, @RequestParam("id") String id, 
			@RequestParam("pass") String pass, 
			HttpSession session, HttpServletResponse response) 
					throws ServletException, IOException {
		
		int result = memberService.login(id, pass);
		
		if(result == -1) {			
			throw new MemberNotFoundException(id + "는 존재하지 않는 아이디 입니다.");			
			
		} else if(result == 0) {
			throw new MemberPassCheckFailException("비밀번호가 맞지 않습니다.");
		}		
		
		Member member = memberService.getMember(id);
		
		session.setAttribute("id", member.getId());
		session.setAttribute("name", member.getName());
		session.setAttribute("isLogin", true);		
		
		model.addAttribute("member", member);
		
		System.out.println("member.id : " + member.getId());
		System.out.println("member.name : " + member.getName());
			
		return "redirect:/";
	}
	
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {	

		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 가입
	@RequestMapping("/joinInfo")
	public String joinInfo(SessionStatus sessionStatus,Model model,Member member,
			String pass, String email ) {
		System.out.println("/joinInfo");
		
		member.setPass(pass);
		member.setEmail(email);
				
		model.addAttribute("m", member);
		
		return "Changmyoung/joinInfo";
	}
	//회원가입 완료
	@RequestMapping("/joinResult")
	public String joinResult(SessionStatus sessionStatus,
			@ModelAttribute("m") Member member) {
		
		System.out.println("joinResult : " + member.getName());
		memberService.addMember(member);
		
		sessionStatus.setComplete();
		
		return "redirect:/";
	}
	
	// 회원가입 폼에서 들어오는 중복 아이디 체크 요청을 처리하는 메서드
	@RequestMapping("/overlapIdCheck")	
	public String overlapIdCheck(Model model, String id) {		
		
		// 회원 아이디 중복 여부를 받아온다.
		boolean overlap = memberService.overlapIdCheck(id);
		
		// model에 id와 회원 아이디 중복 여부를 저장 한다. 
		model.addAttribute("id", id);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}	

	// 회원 정보 수정 폼 요청을 처리하는 메서드
	@RequestMapping("/memberUpdateForm")
	public String updateForm(Model model, String id) {
		
		
		Member member = memberService.getMember(id);
		model.addAttribute("member", member);
		
		return "member/memberUpdateForm";
	}	
	
//	// 회원 수정 폼에서 들어오는 요청을 처리하는 메서드
//	@RequestMapping("/memberUpdateInfo")
//	public String memberUpdateInfo(Model model, Member member,
//			String pass1, String emailId, String emailDomain,
//			String mobile1, String mobile2, String mobile3,
//			String phone1, String phone2, String phone3,
//			@RequestParam(value="emailGet", required=false, 
//				defaultValue="false")boolean emailGet) {
//		System.out.println("/memberUpdateInfo ");
//		
//		member.setPass(pass1);
//		member.setEmail(emailId + "@" + emailDomain);
//		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
//				
//		if(phone2.equals("") || phone3.equals("")) {			
//			member.setPhone("");				
//		} else {			
//			member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
//		}				
//		member.setEmailGet(Boolean.valueOf(emailGet));
//		
//		model.addAttribute("m", member);	
//		return "member/memberUpdateInfo";
//	}
//
//	@RequestMapping("/memberUpdateResult")
//	public String updateResult(Model model,
//			HttpSession session,
//			SessionStatus sessionStatus,
//			@ModelAttribute("m") Member member) {
//		
//		System.out.println("updateResult : " + member.getId());
//		memberService.updateMember(member);
//		
//		return "redirect:boardList";
//	}
//	
//	
//	@ExceptionHandler(MemberNotFoundException.class)
//	public String memberNotFound(Model model) {
//		model.addAttribute("title", "존재하지 않는 아이디");		
//		return "errors/controllerException";
//	}
//	
//
//	@ExceptionHandler(MemberPassCheckFailException.class)
//	public String memberPassCheckFail(Model model) {
//		model.addAttribute("title", "비밀번호가 맞지 않음");
//		return "errors/controllerException";
//	}	
//	
//	/* Exception 발생 테스트 메서드 - 요청 URI에 따라 강제 예외 발생 메서드
//	 * http://localhost:8080/springstudy-bbs06/internal 과 같이 테스트 한다.
//	 **/
//	@RequestMapping({"/internal", "/badRequest", "/notFound", 
//			"/runtime", "/methodNotSupported"})
//	public String internalException(HttpServletRequest request) throws Exception {
//		int index = request.getRequestURL().lastIndexOf("/");
//		String command = request.getRequestURL().substring(index);
//		
//		if(command.equals("/internal")) {			
//			int i = 100 / 0;
//			
//		} else if(command.equals("/badRequest")) {
//			throw new TypeMismatchException("잘못된 요청", String.class);
//			
//		} else if(command.equals("/notFound")) {
//			throw new NoSuchRequestHandlingMethodException(request);
//		
//		} else if(command.equals("/runtime")) {
//			throw new RuntimeException("요청을 처리하는 과정에서 에러 발생");
//		
//		} else if(command.equals("/methodNotSupported")) {
//			throw new HttpRequestMethodNotSupportedException("요청 방식이 잘못됨");
//		}
//		return "";
//	}
	
	//네이버 아디로 로그인 컨트롤러
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    //네이버 로그인 요청
    @RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "Changmyoung/login";
    }
    
    
    @RequestMapping(value = "navercallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
 
    	System.out.println("네이버  callback~~~");
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
                
        //네이버 프로플( 아디,이름, 메일 등등....)
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println( "네이버 사용자 프로필: " + naverLoginBO.getUserProfile(oauthToken).toString() );
                       
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<String, Object>();
        map = mapper.readValue(apiResult, new TypeReference<Map<String,Object >>(){});
        
        //ArrayList data1 = (ArrayList) map.get("response");
        //System.out.println("네이버 아이디 : "+ data1);
        System.out.println("네이버 아이디 : "+ map.get("response") );
        
        @SuppressWarnings("unchecked")
		Map<String, Object> profile = (Map<String, Object>)map.get("response");
        
        //System.out.println(profile.get("id"));
        //System.out.println(profile.get("name"));

        session.setAttribute("isLogin", true);
        session.setAttribute("id", profile.get("id") );
        session.setAttribute("name",profile.get("name"));
        
        return "redirect:/";
    }

	//카카오톡 로그인
	@RequestMapping(value="kakaologin", method= {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLogin(HttpSession session) {
		return "Changmyoung/kakaologin";
	}
}
