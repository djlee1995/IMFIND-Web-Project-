package com.spring.imfind.el.EJ;

import java.util.Date;

public class BoardVO {
	private int lost_postnum;
	private String lost_title;
	private String lost_content;
	private Date lost_re_date;
	private int lost_re_count;
	private String lost_or_file;
	private String lost_up_file;
	private int lost_pay;
	private String lost_item;
	private String lost_loc;
	private Date lost_date;
	private String id;
	private int contact;

	public int getLost_postnum() {
		return lost_postnum;
	}
	public void setLost_postnum(int lost_postnum) {
		this.lost_postnum = lost_postnum;
	}
	public String getLost_title() {
		return lost_title;
	}
	public void setLost_title(String lost_title) {
		this.lost_title = lost_title;
	}
	public String getLost_content() {
		return lost_content;
	}
	public void setLost_content(String lost_content) {
		this.lost_content = lost_content;
	}
	public Date getLost_re_date() {
		return lost_re_date;
	}
	public void setLost_re_date(Date lost_re_date) {
		this.lost_re_date = lost_re_date;
	}
	public int getLost_re_count() {
		return lost_re_count;
	}
	public void setLost_re_count(int lost_re_count) {
		this.lost_re_count = lost_re_count;
	}
	public String getLost_or_file() {
		return lost_or_file;
	}
	public void setLost_or_file(String lost_or_file) {
		this.lost_or_file = lost_or_file;
	}
	public String getLost_up_file() {
		return lost_up_file;
	}
	public void setLost_up_file(String lost_up_file) {
		this.lost_up_file = lost_up_file;
	}
	public int getLost_pay() {
		return lost_pay;
	}
	public void setLost_pay(int lost_pay) {
		this.lost_pay = lost_pay;
	}
	public String getLost_item() {
		return lost_item;
	}
	public void setLost_item(String lost_item) {
		this.lost_item = lost_item;
	}
	public String getLost_loc() {
		return lost_loc;
	}
	public void setLost_loc(String lost_loc) {
		this.lost_loc = lost_loc;
	}
	public Date getLost_date() {
		return lost_date;
	}
	public void setLost_date(Date lost_date) {
		this.lost_date = lost_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	@Override
	public String toString() {
		return "BoardVO [lost_postnum=" + lost_postnum + ", lost_title=" + lost_title + ", lost_content=" + lost_content
				+ ", lost_re_date=" + lost_re_date + ", lost_re_count=" + lost_re_count + ", lost_or_file="
				+ lost_or_file + ", lost_up_file=" + lost_up_file + ", lost_pay=" + lost_pay + ", lost_item="
				+ lost_item + ", lost_loc=" + lost_loc + ", lost_date=" + lost_date + ", id=" + id + ", contact="
				+ contact + "]";
	}

}
