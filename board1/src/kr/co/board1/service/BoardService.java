package kr.co.board1.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.mysql.jdbc.CallableStatement;

import kr.co.board1.config.DBconfig;
import kr.co.board1.config.SQL;
import kr.co.board1.vo.BoardVO;
import kr.co.board1.vo.MemberVO;

public class BoardService {
	private static BoardService service = new BoardService();
	
	public static BoardService getInstance() {
		return service;
	}
	private BoardService() {}
	
	public MemberVO getMember(HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("member");
		return vo;
	}
	
	public void InsertBoard() throws Exception{}
	
	public int getTotal() throws Exception{
		
		int total = 0;
		
		Connection conn = DBconfig.getConnection();
		Statement stmt = conn.createStatement();
	
		
		ResultSet rs = stmt.executeQuery(SQL.SELECT_COUNT);
		if(rs.next()) {
			total  = rs.getInt(1);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return total;
	}
	
	public ArrayList<BoardVO> list(int start) throws Exception{
		 
		 Connection conn = DBconfig.getConnection();
		 PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LIST);
		 psmt.setInt(1, start);
		 
		 ResultSet rs = psmt.executeQuery();
		 
		 ArrayList<BoardVO> list = new ArrayList<>();
		 
		 while(rs.next()){
			 BoardVO bs = new BoardVO();

			 bs.setSeq(rs.getInt(1));
			 bs.setParent(rs.getInt(2));
			 bs.setComment(rs.getInt(3));
			 bs.setCate(rs.getString(4));
			 bs.setTitle(rs.getString(5));
			 bs.setContent(rs.getString(6));
			 bs.setFile(rs.getInt(7));
			 bs.setHit(rs.getInt(8));
			 bs.setUid(rs.getString(9));
			 bs.setRegip(rs.getString(10));
			 bs.setRdate(rs.getString(11));
			 bs.setNick(rs.getString(12));

			 list.add(bs);
		 }
		 
		 rs.close();
		psmt.close();
		conn.close();
		
		 return list;
		 
	}
	
	public void updatehit(int seq) throws Exception{
	
		Connection conn = DBconfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_HIT);
		psmt.setInt(1,seq);
		psmt.executeUpdate();
		psmt.close();
	}
	public BoardVO view(HttpServletRequest request) throws Exception{

		request.setCharacterEncoding("UTF-8");
		String seq = request.getParameter("seq");

		
		Connection conn = DBconfig.getConnection();
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_VIEW);
		psmt.setString(1,seq);
		
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		BoardVO bs = new BoardVO();
		
		if(rs.next()){
		
			 bs.setSeq(rs.getInt(1));
			 bs.setParent(rs.getInt(2));
			 bs.setComment(rs.getInt(3));
			 bs.setCate(rs.getString(4));
			 bs.setTitle(rs.getString(5));
			 bs.setContent(rs.getString(6));
			 bs.setFile(rs.getInt(7));
			 bs.setHit(rs.getInt(8));
			 bs.setUid(rs.getString(9));
			 bs.setRegip(rs.getString(10));
			 bs.setRdate(rs.getString(11));

		}
		// 6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return bs;
	}
	public String modify(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String title 	= request.getParameter("subject");
		String content 	= request.getParameter("content");
		String seq 		= request.getParameter("seq");
		
		Connection conn = DBconfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_BOARD);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setString(3, seq);
		
		psmt.executeUpdate();
		psmt.close();
		conn.close();
		
		return seq;
		
	}
	public String delete(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String seq 	  = request.getParameter("seq");
		String parent = request.getParameter("parent");
		
		Connection conn = DBconfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_BOARD);
		psmt.setString(1, seq);
		
		psmt.executeUpdate();
		psmt.close();
		
		return parent;
	}
	public String insertComment(HttpServletRequest request ) throws Exception{
	
		request.setCharacterEncoding("UTF-8");
		
		String parent = request.getParameter("parent");
		String content = request.getParameter("comment");
		String uid = request.getParameter("uid");
		String regip = request.getRemoteAddr();
		
		Connection conn = DBconfig.getConnection();
		
		java.sql.CallableStatement call = conn.prepareCall(SQL.INSERT_COMMENT);
		
		call.setString(1, parent);
		call.setString(2, content);
		call.setString(3, uid);
		call.setString(4, regip);
		
		call.executeUpdate();
		
		call.close();
		conn.close();
		
		
		return parent;
	}
	
	public ArrayList<BoardVO> listComment(String parent) throws Exception{
			
		 Connection conn = DBconfig.getConnection();
		 PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_COMMENT);
		 psmt.setString(1,  parent);
		 
		 ResultSet rs = psmt.executeQuery();
		 
		 ArrayList<BoardVO> list = new ArrayList<>();
		 
		 while(rs.next()){
			 BoardVO bs = new BoardVO();

			 bs.setSeq(rs.getInt("seq"));
			 bs.setParent(rs.getInt(2));
			 bs.setComment(rs.getInt(3));
			 bs.setContent(rs.getString(6));
			 bs.setFile(rs.getInt(7));
			 bs.setHit(rs.getInt(8));
			 bs.setUid(rs.getString(9));
			 bs.setRegip(rs.getString(10));
			 bs.setRdate(rs.getString("rdate"));
			 bs.setNick(rs.getString(12));

			 list.add(bs);
		 }
		 rs.close();
		psmt.close();
		conn.close();
		 return list;
		 
		 
	}
	public void updateCommentCount() throws Exception{
		
	}
		
}
