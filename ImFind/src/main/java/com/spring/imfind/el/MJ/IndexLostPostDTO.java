package com.spring.imfind.el.MJ;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class IndexLostPostDTO {
	private int Lost_PostNum;
	private String Lost_Title;
	private String Lost_Content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Lost_Re_Date;
	private String Lost_Re_Count;
	private String Lost_Or_File;
	private String Lost_Up_File;
	private int Lost_Pay;
	private String Lost_Item;
	private String Lost_Loc;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Lost_Date;
	private String Id;

	private String Pet_PostNum; // 글번호
	private String Pet_Title; // 글제목
	private String Pet_Content; // 글내용
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date Pet_Re_Date; // 등록날짜
	private String Pet_Pay; // 사례금
	private String Pet_Or_File; // QR파일
	private String Pet_Up_File; // UP파일
	private String Pet_Name; // 애완동물 이름
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private String Pet_LostDate; // 동물 분실 날짜
	private String Pet_Loc; // 동물 분실 위치

	private int commentTotalCnt;

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

	public String getLost_Re_Count() {
		return Lost_Re_Count;
	}

	public void setLost_Re_Count(String lost_Re_Count) {
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

	public int getCommentTotalCnt() {
		return commentTotalCnt;
	}

	public void setCommentTotalCnt(int commentTotalCnt) {
		this.commentTotalCnt = commentTotalCnt;
	}

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

}
