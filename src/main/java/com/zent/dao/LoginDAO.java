package com.zent.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.zent.entiy.UserLogin;
import com.zent.utils.SecurityDemo;

public class LoginDAO implements ILoginDAO {

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
	public Boolean checkLogin(UserLogin user) {
		Object[] args = new Object[2];
		args[0] = user.getUsername();
		args[1] = new SecurityDemo().md5(user.getPassword());

		List<UserLogin> users = jdbcTemplateObject.query("SELECT * FROM userlogin WHERE username=? and password=?",
				args, new UserLoginMapper());
		if (users.size() != 0) {
			return true;
		}
		return false;
	}

	@Override
	public UserLogin getFullName(UserLogin user) {

		Object[] args = new Object[2];
		args[0] = user.getUsername();
		args[1] = new SecurityDemo().md5(user.getPassword());

		UserLogin users = jdbcTemplateObject.queryForObject("SELECT * FROM userlogin WHERE username=? and password=?",
				args, new UserLoginMapper());
		if (users != null) {
			return users;
		}
		return null;
	}
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-config.xml");
		ILoginDAO loginDAO = (ILoginDAO) applicationContext.getBean("loginDAO");
		loginDAO.checkLogin(new UserLogin("minhduc","123456"));
		
		
		
	}

}
