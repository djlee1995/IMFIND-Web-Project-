package com.spring.imfind.el.EJ;

import java.util.Date;

public class LostComVO {
	private int Com_Num; // 댓글번호
	private String Com_Content; // 댓글내용
	private Date Com_Date; // 댓글날짜
	private String Id; // 회원ID
	private int Lost_PostNum; //분실물글번호
	
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
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public int getLost_PostNum() {
		return Lost_PostNum;
	}
	public void setLost_PostNum(int lost_PostNum) {
		Lost_PostNum = lost_PostNum;
	}
	
	@Override
	public String toString() {
		return "LostComVO [Com_Num=" + Com_Num + ", Com_Content=" + Com_Content + ", Id=" + Id + ", Lost_PostNum="
				+ Lost_PostNum + "]";
	}
	
	
}
