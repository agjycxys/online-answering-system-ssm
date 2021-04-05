package com.agjycxys.controller;

import util.DigesUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class WeiXinServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		connect(request,out);
	}
	private void connect(HttpServletRequest request, PrintWriter out) {
		String signature  = request.getParameter("signature");
		String timestamp  = request.getParameter("timestamp");
		String nonce  = request.getParameter("nonce");
		String echostr  = request.getParameter("echostr");
		List<String> list = new ArrayList<String>();
		list.add("sxlg");
		list.add(timestamp);
		list.add(nonce);
		Collections.sort(list);
		StringBuffer buffer = new StringBuffer();
		for(String string : list){
			buffer.append(string);
		}
		String sha1Str = DigesUtils.encode(buffer.toString());
		boolean flag = sha1Str.equals(signature);
		if(flag){
			System.out.println("恭喜接入成功!");
			out.print(echostr);
			out.flush();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}