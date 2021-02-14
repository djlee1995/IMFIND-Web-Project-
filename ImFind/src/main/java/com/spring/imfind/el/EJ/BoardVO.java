
package com.spring.imfind.el.EJ;

import java.util.Date;

public class BoardVO {
	private int Lost_PostNum; // 글번호
	private String Lost_Title; // 글제목
	private String Lost_Content; // 글내용
	private Date Lost_Re_Date; // 등록날짜
	private int Lost_Re_Count; // 조회수
	private String Lost_Up_File; // UP파일
	private String Lost_Pay; // 사례금
	private String Lost_Item; // 분실물명
	private String Lost_Loc; // 분실위치
	private String Lost_Date; // 분실날짜
	private String Id; // 회원ID
	private String PayCode;

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

//	public String getLost_Or_File() {
//		return Lost_Or_File;
//	}
//	public void setLost_Or_File(String lost_Or_File) {
//		Lost_Or_File = lost_Or_File;
//	}
	public String getLost_Up_File() {
		return Lost_Up_File;
	}

	public String setLost_Up_File(String lost_Up_File) {
		return Lost_Up_File = lost_Up_File;
	}

	public String getLost_Pay() {
		return Lost_Pay;
	}

	public void setLost_Pay(String lost_Pay) {
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

	public String getLost_Date() {
		return Lost_Date;
	}

	public void setLost_Date(String lost_Date) {
		Lost_Date = lost_Date;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPayCode() {
		return PayCode;
	}

	public void setPayCode(String payCode) {
		PayCode = payCode;
	}

	@Override
	public String toString() {
		return "BoardVO [Lost_PostNum=" + Lost_PostNum + ", Lost_Title=" + Lost_Title + ", Lost_Content=" + Lost_Content
				+ ", Lost_Re_Date=" + Lost_Re_Date + ", Lost_Re_Count=" + Lost_Re_Count + ", Lost_Up_File="
				+ Lost_Up_File + ", Lost_Pay=" + Lost_Pay + ", Lost_Item=" + Lost_Item + ", Lost_Loc=" + Lost_Loc
				+ ", Lost_Date=" + Lost_Date + ", Id=" + Id + "]";
	}
}