package com.spring.imfind.el.YS;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ElVO {
	private int Lost_PostNum;
	private String Lost_Title;   
	private String Lost_Content;  
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Lost_Re_Date; 
	private int Lost_Re_Count;  
	private String Lost_Or_File; 
	private String Lost_Up_File;  
	private int Lost_Pay;
	private String Lost_Item; 
	private String Lost_Loc;  
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Lost_Date; 
	private String Id;  
	private int Contact; 
	
	
	private int Com_Num; 
	private String Com_Content; 
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Com_Date; 
	
	
	private int Not_Num;
	
	private String Receive_id;  
	private String Not_Content;  
	private String Not_Or_File; 
	private String Not_Up_File; 
	
	
	private int Pat_PostNum;   
	private String Pat_Title;  
	private String Pat_Content; 
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Pat_Re_Date; 
	private int Pat_Pay; 
	private String Pat_Or_File; 
	private String Pat_Up_File; 
	private String Pat_Name; 
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Pat_LostDate;
	private String Pat_Loc; 
	
	
	
	
	private String Pw; 
	private String Name; 
	
	private String Email;
	private int Acount_Num; 
	private String Bank; 
	private String Account_holder; 
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Join_date; 

	private String PayCode; 
	private int Pay_Amount;
	private String Pay_Way; 
	private String Pay_State; 
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Pay_Date; 
	private String Deal_State; 
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Deal_Date;

	private String F_Id; 
	
	
	private int Pat_ComNum; 
	private String Pat_ComContent; 
	@JsonFormat(pattern="YYYY.MM.dd")
	private Date Pat_ComDate; 

	
	
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
	public String getLost_Content() {
		return Lost_Content;
	}
	public void setLost_Content(String lost_Content) {
		Lost_Content = lost_Content;
	}
	public Date getLost_Re_Date() {
		return Lost_Re_Date;
	}
	public void setLost_Re_Date(Date lost_Re_Date) {
		Lost_Re_Date = lost_Re_Date;
	}
	public int getLost_Re_Count() {
		return Lost_Re_Count;
	}
	public void setLost_Re_Count(int lost_Re_Count) {
		Lost_Re_Count = lost_Re_Count;
	}
	public String getLost_Or_File() {
		return Lost_Or_File;
	}
	public void setLost_Or_File(String lost_Or_File) {
		Lost_Or_File = lost_Or_File;
	}
	public String getLost_Up_File() {
		return Lost_Up_File;
	}
	public void setLost_Up_File(String lost_Up_File) {
		Lost_Up_File = lost_Up_File;
	}
	public int getLost_Pay() {
		return Lost_Pay;
	}
	public void setLost_Pay(int lost_Pay) {
		Lost_Pay = lost_Pay;
	}
	public String getLost_Item() {
		return Lost_Item;
	}
	public void setLost_Item(String lost_Item) {
		Lost_Item = lost_Item;
	}
	public String getLost_Loc() {
		return Lost_Loc;
	}
	public void setLost_Loc(String lost_Loc) {
		Lost_Loc = lost_Loc;
	}
	public Date getLost_Date() {
		return Lost_Date;
	}
	public void setLost_Date(Date lost_Date) {
		Lost_Date = lost_Date;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public int getContact() {
		return Contact;
	}
	public void setContact(int contact) {
		Contact = contact;
	}
	public int getCom_Num() {
		return Com_Num;
	}
	public void setCom_Num(int com_Num) {
		Com_Num = com_Num;
	}
	public String getCom_Content() {
		return Com_Content;
	}
	public void setCom_Content(String com_Content) {
		Com_Content = com_Content;
	}
	public Date getCom_Date() {
		return Com_Date;
	}
	public void setCom_Date(Date com_Date) {
		Com_Date = com_Date;
	}
	public int getNot_Num() {
		return Not_Num;
	}
	public void setNot_Num(int not_Num) {
		Not_Num = not_Num;
	}
	public String getReceive_id() {
		return Receive_id;
	}
	public void setReceive_id(String receive_id) {
		Receive_id = receive_id;
	}
	public String getNot_Content() {
		return Not_Content;
	}
	public void setNot_Content(String not_Content) {
		Not_Content = not_Content;
	}
	public String getNot_Or_File() {
		return Not_Or_File;
	}
	public void setNot_Or_File(String not_Or_File) {
		Not_Or_File = not_Or_File;
	}
	public String getNot_Up_File() {
		return Not_Up_File;
	}
	public void setNot_Up_File(String not_Up_File) {
		Not_Up_File = not_Up_File;
	}
	public int getPat_PostNum() {
		return Pat_PostNum;
	}
	public void setPat_PostNum(int pat_PostNum) {
		Pat_PostNum = pat_PostNum;
	}
	public String getPat_Title() {
		return Pat_Title;
	}
	public void setPat_Title(String pat_Title) {
		Pat_Title = pat_Title;
	}
	public String getPat_Content() {
		return Pat_Content;
	}
	public void setPat_Content(String pat_Content) {
		Pat_Content = pat_Content;
	}
	public Date getPat_Re_Date() {
		return Pat_Re_Date;
	}
	public void setPat_Re_Date(Date pat_Re_Date) {
		Pat_Re_Date = pat_Re_Date;
	}
	public int getPat_Pay() {
		return Pat_Pay;
	}
	public void setPat_Pay(int pat_Pay) {
		Pat_Pay = pat_Pay;
	}
	public String getPat_Or_File() {
		return Pat_Or_File;
	}
	public void setPat_Or_File(String pat_Or_File) {
		Pat_Or_File = pat_Or_File;
	}
	public String getPat_Up_File() {
		return Pat_Up_File;
	}
	public void setPat_Up_File(String pat_Up_File) {
		Pat_Up_File = pat_Up_File;
	}
	public String getPat_Name() {
		return Pat_Name;
	}
	public void setPat_Name(String pat_Name) {
		Pat_Name = pat_Name;
	}
	public Date getPat_LostDate() {
		return Pat_LostDate;
	}
	public void setPat_LostDate(Date pat_LostDate) {
		Pat_LostDate = pat_LostDate;
	}
	public String getPat_Loc() {
		return Pat_Loc;
	}
	public void setPat_Loc(String pat_Loc) {
		Pat_Loc = pat_Loc;
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
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getAcount_Num() {
		return Acount_Num;
	}
	public void setAcount_Num(int acount_Num) {
		Acount_Num = acount_Num;
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
	public Date getJoin_date() {
		return Join_date;
	}
	public void setJoin_date(Date join_date) {
		Join_date = join_date;
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
	public String getF_Id() {
		return F_Id;
	}
	public void setF_Id(String f_Id) {
		F_Id = f_Id;
	}
	public int getPat_ComNum() {
		return Pat_ComNum;
	}
	public void setPat_ComNum(int pat_ComNum) {
		Pat_ComNum = pat_ComNum;
	}
	public String getPat_ComContent() {
		return Pat_ComContent;
	}
	public void setPat_ComContent(String pat_ComContent) {
		Pat_ComContent = pat_ComContent;
	}
	public Date getPat_ComDate() {
		return Pat_ComDate;
	}
	public void setPat_ComDate(Date pat_ComDate) {
		Pat_ComDate = pat_ComDate;
	}
	@Override
	public String toString() {
		return "ElVO [Lost_PostNum=" + Lost_PostNum + ", Lost_Title=" + Lost_Title + ", Lost_Content=" + Lost_Content
				+ ", Lost_Re_Date=" + Lost_Re_Date + ", Lost_Re_Count=" + Lost_Re_Count + ", Lost_Or_File="
				+ Lost_Or_File + ", Lost_Up_File=" + Lost_Up_File + ", Lost_Pay=" + Lost_Pay + ", Lost_Item="
				+ Lost_Item + ", Lost_Loc=" + Lost_Loc + ", Lost_Date=" + Lost_Date + ", Id=" + Id + ", Contact="
				+ Contact + ", Com_Num=" + Com_Num + ", Com_Content=" + Com_Content + ", Com_Date=" + Com_Date
				+ ", Not_Num=" + Not_Num + ", Receive_id=" + Receive_id + ", Not_Content=" + Not_Content
				+ ", Not_Or_File=" + Not_Or_File + ", Not_Up_File=" + Not_Up_File + ", Pat_PostNum=" + Pat_PostNum
				+ ", Pat_Title=" + Pat_Title + ", Pat_Content=" + Pat_Content + ", Pat_Re_Date=" + Pat_Re_Date
				+ ", Pat_Pay=" + Pat_Pay + ", Pat_Or_File=" + Pat_Or_File + ", Pat_Up_File=" + Pat_Up_File
				+ ", Pat_Name=" + Pat_Name + ", Pat_LostDate=" + Pat_LostDate + ", Pat_Loc=" + Pat_Loc + ", Pw=" + Pw
				+ ", Name=" + Name + ", Email=" + Email + ", Acount_Num=" + Acount_Num + ", Bank=" + Bank
				+ ", Account_holder=" + Account_holder + ", Join_date=" + Join_date + ", PayCode=" + PayCode
				+ ", Pay_Amount=" + Pay_Amount + ", Pay_Way=" + Pay_Way + ", Pay_State=" + Pay_State + ", Pay_Date="
				+ Pay_Date + ", Deal_State=" + Deal_State + ", Deal_Date=" + Deal_Date + ", F_Id=" + F_Id
				+ ", Pat_ComNum=" + Pat_ComNum + ", Pat_ComContent=" + Pat_ComContent + ", Pat_ComDate=" + Pat_ComDate
				+ "]";
	}
	
	
}
