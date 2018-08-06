package com.playground.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess {
	//추상메소드 이므로 구현부가 없다. 상속받아서 구현을 해야함
	public abstract ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		
	
}
