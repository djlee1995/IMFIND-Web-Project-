package com.spring.imfind.el.EJ;

import java.util.Date;

public class ComVO {
	private int Com_Num;
	private String Com_Content; // 댓글내용
	private Date Com_Date; // 댓글날짜
	private String Id; // 회원ID
	private int Lost_PostNum; // 분실물글번호
	private int re_num;
	private String re_content;
	private Date re_date;

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

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	@Override
	public String toString() {
		return "ComVO [Com_Num=" + Com_Num + ", Com_Content=" + Com_Content + ", Com_Date=" + Com_Date + ", Id=" + Id
				+ ", Lost_PostNum=" + Lost_PostNum + ", re_num=" + re_num + ", re_content=" + re_content + ", re_date="
				+ re_date + "]";
	}

}