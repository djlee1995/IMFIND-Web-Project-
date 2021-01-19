package com.spring.imfind.el.EJ;

import java.util.Date;

public class PetVO {
	private String Pat_PostNum; // 글번호
	private String Pat_Title; // 글제목
	private String Pat_Content; // 글내용
	private Date Pat_Re_Date; // 등록날짜
	private int Pat_Pay; //사례금
	private String Pat_Or_File; // QR파일
	private String Pat_Up_File; // UP파일
	private String Pat_Name; // 애완동물 이름
	private String Pat_LostDate; //동물 분실 날짜
	private String Pat_Loc; // 동물 분실 위치
	private String Id; // 회원 ID
	private String Contact; // 연락처
	
	public String getPat_PostNum() {
		return Pat_PostNum;
	}
	public void setPat_PostNum(String pat_PostNum) {
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
	public String getPat_LostDate() {
		return Pat_LostDate;
	}
	public void setPat_LostDate(String pat_LostDate) {
		Pat_LostDate = pat_LostDate;
	}
	public String getPat_Loc() {
		return Pat_Loc;
	}
	public void setPat_Loc(String pat_Loc) {
		Pat_Loc = pat_Loc;
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
	
	@Override
	public String toString() {
		return "PetVO [Pat_PostNum=" + Pat_PostNum + ", Pat_Title=" + Pat_Title + ", Pat_Content=" + Pat_Content
				+ ", Pat_Pay=" + Pat_Pay + ", Pat_Or_File=" + Pat_Or_File + ", Pat_Up_File=" + Pat_Up_File
				+ ", Pat_Name=" + Pat_Name + ", Pat_LostDate=" + Pat_LostDate + ", Pat_Loc=" + Pat_Loc + ", Id=" + Id
				+ ", Contact=" + Contact + "]";
	}
	
	
}
