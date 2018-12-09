package com.jiangge.service;

import com.jiangge.pojo.Admin;

import java.util.List;


public interface AdminService {

    void save(Admin admin);

    Admin getAdminById(String id);

    List<Admin> getAllAdmin();

    Admin getAdminByHql(String queryString, Object... params);

    void saveOrUpdtae(Admin admin);
}
