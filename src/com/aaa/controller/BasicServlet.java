package com.aaa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.Basicinfo;
import com.aaa.service.BasicinfoService;
import com.aaa.service.impl.BasicinfoServiceImpl;
import com.aaa.util.AjaxWriter;

/**
 * @author goderyu
 * @date 2018年7月24日 上午9:52:31
 * @description 控制学生账户信息的Servlet
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
		if (method.equals("getBasicinfo")) {
			getBasicinfo();
		} else if (method.equals("updateBasicinfo")) {
			updateBasicinfo();
		} else if (method.equals("selectEmail")) {
			selectEmail();
		} else if (method.equals("selectCard")) {
			selectCard();
		}
	}

	/**
	 * @description: 查询更新的身份证号是否已在库
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月25日上午8:34:10
	 */
	private void selectCard() throws IOException {
		String card = req.getParameter("userCard");
		int userid = Integer.parseInt(req.getParameter("userid"));
		boolean flag = basicinfoService.selectCard(card, userid);
		AjaxWriter.write(resp, flag);
	}

	/**
	 * @description: 查询更新的电子邮箱是否已在库
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月25日上午8:34:46
	 */
	private void selectEmail() throws IOException {
		String email = req.getParameter("userEmail");
		int userid = Integer.parseInt(req.getParameter("userid"));
		boolean flag = basicinfoService.selectEmail(email, userid);
		AjaxWriter.write(resp, flag);
	}

	/**
	 * @description: 更新账户信息事件
	 * @param @throws IOException
	 * @param @throws ServletException
	 * @return void
	 * @date 2018年7月25日上午8:35:00
	 */
	private void updateBasicinfo() throws IOException, ServletException {
		// 解决中文乱码问题，设置编码格式
		resp.setCharacterEncoding("utf-8");
		Basicinfo basicinfo = new Basicinfo();
		int userid = Integer.parseInt(req.getParameter("userid"));
		basicinfo.setEmail(req.getParameter("userEmail"));
		basicinfo.setCard(req.getParameter("userCard"));
		basicinfo.setUserid(userid);
		int result = basicinfoService.updateBasicinfo(basicinfo);
		if (result > 0)
			getBasicinfo();
	}

	/**
	 * @description: Controller层获取用户个人信息
	 * @param @param userid View层传递过来的用户id
	 * @param @throws ServletException
	 * @param @throws IOException
	 * @return void
	 * @date 2018年7月24日上午10:51:27
	 */
	private void getBasicinfo() throws ServletException, IOException {
		int userid = Integer.parseInt(req.getParameter("userid"));
		Basicinfo basicinfo = basicinfoService.getBasicinfo(userid);
		req.setAttribute("basicinfo", basicinfo);
		req.getRequestDispatcher("views/before/student/student-basicinfo.jsp")
				.forward(req, resp);
	}

}
