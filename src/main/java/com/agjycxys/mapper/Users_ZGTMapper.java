package com.agjycxys.mapper;

import com.agjycxys.domain.Users_ZGT;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Users_ZGTMapper {
    public void addZGT(Users_ZGT users_zgt);

    public void addZGTScore(String openid, int zgtscore);

    public void updateIsPY(String ispingyue, String openid);

    public List<Users_ZGT> queryAll();
}
