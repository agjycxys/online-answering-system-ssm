package com.agjycxys.controller;

import com.agjycxys.domain.Admin;
import com.agjycxys.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public ModelAndView login(String adname,String adpwd,ModelAndView modelAndView){
        Admin admin = new Admin();
        admin.setAdname(adname);
        admin.setAdpwd(adpwd);
        Admin existAdmin = adminService.login(admin);

        //根据处理结果显示信息(页面跳转)
        if(existAdmin == null){
            modelAndView.addObject("error", "用户名或密码不正确 !");
            modelAndView.setViewName("admin/login.jsp");
        }else{
            modelAndView.addObject("adname", admin.getAdname());
            modelAndView.setViewName("admin/main.jsp");
        }
        return modelAndView;
    }
}
