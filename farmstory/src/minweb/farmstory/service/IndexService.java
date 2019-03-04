package minweb.farmstory.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import minweb.farmstory.config.DBconfig;
import minweb.farmstory.config.SQL;
import minweb.farmstory.controller.CommonAction;
import minweb.farmstory.vo.BoardVO;

public class IndexService  implements CommonAction{
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// �ֽű� ��������
		
		
		req.setAttribute("latest1", getLatest("grow"));
		req.setAttribute("latest2", getLatest("school"));
		req.setAttribute("latest3", getLatest("story"));
		
		return "index.jsp";
		
	}
	private ArrayList<BoardVO> getLatest(String cate) throws Exception {
		Connection conn = DBconfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LATEST);
		
		psmt.setString(1, cate);
		
		ResultSet rs = psmt.executeQuery();
		ArrayList<BoardVO> list = new ArrayList<>();
		while(rs.next()) {
			
				BoardVO vo = new BoardVO();
				vo.setSeq(rs.getInt("seq"));
				vo.setCate(rs.getString("cate"));
				vo.setTitle(rs.getString("title"));
				vo.setRdate(rs.getString("rdate"));
				list.add(vo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return list;
		
		
	}
}
