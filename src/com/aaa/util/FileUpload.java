package com.aaa.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

/**
 * @ClassName: FileUpload
 * @Description: 上传文件的工具类
 * @author: goderyu
 * @date: 2018年7月26日 上午11:08:23
 * 
 */
public class FileUpload extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String realDir = request.getSession().getServletContext()
				.getRealPath("");
		String contextpath = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + contextpath + "/";

		try {
			String filePath = "static/img/personage";
			String realPath = realDir + "\\" + filePath;
			File dir = new File(realPath);
			if (!dir.isDirectory())
				dir.mkdir();

			if (ServletFileUpload.isMultipartContent(request)) {

				DiskFileItemFactory dff = new DiskFileItemFactory();
				dff.setRepository(dir);
				dff.setSizeThreshold(1024000);
				ServletFileUpload sfu = new ServletFileUpload(dff);
				FileItemIterator fii = null;
				fii = sfu.getItemIterator(request);
				String title = "";
				String url = "";
				String fileName = "";
				String state = "SUCCESS";
				String realFileName = "";
				while (fii.hasNext()) {
					FileItemStream fis = fii.next();

					try {
						if (!fis.isFormField() && fis.getName().length() > 0) {
							fileName = fis.getName();
							Pattern reg = Pattern
									.compile("[.]jpg|png|jpeg|gif$");
							Matcher matcher = reg.matcher(fileName);
							if (!matcher.find()) {
								state = "�ļ����Ͳ����?";
								break;
							}
							// 原来是时间格式，加上扩展名；因为这个时间格式，若干个用户同时上传图片文件，会重复
							// realFileName = new
							// Date().getTime()+fileName.substring(fileName.lastIndexOf("."),fileName.length());
							realFileName = UUID.randomUUID().toString()
									+ fileName.substring(
											fileName.lastIndexOf("."),
											fileName.length());
							url = realPath + "\\" + realFileName;

							BufferedInputStream in = new BufferedInputStream(
									fis.openStream());
							FileOutputStream a = new FileOutputStream(new File(
									url));
							BufferedOutputStream output = new BufferedOutputStream(
									a);
							Streams.copy(in, output, true);
						} else {
							String fname = fis.getFieldName();

							if (fname.indexOf("pictitle") != -1) {
								BufferedInputStream in = new BufferedInputStream(
										fis.openStream());
								byte c[] = new byte[10];
								int n = 0;
								while ((n = in.read(c)) != -1) {
									title = new String(c, 0, n);
									break;
								}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				response.setStatus(200);
				// basePath+filePath+"/"+
				String retxt = "{src:'" + realFileName + "',name:'123'}";
				response.getWriter().print(retxt);
			}
		} catch (Exception ee) {
			ee.printStackTrace();
		}

	}

}
