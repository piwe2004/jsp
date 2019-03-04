package minweb.farmstory.service.board;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import minweb.farmstory.config.DBconfig;
import minweb.farmstory.config.SQL;
import minweb.farmstory.controller.CommonAction;
import minweb.farmstory.vo.MemberVO;

public class WriteService implements CommonAction {
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		String gr = req.getParameter("gr");
		String cate = req.getParameter("cate");
		
		if(req.getMethod().equals("POST")) {
			
			String title = req.getParameter("subject");
			String content = req.getParameter("content");
			String regip = req.getRemoteAddr();
			
			HttpSession session = req.getSession();
			MemberVO member = (MemberVO)session.getAttribute("member");
			String uid = member.getUid();
			
			Connection conn = DBconfig.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_BOARD);
			
			psmt.setString(1, cate);
			psmt.setString(2, title);
			psmt.setString(3, content);
			psmt.setString(4, uid);
			psmt.setString(5, regip);
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
			return "redirect:/farmstory/board/list.do?gr="+gr+"&cate="+cate;
			
		}else {
			
			req.setAttribute("gr", gr);
			req.setAttribute("cate", cate);
			
		}
		
		return "/board/write.jsp";
	}

}
