package com.agjycxys.controller;

import com.agjycxys.domain.Admin;
import com.agjycxys.domain.SNSUserInfo;
import com.agjycxys.domain.WeixinOauth2Token;
import com.agjycxys.util.AdvancedUtil;
import com.agjycxys.util.DigesUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class WeiXinController {

    @RequestMapping("/weiXin")
    public void weiXinLogin(String signature, String timestamp, String nonce, String echostr, HttpServletResponse response) throws IOException {
        List<String> list = new ArrayList<String>();
        list.add("sxlg");
        list.add(timestamp);
        list.add(nonce);
        Collections.sort(list);
        StringBuffer buffer = new StringBuffer();
        for (String string : list) {
            buffer.append(string);
        }
        String sha1Str = DigesUtils.encode(buffer.toString());
        boolean flag = sha1Str.equals(signature);
        if (flag) {
            System.out.println("恭喜接入成功!");
            PrintWriter out = response.getWriter();
            out.print(echostr);
            out.flush();
        }
    }

    @RequestMapping("/oAuth")
    public ModelAndView oAuth(String code, int kcid, ModelAndView modelAndView) throws IOException {
        // 用户同意授权后，能获取到code
        modelAndView.addObject("kcid", kcid);
        // 用户同意授权
        if (!"authdeny".equals(code)) {
            String APPID = "wxcdc94f5bd03aa8e6";
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
            modelAndView.addObject("snsUserInfo", snsUserInfo);
        }
        // 跳转到index.jsp
        modelAndView.setViewName("/users/userInfo.jsp");
        return modelAndView;
    }
}
