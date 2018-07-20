package com.aaa.entity;

/**
 * @author goderyu
 * @date 2018年7月20日 上午10:26:13
 * @description 课程大纲的二级标题实体类
 */
public class SecondCatalog {
	private int id;
	private int catalogid;// 一级标题的id
	private String subcatalogname;// 二级标题名
	private String subctext;// 二级标题文本
	private String subcvideo;// 二级标题视频
	private String subcorder;// 二级标题...

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCatalogid() {
		return catalogid;
	}

	public void setCatalogid(int catalogid) {
		this.catalogid = catalogid;
	}

	public String getSubcatalogname() {
		return subcatalogname;
	}

	public void setSubcatalogname(String subcatalogname) {
		this.subcatalogname = subcatalogname;
	}

	public String getSubctext() {
		return subctext;
	}

	public void setSubctext(String subctext) {
		this.subctext = subctext;
	}

	public String getSubcvideo() {
		return subcvideo;
	}

	public void setSubcvideo(String subcvideo) {
		this.subcvideo = subcvideo;
	}

	public String getSubcorder() {
		return subcorder;
	}

	public void setSubcorder(String subcorder) {
		this.subcorder = subcorder;
	}

}
