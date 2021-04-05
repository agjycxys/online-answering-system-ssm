package com.agjycxys.service;

import com.agjycxys.domain.TiMu;
import com.agjycxys.mapper.TiMuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class TiMuService {

	@Autowired
	private TiMuMapper tiMuMapper;

	//查询
	public List<TiMu> queryTiMuAll(){
		return tiMuMapper.queryTiMuAll();
	}
	//添加
	public void addTiMu(TiMu timu){
		tiMuMapper.addTiMu(timu);
	}
	//编辑
	public void editTiMu(TiMu timu){
		tiMuMapper.editTiMu(timu);
	}
	//删除
	public void delTiMu(int tmid){
		tiMuMapper.delTiMu(tmid);
	}
	
}
