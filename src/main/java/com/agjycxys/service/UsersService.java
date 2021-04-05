package com.agjycxys.service;

import com.agjycxys.domain.Users;
import com.agjycxys.mapper.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UsersService {

	@Autowired
	private UsersMapper usersMapper;

	// 添加用户信息
	public void addUserInfo(Users users) {
		usersMapper.addUserInfo(users);
	}

	// 存储用户客观题成绩
	public void addKGTscore(int kgtscore, String openid) {
		usersMapper.addKGTscore(kgtscore, openid);
	}

	// 查询用户名字
	public Object queryNameByOpenid(String openid) {
		return usersMapper.queryNameByOpenid(openid);
	}

	// 根据姓名查询users
	public List<Users> queryUsersByName(String usersname) {
		return usersMapper.queryUsersByName(usersname);
	}

	// 根据最大成绩查询users
	public List<Users> queryUsersByMaxScore(int score) {
		return usersMapper.queryUsersByMixScore(score);
	}

	// 根据最小成绩查询users
	public List<Users> queryUsersByMinScore(int score) {
		return usersMapper.queryUsersByMinScore(score);
	}

	// 综合查询
	public List<Users> queryUsersByScore(int minscore, int maxscore) {
		return usersMapper.queryUsersByScore(minscore, maxscore);
	}

	// 查询用户信息
	public List<Users> queryUsers() {
		return usersMapper.queryUsers();
	}
}
