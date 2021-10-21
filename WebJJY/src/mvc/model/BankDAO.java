package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BankDAO {

	private static BankDAO instance;
	
	private BankDAO() {
		
	}

	public static BankDAO getInstance() {
		if (instance == null)
			instance = new BankDAO();
		return instance;
	}	
	

	//bank 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;

		String sql;
		
		if (items == null && text == null)
			sql = "SELECT count(*) FROM banklist";
		else
			sql = "SELECT   count(*) FROM board where " + items + " like '%" + text + "%'";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				x = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
		} finally {			
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();												
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
		return x;
	}
	

	//board 테이블의 레코드 가져오기
	public ArrayList<BankDTO> getBankList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(items, text );
		int start = (page - 1) * limit;
		int index = start + 1;
		String sql;

		if (items == null && text == null)
			sql = "SELECT  * FROM banklist ORDER BY num DESC";
		else
			sql = "SELECT  * FROM banklist WHERE " + items + " like '%" + text + "%' ORDER BY num DESC ";
		
		ArrayList<BankDTO> list = new ArrayList<BankDTO>();
		try {
			conn = DBConnection.getConnection();

			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			while (rs.absolute(index)) {
				BankDTO bank = new BankDTO();
				bank.setNum(rs.getInt("num"));
				bank.setAccount(rs.getInt("account"));
				bank.setAcc_type(rs.getString("acc_type"));
				bank.setAcc_date(rs.getString("acc_date"));
				bank.setRamark(rs.getString("ramark"));
				bank.setBalance(rs.getInt("balance"));
				list.add(bank);
				System.out.println(bank);
				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}
		return null;
	}
	

	//board 테이블에 새로운 글 삽입히가
	public void insertBank(BankDTO bank)  {

		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();		

			String sql = "INSERT INTO banklist VALUES(0, ?, ?, ?, ?, ?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bank.getAccount());
			pstmt.setString(2, bank.getAcc_type());
			pstmt.setString(3, bank.getAcc_date());
			pstmt.setString(4, bank.getRamark());
			pstmt.setInt(5, bank.getBalance());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertBoard() 에러 : " + ex);
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
	} 
	

	//선택된 글 내용 수정하기
	public void updateBank(BankDTO bank) {

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			String sql = "UPDATE banklist SET account=?, acc_type=?, acc_date=?, ramark=?, balance=? WHERE num=?";

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);

			pstmt.setInt(1, bank.getAccount());
			pstmt.setString(2, bank.getAcc_type());
			pstmt.setString(3, bank.getAcc_date());
			pstmt.setString(4, bank.getRamark());
			pstmt.setInt(5, bank.getBalance());
			pstmt.executeUpdate();			
			conn.commit();

		} catch (Exception ex) {
			System.out.println("updateBoard() 에러 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	} 
	//선택된 글 삭제하기
	public void deleteBank(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "DELETE FROM banklist WHERE num=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteBoard() 에러 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}	
}