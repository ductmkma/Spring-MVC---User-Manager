package com.zent.dao;

import java.util.List;

import com.zent.entiy.User;

public interface IUserDAO {
	public List<User> search(User user, Integer page);
}
