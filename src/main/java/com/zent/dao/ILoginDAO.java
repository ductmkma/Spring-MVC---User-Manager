package com.zent.dao;

import java.util.List;

import com.zent.entiy.UserLogin;

public interface ILoginDAO {
	public Boolean checkLogin(UserLogin user);
	public UserLogin getFullName(UserLogin user);
}
