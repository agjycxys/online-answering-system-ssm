package com.agjycxys.mapper;

import com.agjycxys.domain.KC;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KCMapper {
    public List<KC> queryKCAll();

    public void addKC(KC kc);

    public void editKC(KC kc);

    public KC queryKCNameByKCid(int kcid);

    public Object queryStarttimeByKCid(int kcid);

    public Object queryEndtimeByKCid(int kcid);

    public void delKC(int kcid);
}
