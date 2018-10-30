package com.medicine_inc.bbs.Controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.medicine_inc.bbs.domain.JiwonBoard;
import com.medicine_inc.bbs.gugyeong.JiwonBoardService;

@Controller
public class KookyeongController {
	/* 인스턴스 필드에 @Autowired annotation을 사용하면 접근지정자가
	* private이고 setter 메서드가 없다 하더라도 문제없이 주입 된다.
	* 하지만 우리는 항상 setter 메서드를 준비하는 습관을 들일 수 있도록 하자.
	*
	* setter 주입 방식은 스프링이 기본 생성자를 통해 이 클래스의 인스턴스를
	* 생성한 후 setter 주입 방식으로 BoardService 타입의 객체를 주입하기 때문에
	* 기본 생성자가 존재해야 하지만 이 클래스에 다른 생성자가 존재하지 않으므로
	* 컴파일러에 의해 기본 생성자가 만들어 진다.
	**/
	@Autowired
	private JiwonBoardService boardService;
	public void setBoardService(JiwonBoardService boardService) {
		this.boardService = boardService;
	}
	/* 게시 글 리스트 보기 요청을 처리하는 메서드
	*
	* @RequestMapping은 클래스 레벨과 메서드 레벨에 지정할 수 있다.
	* @RequestMapping의 ()에 처리할 요청 URI만 지정할 때는 value 속성을
	* 생략하고 처리할 요청 URI를 String 또는 String 배열을 지정할 수 있지만
	* 다른 속성을 같이 지정할 경우 value 속성에 처리할 요청 URI를 지정해야 한다.
	* 또한 method 속성을 지정해 컨트롤러가 처리할 HTTP 요청 방식을
	* 지정할 수 있는데 아래는 "/boardList", "/list"로 들어오는 GET 방식의
	* 요청을 이 메서드가 처리할 수 있도록 설정한 것이다.
	* method 속성을 생략하면 기본 값은 RequestMethod.GET 이다.
	*
	* 요청을 처리한 결과를 뷰에 전달하기 위해 사용하는 것이 모델이다.
	* 컨트롤러는 요청을 처리한 결과 데이터를 모델에 담아 뷰로 전달하고 뷰는
	* 모델로 부터 데이터를 읽어와 클라이언트로 보낼 결과 페이지를 만들게 된다.
	*
	* 스프링은 컨트롤러에서 모델에 데이터를 담을 수 있는 다양한 방법을 제공하는데
	* 아래와 같이 파라미터에 Model을 지정하는 방식이 많이 사용된다.
	* @RequestMapping 애노테이션이 적용된 메서드의 파라미터에 Model
	* 을 지정하면 스프링이 이 메서드를 호출하면서 Model 타입의 객체를 넘겨준다.
	* 우리는 Model을 받아 이 객체에 결과 데이터를 담기만 하면 뷰로 전달된다.
	**/
	
	
	@RequestMapping(value= {"/boardList", "/list"}, method=RequestMethod.GET)
	public String boardList(Model model) {
	
		// Service 클래스를 이용해 게시 글 리스트를 가져온다.
		List<JiwonBoard> bList = boardService.boardList();
		/* 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다.
		* 모델에는 도메인 객체나 비즈니스 로직을 처리한 결과를 저장한다.
		**/
		model.addAttribute("bList", bList);
		/* servlet-context.xml에 설정한 ViewResolver에서 prefix와 suffix에
		* 지정한 정보를 제외한 뷰 이름을 문자열로 반환하면 된다.
		*
		* 아래와 같이 뷰 이름을 반환하면 포워드 되어 제어가 뷰 페이지로 이동한다.
		**/
		return "Kookyeong/jiwonBoardList";
	}
	@RequestMapping("/JiwonBoardDetail")
	public String boardDetail(Model model, int bno) {
	// Service 클래스를 이용해 no에 해당하는 게시 글을 가져온다.
	JiwonBoard board = boardService.getBoard(bno);
	/* 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다.
	* 모델에는 도메인 객체나 비즈니스 로직을 처리한 결과를 저장한다.
	**/
	model.addAttribute("board", board);
	/* servlet-context.xml에 설정한 ViewResolver에서 prefix와 suffix에
	* 지정한 정보를 제외한 뷰 이름을 문자열로 반환하면 된다.
	*
	* 아래와 같이 뷰 이름을 반환하면 포워드 되어 제어가 뷰 페이지로 이동한다.
	**/
	return "Kookyeong/jiwonBoardDetail";
	}
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertBoard(JiwonBoard board) {
	/* BoardService 클래스를 이용해
	- 107 -
	* 폼에서 넘어온 게시 글 정보를 게시 글 테이블에 추가한다.
	**/
	boardService.insertBoard(board);
	/* 클라이언트 요청을 처리한 후 리다이렉트 해야 할 경우 아래와 같이 redirect:
	* 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
	* HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다.
	* redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
	* 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재
	* 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
	* 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
	**/
	return "redirect:jiwonBoardList";
	}
	
	@RequestMapping(value="/writeOld", method=RequestMethod.POST)
	public ModelAndView insertBoardOld(HttpServletRequest request) {
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String pass = request.getParameter("pass");
	String content = request.getParameter("content");
	JiwonBoard board = new JiwonBoard();
	board.setTitle(title);
	board.setWriter(writer);
	board.setPass(pass);
	board.setContent(content);
	/* BoardService 클래스를 이용해
	* 폼에서 넘어온 게시 글 정보를 게시 글 테이블에 추가한다.
	**/
	boardService.insertBoard(board);
	/* Redirect를 위해 View 이름을 지정한 RedirectView를 생성한다.
	* 이 방식은 @Controller 방식이 보편화되기 이전에 컨트롤러에서
	* ModelAndView를 반환하는 메서드를 작성할 때 주로 사용한 방식이다.
	**/
	RedirectView redirectView = new RedirectView("index");
	ModelAndView modelAndView = new ModelAndView(redirectView);
	return modelAndView;
	}
	@RequestMapping(value="/update")
	public String updateBoard(Model model, HttpServletResponse response,
	PrintWriter out, int bno, String pass) {
	// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다.
	boolean result = boardService.isPassCheck(bno, pass);
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
	JiwonBoard board = boardService.getBoard(bno);
	/* 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다.
	* 모델에는 도메인 객체나 비즈니스 로직을 처리한 결과를 저장한다.
	**/
	model.addAttribute("board", board);
	/* servlet-context.xml에 설정한 ViewResolver에서 prefix와 suffix에
	* 지정한 정보를 제외한 뷰 이름을 문자열로 반환하면 된다.
	*
	* 아래와 같이 뷰 이름을 반환하면 포워드 되어 제어가 뷰 페이지로 이동한다.
	**/
	return "updateForm";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	
	public String updateBoard(HttpServletResponse response,
	PrintWriter out, JiwonBoard board) {
	// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다.
	boolean result = boardService.isPassCheck(board.getBno(), board.getPass());
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
	boardService.updateBoard(board);
	/* 클라이언트 요청을 처리한 후 리다이렉트 해야 할 경우 아래와 같이 redirect:
	* 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
	* HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다.
	* redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
	* 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재
	* 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
	* 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
	**/
	return "redirect:boardList";
	}
	@RequestMapping({"/delete", "deleteBoard"})
	public String deleteBoard(HttpServletResponse response,
		PrintWriter out, int bno, String pass) {
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다.
		boolean result = boardService.isPassCheck(bno, pass);
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
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		boardService.deleteBoard(bno);
		/* 클라이언트 요청을 처리한 후 리다이렉트 해야 할 경우 아래와 같이 redirect:
		* 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
		* HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다.
		* redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
		* 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재
		* 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
		* 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
		**/
		return "redirect:boardList";
	}
}

