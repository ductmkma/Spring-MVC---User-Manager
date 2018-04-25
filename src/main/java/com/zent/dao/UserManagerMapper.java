package com.zent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.zent.entiy.User;

public class UserManagerMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int args) throws SQLException {
		User user = new  User();
		user.setId(rs.getInt(1));
		user.setName(rs.getString(2));
		user.setBirthday(rs.getString(3));
		user.setAddress(rs.getString(4));
		user.setGender(rs.getInt(5));
		user.setCreated_at(rs.getDate(6));
		user.setUpdated_at(rs.getDate(7));
		user.setDeleted_at(rs.getDate(8));
		return user;
	}

}
