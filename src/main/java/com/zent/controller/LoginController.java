package com.zent.controller;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zent.dao.ILoginDAO;
import com.zent.entiy.UserLogin;
import com.zent.validator.UserValidator;

@Controller
public class LoginController {
	
	private ILoginDAO loginDAO;
	private UserValidator userValidator;
	
	public UserValidator getUserValidator() {
		return userValidator;
	}



	public void setUserValidator(UserValidator userValidator) {
		this.userValidator = userValidator;
	}



	public ILoginDAO getLoginDAO() {
		return loginDAO;
	}



	public void setLoginDAO(ILoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}


	 @InitBinder
	   protected void initBinder(WebDataBinder binder) {
	      binder.addValidators(userValidator);
	   }
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String index(Model model,HttpSession session){
		model.addAttribute("user",new UserLogin());
		return "login";
 	}
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") @Validated UserLogin user,BindingResult bindingResult, Model model ,HttpSession session){
		session.removeAttribute("error");
		if(bindingResult.hasErrors()) {
			return "login";
		}
		if(user!=null && loginDAO.checkLogin(user)){
			String fullname = loginDAO.getFullName(user).getFullname();
			session.setAttribute("fullName", fullname);
			return "redirect:list";
		} else {
			model.addAttribute("err","Thông tin đăng nhập không đúng");
			//session.setAttribute("error", "Thông tin đăng nhập không đúng");
			return "login";
		}
		
	}
	@RequestMapping(value="/login-by-ajax", method = RequestMethod.POST)
	public @ResponseBody String loginByAjax(@RequestBody String body){
		ObjectMapper mapper = new ObjectMapper();
		UserLogin user;
		try {
			user = mapper.readValue(body, UserLogin.class);
			if(user!=null && loginDAO.checkLogin(user)){
				return mapper.writeValueAsString(new Boolean(true));
			} else {
				return mapper.writeValueAsString(new Boolean(false));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
	
}
