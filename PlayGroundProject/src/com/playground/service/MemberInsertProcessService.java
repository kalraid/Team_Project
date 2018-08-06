package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.playground.beans.Member;
import com.playground.dao.MemberDao;

public class MemberInsertProcessService implements CommandProcess {

	@Override
	public ForwardService requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("pass");
		String birthday = request.getParameter("datepicker");
		String address = request.getParameter("addr");
		String emailId = request.getParameter("emailId");
		String emailDomain = request.getParameter("emailDomain");
		String gender = request.getParameter("gender");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String admin = request.getParameter("admin");
		
		String email = emailId + "@" + emailDomain;
		String phone = phone1 + "-" + phone2 + "-" + phone3;

		Member member = new Member();
		member.setName(name);
		member.setId(id);
		member.setPassword(password);
		member.setBirthday(birthday);
		member.setAddress(address);
		member.setEmail(email);
		member.setGender(gender);
		member.setPhone(phone);
		member.setAdmin(admin);
		MemberDao dao = MemberDao.getInstance();
		dao.insertMember(member);

		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath("memberInsertSuccess.mvc");
		return forward;
	}

}
