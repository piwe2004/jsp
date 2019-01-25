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
	
	public int write(int file, String... args) throws Exception{
		
		Connection conn = DBconfig.getConnection();
		
		 //트랜젝션 시작
		conn.setAutoCommit(false);
		
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_BOARD);
		psmt.setString(1, args[0]);
		psmt.setString(2, args[1]);
		psmt.setString(3, args[2]);
		psmt.setInt(4, file);
		psmt.setString(5, args[3]);
		
		Statement stmt = conn.createStatement();
		
		psmt.executeUpdate();
		ResultSet rs = stmt.executeQuery(SQL.SELECT_MAX_SEQ);
		 
		//트랜젝션 적용
		conn.commit();
		
		int seq = 0;
		if(rs.next()) {
			seq = rs.getInt(1);
		}
		
		rs.close();
		stmt.close();
		psmt.close();
		conn.close();
		
		return seq;
	}
	public void fileInsert(int parent, String oldName, String newName) throws Exception{
		
		Connection conn = DBconfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_FILE);
		psmt.setInt(1, parent);
		psmt.setString(2, oldName);
		psmt.setString(3, newName);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();	
	}
	
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
	
	public int getLimitStart(String pg) {
		// LIMIT용 start 값 계산
		 int start = 0;
				 if( pg == null){
					 start = 1;
				 }else{
					 start = Integer.parseInt(pg);
				 }
			 
			return (start - 1) * 10;
	}
	public int getPageEnd(int total) {
		int begin = 1;
		int pageEnd = 0;
		
		if( total % 10 == 0){
			pageEnd = total / 10;
		}else{
			pageEnd = total /10 + 1 ;
		}
		return pageEnd;
	}
	public int getPageCountStart(int total, int limit) {
		
		return total - limit;
	}
	public int[]  getPageGroupStartEnd(String pg, int pageEnd) {
		
		int [] groupStartEnd = new int[2];
		int current = 0;
		
		if( pg == null ) {
			current = 1;
		}else {
			current = Integer.parseInt(pg);
		}
		
		int currentPage = current;
		int currentPageGroup = (int)Math.ceil(currentPage / 10.0);
		int groupStart = (currentPageGroup - 1) * 10 + 1;
		int groupEnd = currentPageGroup * 10;
		
		if(groupEnd > pageEnd){
			groupEnd = pageEnd;
		}
		
		groupStartEnd[0] = groupStart;
		groupStartEnd[1] = groupEnd;
		
		return groupStartEnd;
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
		
		PreparedStatement psmt = null;
		
		psmt = conn.prepareStatement(SQL.SELECT_VIEW_WITH_FILE);
		
		psmt.setString(1,seq);
		
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		BoardVO bs = new BoardVO();
		String oldName = null;
		
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
			 bs.setOldName(rs.getString(14));
			 bs.setNewName(rs.getString(15));
			 bs.setDownload(rs.getInt(16));
			 

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
