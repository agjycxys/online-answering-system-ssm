package com.agjycxys.service;


import com.agjycxys.domain.Users_ZGT;
import com.agjycxys.mapper.Users_ZGTMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Users_ZGTService {

	@Autowired
	private Users_ZGTMapper users_zgtMapper;

	// 存储主观题
	public void AddZGT(Users_ZGT users_ZGT) {
		users_zgtMapper.addZGT(users_ZGT);
	}

	// 存储答案
	public void AddZGTScore(String openid, int zgtscore) {
		users_zgtMapper.addZGTScore(openid, zgtscore);
	}

	// 如果面试官评阅 将ispingyue改为1
	public void updateIsPY(String is, String openid) {
		users_zgtMapper.updateIsPY(is, openid);
	}
	//查询所有用户答案
		public List<Users_ZGT> queryAll(){
			return users_zgtMapper.queryAll();
		}
}
