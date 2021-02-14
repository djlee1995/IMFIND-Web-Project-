
package com.spring.imfind.el.Money;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PayDTO {
	private int Lost_PostNum;
	private String Lost_Title;
	private int Lost_Pay;

	private String Id;
	private String Contact;
	private Long Account_Num;
	private String Bank;
	private String Account_holder;

	private String PayCode;
	private int Pay_Amount;
	private String Pay_Way;
	private String Pay_State;
	@JsonFormat(pattern = "YYYY.MM.dd")
	private Date Pay_Date;
	private String Deal_State;
	@JsonFormat(pattern = "YYYY.MM.dd")
	private Date Deal_Date;

	private String Adjustment_state;
	@JsonFormat(pattern = "YYYY.MM.dd HH:mm:ss")
	private Date Adjustment_date;

	private String F_ID;
	private int Pet_PostNum;
	private String Pet_Title;
	private int Pet_Pay;

	@JsonFormat(pattern = "YYYY.MM.dd HH:mm:ss")
	private Date Deal_Completed_Date;

	public int getLost_PostNum() {
		return Lost_PostNum;
	}

	public void setLost_PostNum(int lost_PostNum) {
		Lost_PostNum = lost_PostNum;
	}

	public String getLost_Title() {
		return Lost_Title;
	}

	public void setLost_Title(String lost_Title) {
		Lost_Title = lost_Title;
	}

	public int getLost_Pay() {
		return Lost_Pay;
	}

	public void setLost_Pay(int lost_Pay) {
		Lost_Pay = lost_Pay;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getContact() {
		return Contact;
	}

	public void setContact(String contact) {
		Contact = contact;
	}

	public String getPayCode() {
		return PayCode;
	}

	public void setPayCode(String payCode) {
		PayCode = payCode;
	}

	public int getPay_Amount() {
		return Pay_Amount;
	}

	public void setPay_Amount(int pay_Amount) {
		Pay_Amount = pay_Amount;
	}

	public String getPay_Way() {
		return Pay_Way;
	}

	public void setPay_Way(String pay_Way) {
		Pay_Way = pay_Way;
	}

	public String getPay_State() {
		return Pay_State;
	}

	public void setPay_State(String pay_State) {
		Pay_State = pay_State;
	}

	public Date getPay_Date() {
		return Pay_Date;
	}

	public void setPay_Date(Date pay_Date) {
		Pay_Date = pay_Date;
	}

	public String getDeal_State() {
		return Deal_State;
	}

	public void setDeal_State(String deal_State) {
		Deal_State = deal_State;
	}

	public Date getDeal_Date() {
		return Deal_Date;
	}

	public void setDeal_Date(Date deal_Date) {
		Deal_Date = deal_Date;
	}

	public String getF_ID() {
		return F_ID;
	}

	public void setF_ID(String f_ID) {
		F_ID = f_ID;
	}

	public int getPet_PostNum() {
		return Pet_PostNum;
	}

	public void setPet_PostNum(int pet_PostNum) {
		Pet_PostNum = pet_PostNum;
	}

	public String getPet_Title() {
		return Pet_Title;
	}

	public void setPet_Title(String pet_Title) {
		Pet_Title = pet_Title;
	}

	public int getPet_Pay() {
		return Pet_Pay;
	}

	public void setPet_Pay(int pet_Pay) {
		Pet_Pay = pet_Pay;
	}

	public Long getAccount_Num() {
		return Account_Num;
	}

	public void setAccount_Num(Long acount_Num) {
		Account_Num = acount_Num;
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

	public String getAdjustment_state() {
		return Adjustment_state;
	}

	public void setAdjustment_state(String adjustment_state) {
		Adjustment_state = adjustment_state;
	}

	public Date getAdjustment_date() {
		return Adjustment_date;
	}

	public void setAdjustment_date(Date adjustment_date) {
		Adjustment_date = adjustment_date;
	}

	public Date getDeal_Completed_Date() {
		return Deal_Completed_Date;
	}

	public void setDeal_Completed_Date(Date deal_Completed_Date) {
		Deal_Completed_Date = deal_Completed_Date;
	}

}
