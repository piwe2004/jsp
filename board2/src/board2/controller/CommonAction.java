package board2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonAction {
	
	public abstract String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception;


}
