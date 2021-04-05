package com.agjycxys.service;

import com.agjycxys.domain.AllResult;
import com.agjycxys.mapper.AllResultMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AllResultService {

	 @Autowired
	 private AllResultMapper allResultMapper;
	 
	 //储存所有用户答案对错
	 public void addResult(AllResult allResult){
		 allResultMapper.addResult(allResult);
	 }

	 //查询所有用户答案对错
	 public List<AllResult> queryResults(int kcid, int tkid){
		 return allResultMapper.queryResults(kcid, tkid);
	 }
	
}
