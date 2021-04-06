package com.agjycxys.mapper;

import com.agjycxys.domain.TiMu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TiMuMapper {
    public List<TiMu> queryTiMuAll();

    public void addTiMu(TiMu timu);

    public void editTiMu(TiMu timu);

    public void delTiMu(int tmid);
}
