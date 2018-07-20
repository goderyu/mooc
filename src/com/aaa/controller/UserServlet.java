package com.aaa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.UserLoginInfo;
import com.aaa.service.UserService;
import com.aaa.service.impl.UserServiceImpl;

public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// 定义请求和响应变量
	private HttpServletRequest req;
	private HttpServletResponse resp;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取请求和响应
		req = request;
		resp = response;
		String method = req.getParameter("method");
		if (method.equals("register")) {
			register();
		} else if (method.equals("login")) {
			login();
		} else if (method.equals("quit")) {
			quit();
		}
	}

	// 注销账户
	private void quit() throws IOException {
		req.getSession().invalidate();
		// 重定向（客户端发两次请求）
		resp.sendRedirect("/mooc/views/before/main.jsp");
	}

	private void register() throws IOException {

		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String telephone = req.getParameter("telephone");
		// 将从前端获取的表单数据封装在实体中
		UserLoginInfo userLogin = new UserLoginInfo();
		userLogin.setUsername(userName);
		userLogin.setPassword(password);
		userLogin.setTelephone(telephone);
		// 定义业务逻辑对象，完成数据访问操作
		UserService userService = new UserServiceImpl();
		int result = userService.insertUserLoginInfo(userLogin);
		// 判断是否插入操作成功
		if (result > 0) {
			resp.getWriter().print("true");
		}
	}

	private void login() throws IOException {
		String tel = req.getParameter("telephone");
		String pwd = req.getParameter("password");
		UserService userService = new UserServiceImpl();
		// 调用业务层查询操作
		UserLoginInfo user = userService.selectByTelAndPwd(tel, pwd);
		if (user != null) {
			// 将user值传递给session对象的user属性中
			req.getSession().setAttribute("user", user);
			resp.getWriter().print("true");
		} else {
			resp.getWriter().print("false");
		}
	}
}
