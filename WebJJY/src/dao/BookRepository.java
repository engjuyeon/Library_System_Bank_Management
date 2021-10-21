package dao;

import java.util.ArrayList;
import dto.Book;

public class BookRepository {
	
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	public BookRepository() {
		
		Book first = new Book("B0001","쉽게 배우는 JSP 웹 프로그래밍");
		first.setDescription("단계별로 쇼핑몰을 구현하며 배우는 JSP 웹 프로그래밍");
		first.setAuthor("송미영");
		first.setPublisher("한빛아카데미");
		first.setUnitsInStock(10);
		first.setCondition("old");
		first.setFilename("B0001.jpg");
		
		Book second = new Book("B0002","로봇 시대 일자리의 미래");
		second.setDescription("세계 1위 미래학자가 내다본 로봇과 일자리 전쟁! 위협과 기회의 갈림길에서 일자리의 미래를 분석한다");
		second.setAuthor("제이슨 솅커");
		second.setPublisher("미디어숲");
		second.setUnitsInStock(10);
		second.setCondition("new");
		second.setFilename("B0002.jpg");
		
		Book third = new Book("B0003","블록체인 무엇인가?");
		third.setDescription("전 세계 사람들이 주목하는 블록체인 입문서! 수학, 코딩 몰라도 이해하는 비유의 힘");
		third.setAuthor("다니엘 드레셔");
		third.setPublisher("이지스퍼블리싱");
		third.setUnitsInStock(10);
		third.setCondition("new");
		third.setFilename("B0003.jpg");
		
		Book f = new Book("B0004","모두의 네트워크");
		f.setDescription("네트워크를 전혀 몰라도 괜찮다! 초보자와 비전공자를 위한 가장 쉬운 네트워크 입문서");
		f.setAuthor("미즈구치 카츠야");
		f.setPublisher("길벗");
		f.setUnitsInStock(8);
		f.setCondition("old");
		f.setFilename("B0004.jpg");
		
		listOfBooks.add(first);
		listOfBooks.add(second);
		listOfBooks.add(third);
		listOfBooks.add(f);
		
	}
	
	
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
	
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	public Book getBookById(String bookId) {
		Book bookById = null;
		
		for( int i = 0; i < listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	
}
