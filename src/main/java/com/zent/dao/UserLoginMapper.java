package com.zent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entiy.UserLogin;

public class UserLoginMapper implements RowMapper<UserLogin> {

	@Override
	public UserLogin mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserLogin user = new UserLogin();
		user.setUsername(rs.getString(1));
		user.setPassword(rs.getString(2));
		user.setFullname(rs.getString(3));
		return user;
	}

}
