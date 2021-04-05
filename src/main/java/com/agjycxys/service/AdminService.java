package com.agjycxys.service;

import com.agjycxys.domain.Admin;
import com.agjycxys.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	public Admin login(Admin admin){
		return adminMapper.login(admin);
	}

}
