package mvc.model;

public class BankDTO {
	private int num;
	private int account;
	private String acc_type;
	private String acc_date;
	private String ramark;
	private int balance;

	public BankDTO() {
		super();		
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getAcc_type() {
		return acc_type;
	}
	public void setAcc_type(String acc_type) {
		this.acc_type = acc_type;
	}
	public String getAcc_date() {
		return acc_date;
	}
	public void setAcc_date(String acc_date) {
		this.acc_date = acc_date;
	}
	public String getRamark() {
		return ramark;
	}
	public void setRamark(String ramark) {
		this.ramark = ramark;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
}
