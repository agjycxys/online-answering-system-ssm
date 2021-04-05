package com.agjycxys.service;


import com.agjycxys.domain.MSG;
import com.agjycxys.domain.Users_ZGT;
import com.agjycxys.mapper.MSGMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MSGService {

	@Autowired
	private MSGMapper msgMapper;

	// 查询
	public List<MSG> queryMSGAll() {
		return msgMapper.queryMSGAll();
	}

	// 添加
	public void addMSG(MSG msg) {
		msgMapper.addMSG(msg);
	}

	// 编辑
	public void editMSG(MSG msg) {
		msgMapper.editMSG(msg);
	}

	// 删除
	public void delMSG(int msg) {
		msgMapper.delMSG(msg);
	}

	// 添加面试官到考场
	public void addmsg_kc(int kcid, int msgid) {
		msgMapper.addmsg_kc(kcid, msgid);
	}

	// 清除
	public void delmsg_kc(int msgid) {
		// TODO Auto-generated method stub
		msgMapper.delmsg_kc(msgid);
	}

	// 查询该考场的面试官
	public List<MSG> lookmsg_kc(int kcid) {
		return msgMapper.lookmsg_kc(kcid);
	}

	// 面试官登录
	public MSG login(MSG msg) {
		return msgMapper.login(msg);
	}

	// 面试官更改个人信息
	public void updateMSG(MSG msg) {
		msgMapper.updateMSG(msg);
	}

	// 通过msgid查询msg
	public List<MSG> queryMSGByMSGid(int msgid) {
		return msgMapper.queryMSGByMSGid(msgid);
	}

	// 查询该面试官下所有考生主观题
	public List<Users_ZGT> queryUsers_zgtByMSGid(int msgid) {
		return msgMapper.queryUsers_zgtByMSGid(msgid);
	}

	// 通过msgaccount查询msgid
	public Object queryMSGid(String msgaccount) {
		return msgMapper.queryMSGid(msgaccount);
	}
}
