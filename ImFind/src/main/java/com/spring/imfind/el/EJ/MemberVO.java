package com.spring.imfind.el.EJ;

public class MemberVO {
	private String Id; /* 회원ID */
	private String Pw; /* PW */
	private String Name; /* 이름 */
	private String Contact; /* 연락처 */
	private String Email; /* E-mail */
	private String Account_Num; /* 계좌번호 */
	private String Bank; /* 금융기관 */
	private String Account_holder; /* 계좌주 */
	private String Join_date; /* 가입날짜 */

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPw() {
		return Pw;
	}

	public void setPw(String pw) {
		Pw = pw;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getContact() {
		return Contact;
	}

	public void setContact(String contact) {
		Contact = contact;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getAccount_Num() {
		return Account_Num;
	}

	public void setAccount_Num(String account_Num) {
		Account_Num = account_Num;
	}

	public String getBank() {
		return Bank;
	}

	public void setBank(String bank) {
		Bank = bank;
	}

	public String getAccount_holder() {
		return Account_holder;
	}

	public void setAccount_holder(String account_holder) {
		Account_holder = account_holder;
	}

	public String getJoin_date() {
		return Join_date;
	}

	public void setJoin_date(String join_date) {
		Join_date = join_date;
	}

	@Override
	public String toString() {
		return "MemberVO [Id=" + Id + ", Pw=" + Pw + ", Name=" + Name + ", Contact=" + Contact + ", Email=" + Email
				+ ", Account_Num=" + Account_Num + ", Bank=" + Bank + ", Account_holder=" + Account_holder
				+ ", Join_date=" + Join_date + "]";
	}

}
