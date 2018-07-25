package com.aaa.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**  
 * @author goderyu
 * @date 2018年7月25日 下午2:39:55
 * @description 向前端输出data的封装
 */
public class AjaxWriter {
	public static void write(HttpServletResponse resp,Object obj){
		// 设置内容类型为json格式
		resp.setContentType("json;charset=utf-8");
		try {
			// 向前端data传值，obj是什么类型传过去就对应什么类型（应该是，待我测试一下）
			resp.getWriter().print(JSON.toJSONString(obj));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
