package com.aaa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.CourseBase;
import com.aaa.entity.CourseFile;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.CourseService;
import com.aaa.service.impl.CourseServiceImpl;
import com.alibaba.fastjson.JSON;

public class CourseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private HttpServletRequest req = null;
	private HttpServletResponse resp = null;
	CourseService courseService = new CourseServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		req = request;
		resp = response;
		String method = req.getParameter("method");
		if (method.equals("getCourseBaseInfo")) {
			getCourseBaseInfo();
		} else if (method.equals("getOneCourseDetail")) {
			getOneCourseDetail();
		} else if (method.equals("getFirstCatalogInfo")) {
			getFirstCatalogInfo();
		} else if (method.equals("getSecondCatalogInfo")) {
			getSecondCatalogInfo();
		} else if (method.equals("getCourseFile")) {
			getCourseFile();
		}
	}

	private void getCourseFile() throws ServletException, IOException {
		int courseid = Integer.parseInt(req.getParameter("courseid"));
		List<CourseFile> list = courseService.getCourseFile(courseid);
		req.setAttribute("cid", courseid);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/views/before/student/student-ziliaogl.jsp").forward(req, resp);
	}

	/**
	 * @description: 获得dao层结果集查出的二级标题对象后转换成json格式传递到view层
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月20日上午10:25:27
	 */
	private void getSecondCatalogInfo() throws IOException {
		// 解决中文乱码问题，设置编码格式
		resp.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		List<SecondCatalog> list = courseService.getSecondCatalog(Integer
				.parseInt(id));
		String json = JSON.toJSONString(list);
		resp.getWriter().print(json);
	}

	/**
	 * @description: 获得dao层结果集查出的一级标题对象后转换成json格式传递到view层
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月20日上午10:04:33
	 */
	private void getFirstCatalogInfo() throws IOException {
		// 解决中文乱码问题，设置编码格式
		resp.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		List<FirstCatalog> list = courseService.getFirstCatalog(Integer
				.parseInt(id));
		String json = JSON.toJSONString(list);
		resp.getWriter().print(json);
	}

	private void getOneCourseDetail() throws ServletException, IOException {
		String id = req.getParameter("id");
		CourseBase courseBase = courseService.getCourseBaseById(Integer
				.parseInt(id));
		// 每次都需要将查询出来的结果封装在对象中，再传入req或session中
		req.setAttribute("coursebase", courseBase);

		// 判断该门课程该用户是否选择而动态显示
		UserLoginInfo user = (UserLoginInfo) req.getSession().getAttribute(
				"user");

		boolean isStudyCourse = courseService.isStudyCourse(user.getId(),
				courseBase.getId());

		req.setAttribute("isStudyCourse", isStudyCourse);

		req.getRequestDispatcher("/views/before/course.jsp").forward(req, resp);
	}

	private void getCourseBaseInfo() throws IOException, ServletException {
		//
		List<CourseBase> list = courseService.selectAllCourse();
		// 将list值赋值给前台使用的属性list中
		req.setAttribute("list", list);
		// 转发（服务器端进行跳转）
		req.getRequestDispatcher("/views/before/main.jsp").forward(req, resp);
	}

}
