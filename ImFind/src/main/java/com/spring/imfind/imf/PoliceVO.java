package com.spring.imfind.imf;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PoliceVO {
	private String placeid;
	private String city;
	private String gu;
	private String dong;
	private String depplace;
	private String addr;
	private String tel;
	private String x;
	private String y;
	private String code;
	@JsonFormat(pattern = "YYYY-MM-dd")
	private Date lost_date;
	private String kind;
	private String item;
	private String info;
	private String photo;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPlaceid() {
		return placeid;
	}

	public void setPlaceid(String placeid) {
		this.placeid = placeid;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getDepplace() {
		return depplace;
	}

	public void setDepplace(String depplace) {
		this.depplace = depplace;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public Date getLost_date() {
		return lost_date;
	}

	public void setLost_date(Date lost_date) {
		this.lost_date = lost_date;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "PoliceVO [placeid=" + placeid + ", city=" + city + ", gu=" + gu + ", dong=" + dong + ", depplace="
				+ depplace + ", addr=" + addr + ", tel=" + tel + ", x=" + x + ", y=" + y + ", code=" + code
				+ ", lost_date=" + lost_date + ", kind=" + kind + ", item=" + item + ", info=" + info + ", photo="
				+ photo + "]";
	}

}
