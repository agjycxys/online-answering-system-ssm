package com.agjycxys.controller;

import com.agjycxys.domain.AllResult;
import com.agjycxys.domain.TiMu;
import com.agjycxys.domain.Users;
import com.agjycxys.domain.Users_ZGT;
import com.agjycxys.service.*;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private KC_TKService kc_TKService;

    @Autowired
    private TK_TMService tk_TMService;

    @Autowired
    private TiKuService tiKuService;

    @Autowired
    private KCService kcService;

    @Autowired
    private Users_ZGTService users_ZGTService;

    @RequestMapping("/examEnd")
    public void examEnd(int tkid, int kcid, String openid, String[] answers, HttpServletResponse response) throws IOException {
        // 存储主观题
        Users_ZGT users_ZGT = new Users_ZGT();

        // 查询用户名字
        String usersname = (String) usersService.queryNameByOpenid(openid);
        // 根据tkid查询题库中每个题目
        List<TiMu> allTM = tk_TMService.queryTMByTKid(tkid);
        int kgtscore = 0;
        // 存储用户的所有答案对错
        List<String> allAnswers = new ArrayList<String>();

        for (int i = 0; i < allTM.size(); i++) {
            TiMu tm = allTM.get(i);
            if (tm.getTmtype().equals("简答题")) {
                String usersZGT = answers[i];
                System.out.println(usersZGT);
                String tmname = tm.getTmname();
                users_ZGT.setTmid(tm.getTmid());
                users_ZGT.setUsersname(usersname);
                users_ZGT.setOpenid(openid);
                users_ZGT.setTmname(tmname);
                users_ZGT.setZgtanswer(usersZGT);
                users_ZGT.setTmscore(tm.getTmscore());
                // 存储主观题
                users_ZGTService.AddZGT(users_ZGT);
            } else {
                String usersXZ = answers[i];
                System.out.println(usersXZ);
                if (usersXZ.equals(tm.getAnswer())) {
                    kgtscore = kgtscore + Integer.valueOf(tm.getTmscore());
                    allAnswers.add("1");
                } else {
                    kgtscore = kgtscore + 0;
                    allAnswers.add("0");
                }
                // 将用户客观题成绩存储
                usersService.addKGTscore(kgtscore, openid);
            }
        }

        // 存储用户的答案对错
        String results = jhTozfc(allAnswers);
        AllResult allResult = new AllResult();
        allResult.setOpenid(openid);
        allResult.setKcid(kcid);
        allResult.setTkid(tkid);
        allResult.setResults(results);
        AllResultService allResultService = new AllResultService();
        allResultService.addResult(allResult);

        // 转换json发送
        JSONObject json = new JSONObject();
        json.put("kgtscore", kgtscore);
        PrintWriter out = response.getWriter(); // 向客户端发送字符数据
        out.println(json.toString());
        out.close();
    }


    @RequestMapping("/queryAllTiMu")
    public ModelAndView queryAllTiMu(Users users, ModelAndView modelAndView) {
        usersService.addUserInfo(users);
        int tkid = (int) kc_TKService.queryTKidByKCid(users.getKcid());
        List<TiMu> allTM = tk_TMService.queryTMByTKid(tkid);
        String tkname = tiKuService.queryTKNameByTKid(tkid);
        Object tmscores = tk_TMService.queryTMScoresBytkid(tkid);

        String starttime = (String) kcService.queryStarttimeByKCid(users.getKcid());
        String endtime = (String) kcService.queryEndtimeByKCid(users.getKcid());
        Time jstime = jstime(starttime, endtime);

        modelAndView.addObject("tkid", tkid);
        modelAndView.addObject("allTM", allTM);
        modelAndView.addObject("starttime", starttime);
        modelAndView.addObject("jstime", jstime);
        modelAndView.addObject("openid", users.getOpenid());
        modelAndView.addObject("tkname", tkname);
        modelAndView.addObject("tmscores", tmscores);
        modelAndView.addObject("kcid", users.getKcid());

        modelAndView.setViewName("users/exam.jsp");
        return modelAndView;
    }

    public Time jstime(String starttime, String endtime) {
        DateFormat time = new SimpleDateFormat("HH:mm");
        try {
            Date startdate = time.parse(starttime);
            Date enddate = time.parse(endtime);
            Time djstime = new Time(enddate.getTime() - startdate.getTime() - 8
                    * 60 * 60 * 1000);
            return djstime;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将集合转换为字符串
     *
     * @return
     */
    public String jhTozfc(List<String> list) {
        String s = "";
        for (int i = 0; i < list.size(); i++) {
            if (s == "") {
                s = list.get(i);
            } else {
                s = s + "," + list.get(i);
            }
        }
        return s;
    }
}
