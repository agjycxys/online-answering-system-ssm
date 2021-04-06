package com.agjycxys.mapper;

import com.agjycxys.domain.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {

    Admin login(Admin admin);
}
