package com.zent.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.mysql.jdbc.Constants;
import com.zent.entiy.User;
import com.zent.utils.Contants;

public class UserManagerDAO implements IUserManagerDAO{
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	
	

	public DataSource getDataSoure() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}



	public JdbcTemplate getJdbcTemplateObject() {
		return jdbcTemplateObject;
	}



	public void setJdbcTemplateObject(JdbcTemplate jdbcTemplateObject) {
		this.jdbcTemplateObject = jdbcTemplateObject;
	}

	@Override
	public List<User> getAll() {
		String sql = "SELECT * FROM tbl_user where deleted_at is null";
		List<User> listUser = jdbcTemplateObject.query(sql,new UserManagerMapper());
		return listUser;
	}
	@Override
	public List<User> search(User user, Integer page) {
		String sql = "SELECT * FROM tbl_user WHERE DELETED_AT is null ";
		HashMap<Integer, Object> map = new HashMap<>();

		Integer count = -1;
		if (user.getName() != null) {
			count++;
			map.put(count, "%" + user.getName() + "%");
			sql += " AND name LIKE ? ";
		}

		if (user.getGender() != 0) {
			count++;
			map.put(count, "%" + user.getGender() + "%");
			sql += " AND gender LIKE ? ";
		}

		Object[] args = new Object[count + 1];

		if (count < 0)
			args = new Object[] {};
		else {
			for (Integer key : map.keySet()) {
				args[key] = map.get(key);
			}
		}

		sql += "LIMIT " + (page-1) * Contants.PAGE_SIZE + "," + Contants.PAGE_SIZE;
		List<User> users = jdbcTemplateObject.query(sql, args, new UserManagerMapper());
		return users;
	}

	@Override
	public void insertUser(User user) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Object[] obj = new Object[5];
		obj[0] = user.getName();
		obj[1] = user.getBirthday();
		obj[2] = user.getAddress();
		obj[3] = user.getGender();
		obj[4] = sdf.format(date);
		String sql  = "INSERT INTO tbl_user(name,birthday,address,gender,created_at) values (?,?,?,?,?)";
		jdbcTemplateObject.update(sql,obj);
	}

	@Override
	public void updateUser(User user) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Object[] obj = new Object[6];
		obj[0] = user.getName();
		obj[1] = user.getBirthday();
		obj[2] = user.getAddress();
		obj[3] = user.getGender();
		obj[4] = sdf.format(date);
		obj[5] = user.getId();
		String sql = "UPDATE tbl_user SET NAME = ?,BIRTHDAY=?,ADDRESS=?,GENDER=?,UPDATED_AT=? WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
		
	}

	@Override
	public void deleteUser(Integer id) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Object[] obj = new Object[2];
		obj[0] = sdf.format(date);
		obj[1] = id;
		String sql = "UPDATE tbl_user SET DELETED_AT = ? WHERE ID = ?";
		jdbcTemplateObject.update(sql,obj);
	}
}
