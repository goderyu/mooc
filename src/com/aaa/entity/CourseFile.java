package com.aaa.entity;

import java.sql.Timestamp;

/**
 * @author goderyu
 * @date 2018年7月25日 上午10:02:36
 * @description 课程文件（资料）实体类，对应fileku表
 */
public class CourseFile {
	private int id;
	private int courseid;// 课程id
	private Timestamp filedate;// 文件时间
	private String filename;// 文件名
	private String filesrc;// 文件路径

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}

	public Timestamp getFiledate() {
		return filedate;
	}

	public void setFiledate(Timestamp filedate) {
		this.filedate = filedate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilesrc() {
		return filesrc;
	}

	public void setFilesrc(String filesrc) {
		this.filesrc = filesrc;
	}

}
