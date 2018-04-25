package com.zent.dao;

import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.mysql.jdbc.Constants;
import com.zent.entiy.User;
import com.zent.utils.Contants;

public class UserDAO implements IUserDAO {
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
	/*@Override
	public List<User> search(User user, Integer page) {
		String sql = "SELECT * FROM User WHERE 1=1";
		HashMap<Integer, Object> map = new HashMap<>();
		Integer count = -1;
		if(user.getName()!=null) {
			count++;
			map.put(count, "%"+user.getName()+"%");
			sql+="AND name LIKE ?";
		}
		if(user.getGender()!=-1) {
			sql+=" AND gender = ?";
			map.put(count, user.getGender());
		}
		Object[] args;
		if(count==-1) {
			args = new Object[] {};
		}else {
			
			for(Integer key:map.keySet()) {
				args[key] = map.get(key);
			}
		}
		
		sql+=" LIMIT "+page*Contants.PAGE_SIZE+","+Contants.PAGE_SIZE;
		List<User> userlist = jdbcTemplateObject.query(sql,args,new UserManagerMapper());
		return userlist;
	}*/

	@Override
	public List<User> search(User user, Integer page) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
