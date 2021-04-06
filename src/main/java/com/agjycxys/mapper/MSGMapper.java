package com.agjycxys.mapper;

import com.agjycxys.domain.MSG;
import com.agjycxys.domain.Users_ZGT;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MSGMapper {
    public Object queryMSGid(String msgaccount);

    public List<Users_ZGT> queryUsers_zgtByMSGid(int msgid);

    public List<MSG> queryMSGByMSGid(int msgid);

    public void updateMSG(MSG msg);

    public MSG login(MSG msg);

    public List<MSG> lookmsg_kc(int kcid);

    public void delmsg_kc(int msgid);

    public void addmsg_kc(int kcid, int msgid);

    public void delMSG(int msg);

    public void editMSG(MSG msg);

    public void addMSG(MSG msg);

    public List<MSG> queryMSGAll();
}
