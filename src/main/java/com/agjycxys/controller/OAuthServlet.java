package com.agjycxys.controller;

import domain.SNSUserInfo;
import domain.WeixinOauth2Token;
import util.AdvancedUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 授权后的回调请求处理

 */
public class OAuthServlet extends HttpServlet {
	private static final long serialVersionUID = -1847238807216447030L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 用户同意授权后，能获取到code
		String code = request.getParameter("code");
		int kcid = Integer.valueOf(request.getParameter("kcid"));
		request.setAttribute("kcid", kcid);
		// 用户同意授权
		if (!"authdeny".equals(code)) {
			String APPID  = "wxcdc94f5bd03aa8e6";
			String SECRET = "4e99950e213fad871aac765c5a1eedaa";
			// 获取网页授权access_token
			WeixinOauth2Token oauth2AccessToken = AdvancedUtil.getOauth2AccessToken(APPID, SECRET, code);
			// 网页授权接口访问凭证#
			String accessToken = oauth2AccessToken.getAccessToken();
			// 用户标识
			String openId = oauth2AccessToken.getOpenId();
			// 获取用户信息
			SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);
			// 设置要传递的参数
			request.setAttribute("snsUserInfo", snsUserInfo);
		}
		// 跳转到index.jsp
		request.getRequestDispatcher("/users/userInfo.jsp").forward(request, response);
	}
}
