package com.agjycxys.mapper;

import com.agjycxys.domain.TiKu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TiKuMapper {
    public List<TiKu> queryTiKuAll();

    public void addTiKu(TiKu tiku);

    public void editTiKu(TiKu tiku);

    public void delTiKu(int tkid);

    public String queryTKNameByTKid(int tkid);

    public String queryTKScoreByTkid(int tkid);
}
