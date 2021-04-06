package com.agjycxys.mapper;

import com.agjycxys.domain.TiKu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KC_TKMapper {
    public List<TiKu> queryTkByKCid(int kcid) ;

    public void addtk_kc(int kcid, int tkid);

    public void deltk_kc(int tkid) ;

    public Object queryTKidByKCid(int kcid) ;
}
