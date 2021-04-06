package com.agjycxys.controller;

import com.agjycxys.domain.Admin;
import junit.framework.TestCase;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionFactoryBean;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class AdminControllerTest {


    public static void main(String[] args) throws IOException {
        InputStream resourceAsStream = Resources.getResourceAsStream("sqlMapConfig.xml");

        SqlSessionFactory build = new SqlSessionFactoryBuilder().build(resourceAsStream);

        SqlSession sqlSession = build.openSession();

        List<Admin> admins = sqlSession.selectList("AdminMapper.login");

        System.out.println(admins.size());
    }
}