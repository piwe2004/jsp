package kr.co.board1.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

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
	
	public void InsertBoard() throws Exception{}
	
	public void list(HttpSession session, PageContext pagecontext) throws Exception{
		MemberVO member = (MemberVO)session.getAttribute("member");

		 if(member == null){
			 
			pagecontext.forward("./login.jsp");
		} 
		 
		 Connection conn = DBconfig.getConnection();
		 PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LIST);
		 
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
	public void delete(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String seq = request.getParameter("seq");
		
		Connection conn = DBconfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_BOARD);
		psmt.setString(1,seq);
		
		psmt.executeUpdate();
		
		psmt.close();
	}
	public void insertComment() throws Exception{}
	public void listComment() throws Exception{}
		
}
