package com.agjycxys.controller;

import com.agjycxys.domain.TiKu;
import com.agjycxys.domain.TiMu;
import com.agjycxys.domain.Users_ZGT;
import com.agjycxys.service.TK_TMService;
import com.agjycxys.service.TiKuService;
import com.agjycxys.service.TiMuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class TiKuController {
    @Autowired
    private TK_TMService tk_TMService;

    @Autowired
    private TiKuService tiKuService;

    @Autowired
    private TiMuService tiMuService;

    @RequestMapping("/queryAllTiKu")
    public ModelAndView queryAllTiKu(ModelAndView modelAndView) {
        List<TiKu> allTiKu = tiKuService.queryTiKuAll();

        modelAndView.addObject("allTiKu", allTiKu);
        modelAndView.setViewName("/admin/tiku/list.jsp");
        return modelAndView;
    }

    @RequestMapping("/editTiKu")
    public ModelAndView editTiKu(String tkname, String tkscore, int tkid, ModelAndView modelAndView) {
        TiKu tiKu = new TiKu();
        tiKu.setTkname(tkname);
        tiKu.setTkscore(tkscore);
        tiKu.setTkid(tkid);

        tiKuService.editTiKu(tiKu);

        modelAndView.setViewName("redirect:queryAllTiKu");
        return modelAndView;
    }

    @RequestMapping("/delTiKu")
    public ModelAndView delTiKu(int tkid, ModelAndView modelAndView) {
        tiKuService.delTiKu(tkid);

        modelAndView.setViewName("redirect:queryAllTiKu");
        return modelAndView;
    }

    @RequestMapping("/addTiKu")
    public ModelAndView addTiKu(String tkname, String tkscore, ModelAndView modelAndView) {
        TiKu tiKu = new TiKu();
        tiKu.setTkname(tkname);
        tiKu.setTkscore(tkscore);

        tiKuService.addTiKu(tiKu);

        modelAndView.setViewName("redirect:queryAllTiKu");
        return modelAndView;
    }

    @RequestMapping("/queryTMForTK")
    public ModelAndView queryTMForTK(int tkid, ModelAndView modelAndView) {
        List<TiMu> allTM = tiMuService.queryTiMuAll();
        Object tmscores = tk_TMService.queryTMScoresBytkid(tkid);
        String tkscore = tiKuService.queryTKScoreByTkid(tkid);

        modelAndView.addObject("allTM", allTM);
        modelAndView.addObject("tkscore", tkscore);
        modelAndView.addObject("tmscores", tmscores);
        modelAndView.addObject("tkid", tkid);
        modelAndView.setViewName("/admin/tiku/addtm_tk.jsp");
        return modelAndView;
    }

    @RequestMapping("/lookTMForTK")
    public ModelAndView lookTMForTK(int tkid, ModelAndView modelAndView) {
        List<TiMu> allTM = tk_TMService.queryTMByTKid(tkid);
        Object tmscores = tk_TMService.queryTMScoresBytkid(tkid);
        String tkscore = tiKuService.queryTKScoreByTkid(tkid);

        modelAndView.addObject("allTM", allTM);
        modelAndView.addObject("tkscore", tkscore);
        modelAndView.addObject("tmscores", tmscores);
        modelAndView.setViewName("/admin/tiku/looktm_tk.jsp");
        return modelAndView;
    }

    @RequestMapping("/addTMForTK")
    public ModelAndView addTMForTK(int tkid, int tmid, ModelAndView modelAndView) {
        tk_TMService.addtm_tk(tkid, tmid);

        modelAndView.setViewName("redirect:queryTMForTK");
        return modelAndView;
    }

    @RequestMapping("/delTMForTK")
    public ModelAndView delTMForTK(int tmid, ModelAndView modelAndView) {
        tk_TMService.deltm_tk(tmid);

        modelAndView.setViewName("redirect:queryTMForTK");
        return modelAndView;
    }
}
