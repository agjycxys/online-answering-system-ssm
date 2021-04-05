package com.agjycxys.controller;

import com.agjycxys.domain.*;
import com.agjycxys.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/hr")
public class HRController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private AllResultService allResultService;

    @Autowired
    private KCService kcService;

    @Autowired
    private TK_TMService tk_TMService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private Users_ZGTService users_ZGTService;

    @RequestMapping("/login")
    public ModelAndView login(String adname, String adpwd, ModelAndView modelAndView) {
        Admin admin = new Admin();
        admin.setAdname(adname);
        admin.setAdpwd(adpwd);
        Admin existAdmin = adminService.login(admin);

        // 根据处理结果显示信息(页面跳转)
        if (existAdmin == null) {
            modelAndView.addObject("error", "用户名或密码不正确 !");
            modelAndView.setViewName("HR/hrLogin.jsp");
        } else {
            modelAndView.addObject("adname", admin.getAdname());
            modelAndView.setViewName("HR/HRMain.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("/resetKC")
    public ModelAndView kcInfo(String openid, ModelAndView modelAndView) {
        users_ZGTService.updateIsPY("0", openid);

        modelAndView.setViewName("redirect:/hr/isPYInfo");
        return modelAndView;
    }

    @RequestMapping("/kcInfo")
    public ModelAndView kcInfo(ModelAndView modelAndView) {
        List<KC> allKC = kcService.queryKCAll();

        modelAndView.addObject("allKC", allKC);
        modelAndView.setViewName("/HR/kc_info.jsp");
        return modelAndView;
    }

    @RequestMapping("/editKC")
    public ModelAndView editKC(String kcname, String starttime, String endtime, int kcid, ModelAndView modelAndView) {
        KC kc = new KC();
        kc.setKcname(kcname);
        kc.setStarttime(starttime);
        kc.setEndtime(endtime);
        kc.setKcid(kcid);

        kcService.editKC(kc);

        modelAndView.setViewName("redirect:/hr/kcInfo");
        return modelAndView;
    }


    @RequestMapping("/isPYInfo")
    public ModelAndView isPYInfo(ModelAndView modelAndView) {
        List<Users_ZGT> usersZGT = users_ZGTService.queryAll();

        modelAndView.addObject("usersZGT", usersZGT);
        modelAndView.setViewName("/HR/ispingyueReset.jsp");
        return modelAndView;
    }


    @RequestMapping("/queryByScore")
    public ModelAndView queryByScore(int minscore, int maxscore, ModelAndView modelAndView) {
        List<Users> usersInfo = null;
        if (minscore == 0) {
            usersInfo = usersService.queryUsersByMaxScore(maxscore);
        }
        if (maxscore == 0) {
            usersInfo = usersService.queryUsersByMinScore(minscore);
        }
        if (minscore != 0 && maxscore != 0) {
            usersInfo = usersService.queryUsersByScore(minscore, maxscore);
        }
        modelAndView.addObject("usersInfo", usersInfo);
        modelAndView.setViewName("HR/userInfoByScore.jsp");
        return modelAndView;
    }


    @RequestMapping("/queryByName")
    public ModelAndView queryByName(String usersname, ModelAndView modelAndView) {
        List<Users> usersInfo = usersService.queryUsersByName(usersname);
        modelAndView.addObject("usersInfo", usersInfo);
        modelAndView.setViewName("HR/userInfo.jsp");
        return modelAndView;
    }

    @RequestMapping("analysis")
    public ModelAndView analysis(int kcid, int tkid, ModelAndView modelAndView) {
        List<AllResult> allResult = allResultService.queryResults(kcid, tkid);
        double sum = allResult.size();

        //获取考场名称
        KC kc = kcService.queryKCNameByKCid(kcid);
        //获取题库名称
        TiKuService tiKuService = new TiKuService();
        String tkname = tiKuService.queryTKNameByTKid(tkid);

        //获取题库中题目
        List<TiMu> allTM = tk_TMService.queryTMByTKid(tkid);
        //存储每个题的正确率
        int[] results = new int[allResult.get(0).getResults().split(",").length];
        int[] s2 = new int[allResult.get(0).getResults().split(",").length];
        List<Object> list = new ArrayList<Object>();

        for (AllResult result : allResult) {
            String[] s1 = result.getResults().split(",");
            for (int j = 0; j < s1.length; j++) {
                s2[j] = Integer.parseInt(s1[j]);
            }
            for (int k = 0; k < s2.length; k++) {
                results[k] = results[k] + s2[k];
            }
        }
        DecimalFormat df = new DecimalFormat("0.00");
        for (double d : results) {
            double e = Double.parseDouble(df.format(d / sum));
            list.add(e * 100);
        }

        modelAndView.addObject("list", list);
        modelAndView.addObject("allTM", allTM);
        modelAndView.addObject("kcname", kc.getKcname());
        modelAndView.addObject("tkname", tkname);

        modelAndView.setViewName("admin/allResult/ecarts.jsp");
        return modelAndView;
    }


}
