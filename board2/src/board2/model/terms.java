package board2.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.controller.CommonAction;

public class terms implements CommonAction{
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/terms.jsp";
		
	}
	
}
