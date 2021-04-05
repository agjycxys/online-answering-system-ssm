package com.agjycxys.service;


import com.agjycxys.domain.KC;
import com.agjycxys.mapper.KCMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KCService {

    @Autowired
    private KCMapper kcMapper;

    // 查询
    public List<KC> queryKCAll() {
        return kcMapper.queryKCAll();
    }

    // 添加
    public void addKC(KC kc) {
        kcMapper.addKC(kc);
    }

    // 编辑
    public void editKC(KC kc) {
        kcMapper.editKC(kc);
    }

    // 删除
    public void delKC(int kcid) {
        kcMapper.delKC(kcid);
    }

    // 通过kcid查询kcname
    public KC queryKCNameByKCid(int kcid) {
        return kcMapper.queryKCNameByKCid(kcid);
    }

    // 通过kcid查询starttime
    public Object queryStarttimeByKCid(int kcid) {
        return kcMapper.queryStarttimeByKCid(kcid);
    }

    //通过kcid 查询endtime
    public Object queryEndtimeByKCid(int kcid) {
        return kcMapper.queryEndtimeByKCid(kcid);

    }
}
