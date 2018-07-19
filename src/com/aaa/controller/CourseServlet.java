package com.aaa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.CourseBase;
import com.aaa.service.CourseService;
import com.aaa.service.impl.CourseServiceImpl;

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
		}

	}

	private void getOneCourseDetail() throws ServletException, IOException {
		String id = req.getParameter("id");
		CourseBase courseBase = courseService.getCourseBaseById(Integer
				.parseInt(id));
		// 每次都需要将查询出来的结果封装在对象中，再传入req或session中
		req.setAttribute("coursebase", courseBase);
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
