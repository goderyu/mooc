package com.aaa.dao.impl;

import java.util.List;

import com.aaa.dao.BaseDAO;
import com.aaa.dao.CourseDAO;
import com.aaa.entity.CourseBase;
import com.aaa.entity.CourseFile;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;

public class CourseDAOImpl extends BaseDAO implements CourseDAO {

	@Override
	public List<CourseBase> selectAllCourse() {

		String sql = "select id,cname,summary,img,count,introduce,teacherid,clickRate from coursebase";
		List<CourseBase> list = search(sql, CourseBase.class, null);
		return list;

	}

	@Override
	public CourseBase getCourseBaseById(int id) {
		String sql = "select id,cname,summary,img,count,introduce,teacherid,clickRate from coursebase where id = ?";

		Object[] params = { id };

		List<CourseBase> list = search(sql, CourseBase.class, params);
		if (list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	@Override
	public List<FirstCatalog> getFirstCatalog(int id) {
		String sql = "select id,courseid,catalogname,ctext,cvideo,corder from coursefirstcatalog where courseid = ?";
		Object[] params = { id };
		List<FirstCatalog> list = search(sql, FirstCatalog.class, params);
		return list;
	}

	@Override
	public List<SecondCatalog> getSecondCatalog(int id) {
		String sql = "select id,catalogid,subcatalogname,subctext,subcvideo,subcorder from coursesecondcatalog where catalogid = ?";
		Object[] params = { id };
		List<SecondCatalog> list = search(sql, SecondCatalog.class, params);
		return list;
	}

	@Override
	public boolean isStudyCourse(int userid, int courseid) {
		String sql = "select id,userid,courseid from student_course where userid=? and courseid=?";
		Object[] params = { userid, courseid };
		List<Object> list = search(sql, Object.class, params);
		return (list.size() > 0) ? true : false;
	}

	@Override
	public int insStudentCourse(int userid, int courseid) {
		String sql = "insert into student_course(userid,courseid) values(?,?)";
		Object[] params = { userid, courseid };
		return savaOrUpdate(sql, params);
	}

	@Override
	public int updateCount(int courseid) {
		String sql = "update coursebase set count=count+1 where id=?";
		Object[] params = { courseid };
		return savaOrUpdate(sql, params);
	}

	@Override
	public List<CourseFile> getCourseFile(int courseid) {
		String sql = "select id,courseid,filedate,filename,filesrc from fileku where courseid=?";
		Object[] params = { courseid };
		List<CourseFile> list = search(sql, CourseFile.class, params);
		if (list.size() > 0)
			return list;
		else
			return null;
	}

	@Override
	public String getFirstSecondCatalogText(int catalogid, int state) {
		String sql = null;
		Object[] params = { catalogid };
		if (state == 1) {
			sql = "select ctext from coursefirstcatalog where id=?";
			List<FirstCatalog> list = search(sql, FirstCatalog.class, params);
			return list.get(0).getCtext();
		} else if (state == 2) {
			sql = "select subctext from coursesecondcatalog where id=?";
			List<SecondCatalog> list = search(sql, SecondCatalog.class, params);
			return list.get(0).getSubctext();
		} else
			return null;

	}

	@Override
	public String getFirstSecondCatalogVideo(int catalogid, int state) {
		String sql = null;
		Object[] params = { catalogid };
		if (state == 1) {
			sql = "select cvideo from coursefirstcatalog where id=?";
			List<FirstCatalog> list = search(sql, FirstCatalog.class, params);
			System.out.println("list.get(0).getCvideo()="+list.get(0).getCvideo());
			return list.get(0).getCvideo();
		} else if (state == 2) {
			sql = "select subcvideo from coursesecondcatalog where id=?";
			List<SecondCatalog> list = search(sql, SecondCatalog.class, params);
			System.out.println("list.get(0).getSubcvideo()="+list.get(0).getSubcvideo());
			return list.get(0).getSubcvideo();
		} else
			return null;
	}

}
