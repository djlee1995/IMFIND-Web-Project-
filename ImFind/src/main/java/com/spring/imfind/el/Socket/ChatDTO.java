
package com.spring.imfind.el.Socket;

import java.util.Date;

public class ChatDTO {

	private String sender;
	private String reciever;
	private String group_id;
	private String header;
	private String create_date;
	private int lost_postnum;
	private int pet_postnum;

	private Date send_date;
	private String message;
	private String user_id;

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

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

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
