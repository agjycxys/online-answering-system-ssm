package com.agjycxys.controller;

import com.agjycxys.domain.KC;
import com.agjycxys.domain.MSG;
import com.agjycxys.domain.TiKu;
import com.agjycxys.service.KCService;
import com.agjycxys.service.KC_TKService;
import com.agjycxys.service.MSGService;
import com.agjycxys.service.TiKuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class KCController {

    @Autowired
    private MSGService msgService;

    @Autowired
    private KC_TKService kc_TKService;

    @Autowired
    private KCService kcService;

    @Autowired
    private TiKuService tiKuService;

    @RequestMapping("/queryTKForKC")
    public ModelAndView queryTKForKC(int kcid, ModelAndView modelAndView) {
        List<TiKu> allTK = tiKuService.queryTiKuAll();

        modelAndView.addObject("allTK", allTK);
        modelAndView.addObject("kcid", kcid);
        modelAndView.setViewName("/admin/kc/addtk_kc.jsp");
        return modelAndView;
    }

    @RequestMapping("/queryMSGForKC")
    public ModelAndView queryMSGForKC(int kcid, ModelAndView modelAndView) {
        List<MSG> allMSG = msgService.queryMSGAll();

        modelAndView.addObject("allMSG", allMSG);
        modelAndView.addObject("kcid", kcid);
        modelAndView.setViewName("/admin/kc/addmsg_kc.jsp");
        return modelAndView;
    }

    @RequestMapping("/lookTKForKC")
    public ModelAndView lookTKForKC(int kcid, ModelAndView modelAndView) {
        List<TiKu> alltk = kc_TKService.queryTkByKCid(kcid);

        modelAndView.addObject("alltk", alltk);
        modelAndView.setViewName("/admin/kc/looktk_kc.jsp");
        return modelAndView;
    }

    @RequestMapping("/lookMSGForKC")
    public ModelAndView lookMSGForKC(int kcid, ModelAndView modelAndView) {
        List<MSG> msgs = msgService.lookmsg_kc(kcid);

        modelAndView.addObject("lookmsg_kc", msgs);
        modelAndView.addObject("kcid", kcid);
        modelAndView.setViewName("/admin/kc/lookmsg_kc.jsp");
        return modelAndView;
    }

    @RequestMapping("/queryAllKC")
    public ModelAndView queryAllKC(ModelAndView modelAndView) {
        List<KC> allKC = kcService.queryKCAll();
        modelAndView.addObject("allKC", allKC);
        modelAndView.setViewName("/admin/kc/kc_list.jsp");
        return modelAndView;
    }

    @RequestMapping("/editKC")
    public ModelAndView editKC(int kcid, String kcname, String starttime, String endtime, ModelAndView modelAndView) {
        KC kc = new KC();
        kc.setKcname(kcname);
        kc.setStarttime(starttime);
        kc.setEndtime(endtime);
        kc.setKcid(kcid);

        kcService.editKC(kc);
        modelAndView.setViewName("redirect:queryAllKC");
        return modelAndView;
    }

    @RequestMapping("/delKC")
    public ModelAndView delKC(int kcid, ModelAndView modelAndView) {
        kcService.delKC(kcid);
        modelAndView.setViewName("redirect:queryAllKC");
        return modelAndView;
    }

    @RequestMapping("/addKC")
    public ModelAndView addKC(String kcname, String starttime, String endtime, ModelAndView modelAndView) {
        KC kc = new KC();
        kc.setKcname(kcname);
        kc.setStarttime(starttime);
        kc.setEndtime(endtime);

        kcService.addKC(kc);
        modelAndView.setViewName("redirect:queryAllKC");
        return modelAndView;
    }

    @RequestMapping("/delTKForKC")
    public ModelAndView delTKForKC(int tkid, ModelAndView modelAndView) {
        kc_TKService.deltk_kc(tkid);
        modelAndView.setViewName("redirect:queryTKForKC");
        return modelAndView;
    }

    @RequestMapping("/delMSGForKC")
    public ModelAndView delMSGForKC(int msgid, ModelAndView modelAndView) {
        msgService.delmsg_kc(msgid);
        modelAndView.setViewName("redirect:queryMSGForKC");
        return modelAndView;
    }

    @RequestMapping("/addMSGForKC")
    public ModelAndView addMSGForKC(int msgid, int kcid, ModelAndView modelAndView) {
        msgService.addmsg_kc(kcid, msgid);
        modelAndView.setViewName("redirect:queryMSGForKC");
        return modelAndView;
    }

    @RequestMapping("/addTKForKC")
    public ModelAndView addTKForKC(int tkid, int kcid, ModelAndView modelAndView) {
        kc_TKService.addtk_kc(kcid, tkid);
        modelAndView.setViewName("redirect:queryTKForKC");
        return modelAndView;
    }
}
