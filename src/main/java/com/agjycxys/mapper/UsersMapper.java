package com.agjycxys.mapper;

import com.agjycxys.domain.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersMapper {
    public void addUserInfo(Users users);

    public void addKGTscore(int kgtscore, String openid);

    public Object queryNameByOpenid(String openid);

    public List<Users> queryUsersByName(String usersname);

    public List<Users> queryUsersByMixScore(int score);

    public List<Users> queryUsersByMinScore(int score);

    public List<Users> queryUsersByScore(int minscore, int maxscore);

    public List<Users> queryUsers();
}
