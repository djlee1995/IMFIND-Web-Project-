
package com.spring.imfind.el.YH;

public class LoginDTO {
	private String id;
	private String pw;
	private String contact;
	private String email;
	private String account_num;
	private String account_holder;
	private String bank;
	private String join_date;
	private String name;
	private String savePass;

	public String getSavePass() {
		return savePass;
	}

	public void setSavePass(String savePass) {
		this.savePass = savePass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccount_num() {
		return account_num;
	}

	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}

	public String getAccount_holder() {
		return account_holder;
	}

	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", contact=" + contact + ", email=" + email + ", account_num="
				+ account_num + ", account_holder=" + account_holder + ", bank=" + bank + ", join_date=" + join_date
				+ "]";
	}

}