package com.agjycxys.mapper;

import com.agjycxys.domain.TiMu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TK_TMMapper {
    public List<TiMu> queryTMByTKid(int tkid);

    public void addtm_tk(int tkid, int tmid);

    public void deltm_tk(int tmid);

    public Object queryTMScoresBytkid(int tkid);
}
