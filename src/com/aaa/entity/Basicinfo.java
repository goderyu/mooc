package com.aaa.entity;

/**
 * @author goderyu
 * @date 2018年7月24日 上午9:55:53
 * @description 用户个人信息实体类,对应表user_basic_info
 */
public class Basicinfo {
	private int id;
	private int userid;
	private String email;
	private int sex;
	private String card;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

}
