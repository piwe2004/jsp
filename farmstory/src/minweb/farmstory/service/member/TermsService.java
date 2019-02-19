package minweb.farmstory.service.member;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import minweb.farmstory.config.DBconfig;
import minweb.farmstory.config.SQL;
import minweb.farmstory.controller.CommonAction;
import minweb.farmstory.vo.TermsVO;

public class TermsService implements CommonAction{
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Connection conn = DBconfig.getConnection();
		Statement stmt = conn.createStatement();
				
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
		
		TermsVO vo = null;
		if(rs.next()) {
			vo = new TermsVO();
			vo.setTerms(rs.getString(1));
			vo.setPrivacy(rs.getString(2));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		req.setAttribute("vo", vo);
		
		return "/member/terms.jsp";
	}
	
}
