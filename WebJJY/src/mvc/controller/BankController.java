package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BankDAO;
import mvc.model.BankDTO;

public class BankController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5; 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
	
		if (command.equals("/BankListAction.jy")) {//등록된 글 목록 페이지 출력하기
			requestBankList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./bankList.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BankWriteForm.jy")) { // 글 등록 페이지 출력하기
				//requestBankName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./bankWriteForm.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/BankWriteAction.jy")) {// 새로운 글 등록하기
				requestBankWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BankListAction.jy");
				rd.forward(request, response);						
		} else if (command.equals("/BankViewAction.jy")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./bankView.jsp");
				rd.forward(request, response);	
		}else if (command.equals("/BankDeleteAction.jy")) { //선택된 글 삭제하기
				requestBankDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BankListAction.jy");
				rd.forward(request, response);				
		} else if (command.equals("/BankUpdateAction.jy")) {
				requestBankUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BankListAction.jy");
				rd.forward(request, response);	
		}
	}
	//등록된 글 목록 가져오기	
	public void requestBankList(HttpServletRequest request){
			
	BankDAO dao = BankDAO.getInstance();
		List<BankDTO> banklist = new ArrayList<BankDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record=dao.getListCount(items, text);
		banklist = dao.getBankList(pageNum,limit, items, text); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("banklist", banklist);								
	}
	//선택된 글 내용 수정하기
		public void requestBankUpdate(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
			int type = Integer.parseInt(request.getParameter("acc_type"));
			BankDAO dao = BankDAO.getInstance();		
			
			BankDTO bank = new BankDTO();		
			bank.setNum(num);	
			bank.setNum(type);
			bank.setRamark(request.getParameter("ramark"));	
			
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			 String regist_day = formatter.format(new java.util.Date()); 
			 
			
			 bank.setAcc_date(regist_day);		
			
			 dao.updateBank(bank);								
		}
		//선택된 글 삭제하기
		public void requestBankDelete(HttpServletRequest request){
						
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
			
			BankDAO dao = BankDAO.getInstance();
			dao.deleteBank(num);							
		}	
		private void requestBankWrite(HttpServletRequest request) {
			// TODO Auto-generated method stub
			int acc = Integer.parseInt(request.getParameter("acc"));
			int balance = Integer.parseInt(request.getParameter("balance"));
			BankDAO dao = BankDAO.getInstance();
			
			BankDTO bank = new BankDTO();
			bank.setAccount(acc);
			bank.setAcc_type(request.getParameter("type"));
			bank.setRamark(request.getParameter("ramark"));	
			bank.setBalance(balance);
			
			System.out.println(request.getParameter("acc"));
			System.out.println(request.getParameter("type"));
			System.out.println(request.getParameter("ramark"));
			System.out.println(request.getParameter("balance"));
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String regist_day = formatter.format(new java.util.Date()); 


			bank.setAcc_date(regist_day);
			
			dao.insertBank(bank);			
		}

}
