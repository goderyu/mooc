package com.aaa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author goderyu
 * @date 2018年7月20日 下午2:41:00
 * @description 学生实体操作的Servlet
 */
public class StudyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HttpServletRequest req = null;
	HttpServletResponse resp = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		req = request;
		resp = response;
		req.getRequestDispatcher("views/before/student/student-frameset.jsp")
				.forward(req, resp);
	}

}
