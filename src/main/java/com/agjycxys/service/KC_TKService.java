package com.agjycxys.service;

import com.agjycxys.domain.TiKu;
import com.agjycxys.mapper.KC_TKMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class KC_TKService {

    @Autowired
    private KC_TKMapper kc_tkMapper;

    //根据kcid 查询 tk
    public List<TiKu> queryTkByKCid(int kcid) {
        return kc_tkMapper.queryTkByKCid(kcid);
    }

    ////添加tk到kc
    public void addtk_kc(int kcid, int tkid) {
        kc_tkMapper.addtk_kc(kcid, tkid);
    }

    //删除
    public void deltk_kc(int tkid) {
        kc_tkMapper.deltk_kc(tkid);
    }

    //根据kcid 随机 取出一个tkid
    public Object queryTKidByKCid(int kcid) {
        return kc_tkMapper.queryTKidByKCid(kcid);
    }

}