package minweb.farmstory.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import minweb.farmstory.controller.CommonAction;

public class QnaService implements CommonAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return "/community/qna.jsp";
	}
	
}
