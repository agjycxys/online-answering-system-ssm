package com.agjycxys.service;

import com.agjycxys.domain.TiMu;
import com.agjycxys.mapper.TK_TMMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TK_TMService {

	@Autowired
	private TK_TMMapper tk_tmMapper;

	// 根据tkid 查询 tm
	public List<TiMu> queryTMByTKid(int tkid) {
		return tk_tmMapper.queryTMByTKid(tkid);
	}

	// 添加tm到tk
	public void addtm_tk(int tkid, int tmid) {
		tk_tmMapper.addtm_tk(tkid, tmid);
	}

	// 删除
	public void deltm_tk(int tmid) {
		tk_tmMapper.deltm_tk(tmid);
	}

	// 通过tkid 查询 已添加题目的总分数
	public Object queryTMScoresBytkid(int tkid) {
		return tk_tmMapper.queryTMScoresBytkid(tkid);
	}
}
