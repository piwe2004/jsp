package board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.controller.CommonAction;

public class logout implements CommonAction{
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/logout.jsp";
		
	}
	
}
