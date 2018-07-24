package com.aaa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.Basicinfo;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.BasicinfoService;
import com.aaa.service.impl.BasicinfoServiceImpl;

/**
 * @author goderyu
 * @date 2018年7月24日 上午9:52:31
 * @description TODO
 */
public class BasicServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private HttpServletRequest req;
	private HttpServletResponse resp;
	BasicinfoService basicinfoService = new BasicinfoServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		req = request;
		resp = response;
		String method = req.getParameter("method");
		int userid = Integer.parseInt(req.getParameter("userid"));
		if (method.equals("getBasicinfo")) {
			getBasicinfo(userid);
		} else if (method.equals("updateBasicinfo")) {
			updateBasicinfo();
		} else if (method.equals("selectEmail")) {
			selectEmail();
		} else if (method.equals("selectCard")) {
			selectCard();
		}
	}

	private void selectCard() throws IOException {
		String card = req.getParameter("userCard");
		Basicinfo basicinfo = basicinfoService.selectCard(card);
		if (basicinfo != null) {
			resp.getWriter().print(true);
		} else {
			resp.getWriter().print(false);
		}
	}

	private void selectEmail() throws IOException {
		String email = req.getParameter("userEmail");
		Basicinfo basicinfo = basicinfoService.selectEmail(email);
		if (basicinfo != null) {
			resp.getWriter().print(true);
		} else {
			resp.getWriter().print(false);
		}
	}

	private void updateBasicinfo() throws IOException, ServletException {
		// 解决中文乱码问题，设置编码格式
		resp.setCharacterEncoding("utf-8");
		UserLoginInfo user = (UserLoginInfo) req.getSession().getAttribute(
				"user");
		int userid = user.getId();
		// 这两句获取不到值，都是null
		String email = req.getParameter("userEmail");
		String card = req.getParameter("userCard");
		Basicinfo basicinfo = new Basicinfo();
		basicinfo.setEmail(email);
		basicinfo.setCard(card);
		basicinfo.setUserid(userid);
		int result = basicinfoService.updateBasicinfo(basicinfo);
		if (result > 0) {
			// resp.getWriter().print("true");
			// req.setAttribute("userEmail", basicinfo.getEmail());
			// req.setAttribute("userCard", basicinfo.getCard());
			getBasicinfo(userid);
			// req.getRequestDispatcher(
			// "views/before/student/student-basicinfo.jsp").forward(req,
			// resp);
		} else {
			// resp.getWriter().print("false");
		}
	}

	/**
	 * @description: Controller层获取用户个人信息
	 * @param @param userid View层传递过来的用户id
	 * @param @throws ServletException
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月24日上午10:51:27
	 */
	private void getBasicinfo(int userid) throws ServletException, IOException {
		Basicinfo basicinfo = basicinfoService.getBasicinfo(userid);
		req.setAttribute("basicinfo", basicinfo);
		req.getRequestDispatcher("views/before/student/student-basicinfo.jsp")
				.forward(req, resp);
	}

}
