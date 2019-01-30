package board2.service.member;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.config.DBconfig;
import board2.config.SQL;
import board2.controller.CommonAction;
import board2.vo.TermsVO;


public class TermsService implements CommonAction{
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Connection conn  = DBconfig.getConnection();	

		Statement stmt = conn.createStatement();
		//4�ܰ�
		
		ResultSet rs =  stmt.executeQuery(SQL.SELECT_TERMS);
		
		//5�ܰ�
		TermsVO vo = null;
		if(rs.next()){
			vo = new TermsVO();
			vo.setTerms(rs.getString(1));
			vo.setPrivacy(rs.getString(2));
		}
		//6�ܰ�
		rs.close();
		stmt.close();
		conn.close();
		
		// request ��ü�� ���� ������ ����
		req.setAttribute("vo", vo);
		
		return "/terms.jsp";
		
	}
	
}
