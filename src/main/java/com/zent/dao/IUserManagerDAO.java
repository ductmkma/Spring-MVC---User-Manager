package com.zent.dao;

import java.util.List;

import com.zent.entiy.User;

public interface IUserManagerDAO {
	public List<User> getAll();
	public List<User> search(User user, Integer page);
	public void insertUser(User user);
	public void updateUser(User user);
	public void deleteUser(Integer id);
	
}
