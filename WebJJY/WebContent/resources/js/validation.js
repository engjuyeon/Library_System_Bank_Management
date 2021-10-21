/**
 * 
 */
 
function CheckAddBook(){
	var bookId = document.getElementById("id");
	var name = document.getElementById("name");
	var unitsInStock = document.getElementById("unitsInStock");
	var publisher = document.getElementById("publisher");
	var author = document.getElementById("author");
	
	  if (bookId.value == "") {
            alert("[도서 코드]\n도서 코드를 입력하지 않았습니다.")
            bookId.select();
            bookId.focus();
            return false;
    }
    
    if (publisher.value == "") {
            alert("[출판사]\n출판사명을 입력하지 않았습니다.")
            publisher.select();
            publisher.focus();
            return false;
    }
    
    if (author.value == "") {
            alert("[저자명]\n저자명을 입력하지 않았습니다.")
            author.select();
            author.focus();
            return false;
    }
    
 	if (name.value == "") {
            alert("[도서명]\n도서명을 입력하지 않았습니다.")
            name.select();
            name.focus();
            return false;
    }
        
	if (!check(/^B[0-9]{4,11}$/, bookId,
		"[도서 코드]\nB와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 B로 시작하세요"))
		return false;
	
	if (isNaN(unitsInStock.value)){
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	
	document.newBook.submit()
}
