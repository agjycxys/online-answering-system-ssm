package com.agjycxys.controller;

import com.agjycxys.domain.TiMu;
import com.agjycxys.service.TiMuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class TiMuController {

    @Autowired
    private TiMuService tiMuService;

    @RequestMapping("/queryAllTiMu")
    public ModelAndView queryAllTiMu(ModelAndView modelAndView) {
        List<TiMu> allTiMu = tiMuService.queryTiMuAll();

        modelAndView.addObject("allTiMu", allTiMu);
        modelAndView.setViewName("redirect:queryAllTiMu");
        return modelAndView;
    }

    @RequestMapping("/editTiMu")
    public ModelAndView editTiMu(TiMu timu, ModelAndView modelAndView) {
        tiMuService.editTiMu(timu);

        modelAndView.setViewName("redirect:queryAllTiMu");
        return modelAndView;
    }

    @RequestMapping("/delTiMu")
    public ModelAndView delTiMu(int tmid, ModelAndView modelAndView) {
        tiMuService.delTiMu(tmid);

        modelAndView.setViewName("redirect:queryAllTiMu");
        return modelAndView;
    }

    @RequestMapping("/addTiMu")
    public ModelAndView addTiMu(TiMu timu, String answer2, String answer1, ModelAndView modelAndView) {
        if (timu.getTmtype().equals("判断题")) {
            timu.setAnswer(answer2);
        } else {
            timu.setAnswer(answer1);
        }

        tiMuService.addTiMu(timu);

        modelAndView.setViewName("redirect:queryAllTiMu");
        return modelAndView;
    }
}
