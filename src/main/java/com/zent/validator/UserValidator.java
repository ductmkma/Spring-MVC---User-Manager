package com.zent.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.zent.entiy.UserLogin;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserLogin.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors error) {
		UserLogin userLogin = (UserLogin) target;
		if(userLogin.getUsername()==null||userLogin.getUsername().trim()=="") {
			error.rejectValue("username", "Empty");
		}
		//ValidationUtils.rejectIfEmpty(error, "username", "Empty"); Cách 2
		if(userLogin.getPassword()==null||userLogin.getPassword().trim()=="") {
			error.rejectValue("password", "Empty");
		}
		
	}
	

}
