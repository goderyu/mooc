package com.aaa.entity;

/**
 * @author goderyu
 * @date 2018年7月20日 上午9:49:16
 * @description 课程详情中第一标题的实体类
 */
public class FirstCatalog {
	private int id;
	private String courseid;// 课程id，映射coursebase表中id
	private String catalogname;// 标题名
	private String ctext;// 文本
	private String cvideo;// 视频
	private int corder;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	public String getCatalogname() {
		return catalogname;
	}

	public void setCatalogname(String catalogname) {
		this.catalogname = catalogname;
	}

	public String getCtext() {
		return ctext;
	}

	public void setCtext(String ctext) {
		this.ctext = ctext;
	}

	public String getCvideo() {
		return cvideo;
	}

	public void setCvideo(String cvideo) {
		this.cvideo = cvideo;
	}

	public int getCorder() {
		return corder;
	}

	public void setCorder(int corder) {
		this.corder = corder;
	}
}
