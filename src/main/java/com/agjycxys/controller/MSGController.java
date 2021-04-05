package com.agjycxys.controller;

import com.agjycxys.domain.MSG;
import com.agjycxys.domain.TiKu;
import com.agjycxys.domain.Users;
import com.agjycxys.domain.Users_ZGT;
import com.agjycxys.service.MSGService;
import com.agjycxys.service.UsersService;
import com.agjycxys.service.Users_ZGTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MSGController {
    @Autowired
    private MSGService msgService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private Users_ZGTService users_ZGTService;

    @RequestMapping("/yuJuan")
    public ModelAndView yuJuan(int msgid, ModelAndView modelAndView) {
        List<Users_ZGT> usersZGT = msgService.queryUsers_zgtByMSGid(msgid);

        modelAndView.addObject("usersZGT", usersZGT);
        modelAndView.setViewName("/MSG/user_zgt.jsp");
        return modelAndView;
    }

    @RequestMapping("/pingYue")
    public ModelAndView pingYue(String openid, int zgtscore, ModelAndView modelAndView) {
        users_ZGTService.AddZGTScore(openid, zgtscore);

        //评阅完成后将改变状态
        users_ZGTService.updateIsPY("0", openid);

        modelAndView.setViewName("redirect:yuJuan");
        return modelAndView;
    }


    @RequestMapping("/msgQueryAll")
    public ModelAndView msgQueryAll(int msgid, ModelAndView modelAndView) {
        List<MSG> allMSG = msgService.queryMSGAll();

        modelAndView.addObject("allMSG", allMSG);
        modelAndView.setViewName("/admin/msg/msg_list.jsp");
        return modelAndView;
    }

    @RequestMapping("/msgLogin")
    public ModelAndView msgLogin(String msgaccount, String msgpwd, ModelAndView modelAndView) {
        MSG msg = new MSG();
        msg.setMsgaccount(msgaccount);
        msg.setMsgpwd(msgpwd);

        MSG existmsg = msgService.login(msg);
        int msgid = (int) msgService.queryMSGid(msgaccount);

        // 根据处理结果显示信息(页面跳转)
        if (existmsg == null) {
            modelAndView.addObject("error", "用户名或密码不正确 !");
            modelAndView.setViewName("MSG/msgLogin.jsp");
        } else {
            modelAndView.addObject("msgid", msgid);
            modelAndView.setViewName("MSG/MSGMain.jsp");
        }

        return modelAndView;
    }

    @RequestMapping("/msgInfo")
    public ModelAndView msgInfo(int msgid, ModelAndView modelAndView) {
        List<MSG> msgInfo = msgService.queryMSGByMSGid(msgid);

        modelAndView.addObject("msgInfo", msgInfo);
        modelAndView.setViewName("/MSG/msg_info.jsp");
        return modelAndView;
    }

    @RequestMapping("/delMSG")
    public ModelAndView delMSG(int msgid, ModelAndView modelAndView) {
        msgService.delMSG(msgid);

        modelAndView.setViewName("redirect:msgQueryAll");
        return modelAndView;
    }


    @RequestMapping("/editMSG")
    public ModelAndView editMSG(String msgname, String msgphone, String msgaccount, String msgpwd, int msgid, ModelAndView modelAndView) {
        MSG msg = new MSG();
        msg.setMsgname(msgname);
        msg.setMsgphone(msgphone);
        msg.setMsgaccount(msgaccount);
        msg.setMsgpwd(msgpwd);
        msg.setMsgid(msgid);

        msgService.editMSG(msg);

        modelAndView.setViewName("redirect:msgInfo");
        return modelAndView;
    }

    @RequestMapping("/addMSG")
    public ModelAndView addMSG(String msgname, String msgphone, String msgaccount, String msgpwd, ModelAndView modelAndView) {
        MSG msg = new MSG();
        msg.setMsgname(msgname);
        msg.setMsgphone(msgphone);
        msg.setMsgaccount(msgaccount);
        msg.setMsgpwd(msgpwd);

        msgService.addMSG(msg);
        modelAndView.setViewName("redirect:msgQueryAll");
        return modelAndView;
    }

    @RequestMapping("/MSG_NameQueryServlet")
    public ModelAndView msg_NameQueryServlet(String usersname, ModelAndView modelAndView) {
        List<Users> usersInfo = usersService.queryUsersByName(usersname);

        modelAndView.addObject("usersInfo", usersInfo);
        modelAndView.setViewName("MSG/userInfo.jsp");
        return modelAndView;
    }
}
