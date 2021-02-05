package com.spring.imfind.el.MJ;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ItemVO {

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date Lost_Date;
	private String Id;
	private int Contact;
	private int like_cnt;

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

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

	public int getContact() {
		return Contact;
	}

	public void setContact(int contact) {
		Contact = contact;
	}

	@Override
	public String toString() {
		return "ItemVO [Lost_PostNum=" + Lost_PostNum + ", Lost_Title=" + Lost_Title + ", Lost_Content=" + Lost_Content
				+ ", Lost_Re_Date=" + Lost_Re_Date + ", Lost_Re_Count=" + Lost_Re_Count + ", Lost_Or_File="
				+ Lost_Or_File + ", Lost_Up_File=" + Lost_Up_File + ", Lost_Pay=" + Lost_Pay + ", Lost_Item="
				+ Lost_Item + ", Lost_Loc=" + Lost_Loc + ", Lost_Date=" + Lost_Date + ", Id=" + Id + ", Contact="
				+ Contact + "]";
	}

}