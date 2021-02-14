package com.spring.imfind.el.EJ;

import java.util.Date;

public class replyVO {
	int re_num;
	String re_content;
	Date re_date;
	String id;
	int com_num;
	int lost_postnum;
	int pet_postnum;

	public int getLost_postnum() {
		return lost_postnum;
	}

	public void setLost_postnum(int lost_postnum) {
		this.lost_postnum = lost_postnum;
	}

	public int getPet_postnum() {
		return pet_postnum;
	}

	public void setPet_postnum(int pet_postnum) {
		this.pet_postnum = pet_postnum;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCom_num() {
		return com_num;
	}

	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}

}