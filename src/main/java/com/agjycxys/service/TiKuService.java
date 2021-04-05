package com.agjycxys.service;


import com.agjycxys.domain.TiKu;
import com.agjycxys.mapper.TiKuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class TiKuService {


    @Autowired
    private TiKuMapper tiKuMapper;

    /**
     * 查询题库数据
     *
     * @return
     */
    public List<TiKu> queryTiKuAll() {
        return tiKuMapper.queryTiKuAll();
    }

    /**
     * 添加题库数据
     */
    public void addTiKu(TiKu tiku) {
        tiKuMapper.addTiKu(tiku);
    }

    /**
     * 编辑
     */
    public void editTiKu(TiKu tiku) {
        tiKuMapper.editTiKu(tiku);
    }

    /**
     * 删除
     */
    public void delTiKu(int tkid) {
        tiKuMapper.delTiKu(tkid);
    }

    // 通过tkid查询tkname
    public String queryTKNameByTKid(int tkid) {
        return tiKuMapper.queryTKNameByTKid(tkid);
    }

    // 根据tkid查询tkscore
    public String queryTKScoreByTkid(int tkid) {
        return tiKuMapper.queryTKScoreByTkid(tkid);

    }
}
