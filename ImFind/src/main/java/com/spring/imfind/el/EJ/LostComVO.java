package com.spring.imfind.el.EJ;

import java.util.Date;

public class LostComVO {
	private int Com_Num; // 댓글번호
	private String Com_Content; // 댓글내용
	private Date Com_Date; // 댓글날짜
	private String Id; // 회원ID
	private int Lost_PostNum; // 분실물글번호
	private int Re_Com_Num; /* 대댓글 번호 */
	private String Re_Com_Content; // 대댓글 내용
	private Date Re_Com_Date; // 대댓글날짜
	private String Writer; // 대댓글쓴이
	private String Secret_Com; // 비댓여부
	private int Re_Lev; // 들여쓰기
	private int Re_Seq; // 대댓글 순서

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

	public int getRe_Com_Num() {
		return Re_Com_Num;
	}

	public void setRe_Com_Num(int re_Com_Num) {
		Re_Com_Num = re_Com_Num;
	}

	public String getRe_Com_Content() {
		return Re_Com_Content;
	}

	public void setRe_Com_Content(String re_Com_Content) {
		Re_Com_Content = re_Com_Content;
	}

	public Date getRe_Com_Date() {
		return Re_Com_Date;
	}

	public void setRe_Com_Date(Date re_Com_Date) {
		Re_Com_Date = re_Com_Date;
	}

	public String getWriter() {
		return Writer;
	}

	public void setWriter(String writer) {
		Writer = writer;
	}

	public String getSecret_Com() {
		return Secret_Com;
	}

	public void setSecret_Com(String secret_Com) {
		Secret_Com = secret_Com;
	}

	public int getRe_Lev() {
		return Re_Lev;
	}

	public void setRe_Lev(int re_Lev) {
		Re_Lev = re_Lev;
	}

	public int getRe_Seq() {
		return Re_Seq;
	}

	public void setRe_Seq(int re_Seq) {
		Re_Seq = re_Seq;
	}

	@Override
	public String toString() {
		return "LostComVO [Com_Num=" + Com_Num + ", Com_Content=" + Com_Content + ", Com_Date=" + Com_Date + ", Id="
				+ Id + ", Lost_PostNum=" + Lost_PostNum + ", Re_Com_Num=" + Re_Com_Num + ", Re_Com_Content="
				+ Re_Com_Content + ", Re_Com_Date=" + Re_Com_Date + ", Writer=" + Writer + ", Secret_Com=" + Secret_Com
				+ ", Re_Lev=" + Re_Lev + ", Re_Seq=" + Re_Seq + "]";
	}

}
