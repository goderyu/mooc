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
	private HttpServletRequest req=null;
	private HttpServletResponse resp=null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		req = request;
		resp = response;
		String method = req.getParameter("method");
		if(method.equals("getCourseBaseInfo")){
			getCourseBaseInfo();
		}
		
	}

	private void getCourseBaseInfo() throws IOException, ServletException {
		//
		CourseService course = new CourseServiceImpl();
		List<CourseBase> list = course.selectAllCourse();
		// 将list值赋值给前台使用的属性list中
		req.setAttribute("list", list);
		// 转发（服务器端进行跳转）
		req.getRequestDispatcher("/views/before/main.jsp").forward(req, resp);
	}

}
