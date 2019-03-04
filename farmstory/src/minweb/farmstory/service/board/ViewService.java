package minweb.farmstory.service.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import minweb.farmstory.config.DBconfig;
import minweb.farmstory.config.SQL;
import minweb.farmstory.controller.CommonAction;
import minweb.farmstory.vo.BoardVO;

public class ViewService implements CommonAction {
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		String gr = req.getParameter("gr");
		String cate = req.getParameter("cate");
		String seq = req.getParameter("seq");
		
		Connection conn =  DBconfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_VIEW_WITH_FILE);
		psmt.setString(1, seq);
		
		ResultSet rs = psmt.executeQuery();
		BoardVO vo = new BoardVO();
		
		if(rs.next()) {
			vo.setSeq(rs.getInt(1));
			vo.setParent(rs.getInt(2));
			vo.setComment(rs.getInt(3));
			vo.setCate(rs.getString(4));
			vo.setTitle(rs.getString(5));
			vo.setContent(rs.getString(6));
			vo.setFile(rs.getInt(7));
			vo.setHit(rs.getInt(8));
			vo.setUid(rs.getString(9));
			vo.setRegip(rs.getString(10));
			vo.setRdate(rs.getString(11));
			vo.setOldName(rs.getString("oldName"));
			vo.setNewName(rs.getString("newName"));
			vo.setDownload(rs.getInt("download"));
		}
		
		rs.close();
		psmt.close();		
		conn.close();
		
		req.setAttribute("gr", gr);
		req.setAttribute("cate", cate);
		req.setAttribute("vo", vo);
		
		return "/board/view.jsp";
	}
}
