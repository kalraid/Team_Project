package com.medicine_inc.bbs.Controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicine_inc.bbs.domain.JiwonBoard;
import com.medicine_inc.bbs.gugyeong.JiwonBoardService;

@Controller
public class KookyeongController {

	@Autowired
	private JiwonBoardService jiwonBoardService;

	public void setBoardService(JiwonBoardService jiwonBoardService) {
		this.jiwonBoardService = jiwonBoardService;
	}

	@RequestMapping(value = { "/jiwonBoardList", "/jiwonboardlist", "/JiwonBoardList" }, method = RequestMethod.GET)
	public String jiwonBoardList(Model model,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) {
		Map<String, Object> modelMap = jiwonBoardService.jiwonBoardList(pageNum);
		model.addAllAttributes(modelMap);
		return "Kookyeong/jiwonBoardList";
	}

	@RequestMapping(value = "/jiwonWriteProcess", method = RequestMethod.POST)
	public String jiwonInsertBoard(JiwonBoard jiwonBoard) {
		jiwonBoardService.jiwonInsertBoard(jiwonBoard);

		return "redirect:jiwonBoardList";
	}

	@RequestMapping("/jiwonBoardDetail")
	public String jiwonBoardDetail(Model model, int bno,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) {
		JiwonBoard jiwonBoard = jiwonBoardService.getJiwonBoard(bno, true);
		model.addAttribute("jiwonBoard", jiwonBoard);
		model.addAttribute("pageNum", pageNum);
		return "Kookyeong/jiwonBoardDetail";
	}

	@RequestMapping(value = "/jiwonUpdateForm")
	public String updateBoard(Model model, HttpServletResponse response, PrintWriter out, int bno, String pass) {
		// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다.
		boolean result = JiwonBoardService.isPassCheck(bno, pass);
		// 비밀번호가 맞지 않으면
		if (!result) {

			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		JiwonBoard jiwonBoard = jiwonBoardService.getJiwonBoard(bno);
		/*
		 * 파라미터로 받은 모델 객체에 뷰로 보낼 모델을 저장한다. 모델에는 도메인 객체나 비즈니스 로직을 처리한 결과를 저장한다.
		 **/
		model.addAttribute("JiwonBoard", jiwonBoard);

		return "Kookyeong/jiwonUpdateForm";

	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateBoard(HttpServletResponse response, PrintWriter out, JiwonBoard jiwonBoard) {
		boolean result = JiwonBoardService.isPassCheck(jiwonBoard.getBno(), jiwonBoard.getPass());
		if (!result) {

			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;

		}
		jiwonBoardService.updateBoard(jiwonBoard);

		return "redirect:jiwonBoardList";
	}

	@RequestMapping({ "/delete", "deleteBoard" })
	public String deleteBoard(HttpServletResponse response, PrintWriter out, int bno, String pass) {

		boolean result = JiwonBoardService.isPassCheck(bno, pass);
		if (!result) {

			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");

			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		jiwonBoardService.deleteBoard(bno);

		return "redirect:jiwonBoardList";
	}

}
