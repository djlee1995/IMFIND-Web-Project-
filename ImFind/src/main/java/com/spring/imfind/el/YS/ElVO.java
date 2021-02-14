package com.spring.imfind.el.YS;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

// F_id, 하나 더 아마 grade
public class ElVO {
	private int Lost_PostNum;
	private String Lost_Title;
	private String Lost_Content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Lost_Re_Date;
	private int Lost_Re_Count;
	private String Lost_Or_File;
	private String Lost_Up_File;
	private int Lost_Pay;
	private String Lost_Item;
	private String Lost_Loc;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Lost_Date;
	private String Id;
	private int Contact;
	private int Com_Num;
	private String Com_Content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Com_Date;
	private int Not_Num;
	private String Receive_id;
	private String Not_Content;
	private String Not_Or_File;
	private String Not_Up_File;
	private int Pet_PostNum;
	private String Pet_Title;
	private String Pet_Content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Pet_Re_Date;
	private int Pet_Pay;
	private String Pet_Or_File;
	private String Pet_Up_File;
	private String Pet_Name;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Pet_LostDate;
	private String Pet_Loc;
	private String Pw;
	private String Name;
	private String Email;
	private int Acount_Num;
	private String Bank;
	private String Account_holder;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Join_date;
	private String PayCode;
	private int Pay_Amount;
	private String Pay_Way;
	private String Pay_State;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Pay_Date;
	private String Deal_State;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Deal_Date;
	private String F_Id;
	private int Pet_ComNum;
	private String Pet_ComContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Pet_ComDate;
	private int grade;

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

	public String getPet_Content() {
		return Pet_Content;
	}

	public void setPet_Content(String pet_Content) {
		Pet_Content = pet_Content;
	}

	public Date getPet_Re_Date() {
		return Pet_Re_Date;
	}

	public void setPet_Re_Date(Date pet_Re_Date) {
		Pet_Re_Date = pet_Re_Date;
	}

	public int getPet_Pay() {
		return Pet_Pay;
	}

	public void setPet_Pay(int pet_Pay) {
		Pet_Pay = pet_Pay;
	}

	public String getPet_Or_File() {
		return Pet_Or_File;
	}

	public void setPet_Or_File(String pet_Or_File) {
		Pet_Or_File = pet_Or_File;
	}

	public String getPet_Up_File() {
		return Pet_Up_File;
	}

	public void setPet_Up_File(String pet_Up_File) {
		Pet_Up_File = pet_Up_File;
	}

	public String getPet_Name() {
		return Pet_Name;
	}

	public void setPet_Name(String pet_Name) {
		Pet_Name = pet_Name;
	}

	public Date getPet_LostDate() {
		return Pet_LostDate;
	}

	public void setPet_LostDate(Date pet_LostDate) {
		Pet_LostDate = pet_LostDate;
	}

	public String getPet_Loc() {
		return Pet_Loc;
	}

	public void setPet_Loc(String pet_Loc) {
		Pet_Loc = pet_Loc;
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

	public int getPet_ComNum() {
		return Pet_ComNum;
	}

	public void setPet_ComNum(int pet_ComNum) {
		Pet_ComNum = pet_ComNum;
	}

	public String getPet_ComContent() {
		return Pet_ComContent;
	}

	public void setPet_ComContent(String pet_ComContent) {
		Pet_ComContent = pet_ComContent;
	}

	public Date getPet_ComDate() {
		return Pet_ComDate;
	}

	public void setPet_ComDate(Date pet_ComDate) {
		Pet_ComDate = pet_ComDate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "ElVO [Lost_PostNum=" + Lost_PostNum + ", Lost_Title=" + Lost_Title + ", Lost_Content=" + Lost_Content
				+ ", Lost_Re_Date=" + Lost_Re_Date + ", Lost_Re_Count=" + Lost_Re_Count + ", Lost_Or_File="
				+ Lost_Or_File + ", Lost_Up_File=" + Lost_Up_File + ", Lost_Pay=" + Lost_Pay + ", Lost_Item="
				+ Lost_Item + ", Lost_Loc=" + Lost_Loc + ", Lost_Date=" + Lost_Date + ", Id=" + Id + ", Contact="
				+ Contact + ", Com_Num=" + Com_Num + ", Com_Content=" + Com_Content + ", Com_Date=" + Com_Date
				+ ", Not_Num=" + Not_Num + ", Receive_id=" + Receive_id + ", Not_Content=" + Not_Content
				+ ", Not_Or_File=" + Not_Or_File + ", Not_Up_File=" + Not_Up_File + ", Pet_PostNum=" + Pet_PostNum
				+ ", Pet_Title=" + Pet_Title + ", Pet_Content=" + Pet_Content + ", Pet_Re_Date=" + Pet_Re_Date
				+ ", Pet_Pay=" + Pet_Pay + ", Pet_Or_File=" + Pet_Or_File + ", Pet_Up_File=" + Pet_Up_File
				+ ", Pet_Name=" + Pet_Name + ", Pet_LostDate=" + Pet_LostDate + ", Pet_Loc=" + Pet_Loc + ", Pw=" + Pw
				+ ", Name=" + Name + ", Email=" + Email + ", Acount_Num=" + Acount_Num + ", Bank=" + Bank
				+ ", Account_holder=" + Account_holder + ", Join_date=" + Join_date + ", PayCode=" + PayCode
				+ ", Pay_Amount=" + Pay_Amount + ", Pay_Way=" + Pay_Way + ", Pay_State=" + Pay_State + ", Pay_Date="
				+ Pay_Date + ", Deal_State=" + Deal_State + ", Deal_Date=" + Deal_Date + ", F_Id=" + F_Id
				+ ", Pet_ComNum=" + Pet_ComNum + ", Pet_ComContent=" + Pet_ComContent + ", Pet_ComDate=" + Pet_ComDate
				+ ", grade=" + grade + "]";
	}

}