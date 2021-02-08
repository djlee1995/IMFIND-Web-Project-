
package com.spring.imfind.el.EJ;

import java.util.Date;

public class PayVO {
	private String PayCode; // 결제코드(주문번호)
	private int Pay_Amount; // 사례금액
	private String Pay_Way; // 결제방법
	private String Pay_State; // 결제상태
	private String Pay_Date; // 결제일자
	private String Deal_State; // 거래상태
	private Date Deal_Date; // 거래날짜
	private String Id; // 분실회원ID
	private String F_Id; // 파인더ID
	private String Lost_PostNum; // 분실물글번호
	private String Pat_PostNum; // 애완동물글번호
	private String Cancel_Date;

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

	public String getPay_Date() {
		return Pay_Date;
	}

	public void setPay_Date(String pay_Date) {
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

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getF_Id() {
		return F_Id;
	}

	public void setF_Id(String f_Id) {
		F_Id = f_Id;
	}

	public String getLost_PostNum() {
		return Lost_PostNum;
	}

	public void setLost_PostNum(String lost_PostNum) {
		Lost_PostNum = lost_PostNum;
	}

	public String getPat_PostNum() {
		return Pat_PostNum;
	}

	public void setPat_PostNum(String pat_PostNum) {
		Pat_PostNum = pat_PostNum;
	}

	public String getCancel_Date() {
		return Cancel_Date;
	}

	public void setCancel_Date(String cancel_Date) {
		Cancel_Date = cancel_Date;
	}

	@Override
	public String toString() {
		return "PayVO [PayCode=" + PayCode + ", Pay_Amount=" + Pay_Amount + ", Pay_Way=" + Pay_Way + ", Pay_State="
				+ Pay_State + ", Pay_Date=" + Pay_Date + ", Deal_State=" + Deal_State + ", Deal_Date=" + Deal_Date
				+ ", Id=" + Id + ", F_Id=" + F_Id + ", Lost_PostNum=" + Lost_PostNum + ", Pat_PostNum=" + Pat_PostNum
				+ ", Cancel_Date=" + Cancel_Date + "]";
	}

}
