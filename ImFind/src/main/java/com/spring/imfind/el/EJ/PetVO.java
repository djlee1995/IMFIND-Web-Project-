
package com.spring.imfind.el.EJ;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PetVO {
	private String Pet_PostNum; // 글번호
	private String Pet_Title; // 글제목
	private String Pet_Content; // 글내용
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Pet_Re_Date; // 등록날짜
	private String Pet_Pay; // 사례금
	private String Pet_Or_File; // QR파일
	private String Pet_Up_File; // UP파일
	private String Pet_Name; // 애완동물 이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String Pet_LostDate; // 동물 분실 날짜
	private String Pet_Loc; // 동물 분실 위치
	private String Id; // 회원 ID
	private String Contact; // 연락처
	private String PayCode;

	public String getPet_PostNum() {
		return Pet_PostNum;
	}

	public void setPet_PostNum(String pet_PostNum) {
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

	public String getPet_Pay() {
		return Pet_Pay;
	}

	public void setPet_Pay(String pet_Pay) {
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

	public String getPet_LostDate() {
		return Pet_LostDate;
	}

	public void setPet_LostDate(String pet_LostDate) {
		Pet_LostDate = pet_LostDate;
	}

	public String getPet_Loc() {
		return Pet_Loc;
	}

	public void setPet_Loc(String pet_Loc) {
		Pet_Loc = pet_Loc;
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

	@Override
	public String toString() {
		return "PetVO [Pet_PostNum=" + Pet_PostNum + ", Pet_Title=" + Pet_Title + ", Pet_Content=" + Pet_Content
				+ ", Pet_Re_Date=" + Pet_Re_Date + ", Pet_Pay=" + Pet_Pay + ", Pet_Or_File=" + Pet_Or_File
				+ ", Pet_Up_File=" + Pet_Up_File + ", Pet_Name=" + Pet_Name + ", Pet_LostDate=" + Pet_LostDate
				+ ", Pet_Loc=" + Pet_Loc + ", Id=" + Id + ", Contact=" + Contact + ", PayCode=" + PayCode + "]";
	}

}