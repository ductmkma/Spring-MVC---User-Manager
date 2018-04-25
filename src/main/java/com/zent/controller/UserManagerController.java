package com.zent.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zent.dao.IUserManagerDAO;
import com.zent.entiy.PersonJsonObject;
import com.zent.entiy.User;
import com.zent.utils.Contants;
import com.zent.utils.JsonResponse;

@Controller
public class UserManagerController {
	private IUserManagerDAO userDAO;

	public IUserManagerDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserManagerDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		return "usermanager";

	}

	@RequestMapping(value = "/listuser", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String springPaginationDataTables(HttpServletRequest request) throws IOException {

		// Fetch the page number from client
		Integer pageNumber = 0;
		if (null != request.getParameter("iDisplayStart"))
			pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart")) / 10) + 1;

		// Fetch search parameter
		String searchParameter = request.getParameter("sSearch");

		// Fetch Page display length
		Integer pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
		Contants.PAGE_SIZE = pageDisplayLength;
		Integer iDisplayStart = Integer.valueOf(request.getParameter("iDisplayStart"));
		Integer page = (iDisplayStart / pageDisplayLength) + 1;
		// Create page list data
		List<User> listUser = new ArrayList<>();
		User user = new User();
		user.setName(searchParameter);
		listUser = userDAO.search(user, page);

		// Here is server side pagination logic. Based on the page number you could make
		// call
		// to the data base create new list and send back to the client. For demo I am
		// shuffling
		// the same list to show data randoml

		PersonJsonObject personJsonObject = new PersonJsonObject();
		// Set Total display record
		if (searchParameter.equals("")) {
			personJsonObject.setiTotalDisplayRecords(userDAO.getAll().size());
			// Set Total record
			personJsonObject.setiTotalRecords(userDAO.getAll().size());
		} else {
			personJsonObject.setiTotalDisplayRecords(listUser.size());
			// Set Total record
			personJsonObject.setiTotalRecords(listUser.size());
		}
		personJsonObject.setAaData(listUser);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(personJsonObject);
		// System.out.println(json2);
		return json2;
	}

	/*
	 * @RequestMapping(value="/add", method = RequestMethod.POST) public String
	 * add(@ModelAttribute("addUser") User user, Model model ,HttpSession session){
	 * userDAO.insertUser(user); return "redirect:list";
	 * 
	 * }
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody JsonResponse add(@ModelAttribute(value = "user") User user, BindingResult result,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String action = request.getParameter("action");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		ObjectMapper mapper = new ObjectMapper();
		JsonResponse res = new JsonResponse();
		if (action.equals("edit")) {
			try {
				ValidationUtils.rejectIfEmpty(result, "name", "Tên không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "address", "Địa chỉ không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "birthday", "Ngày sinh không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "gender", "Giới tính không được để trống.");
				if (!result.hasErrors()) {
					userDAO.updateUser(user);
					res.setStatus("SUCCESS");
					res.setResult(new Boolean(true));
				} else {
					res.setStatus("FAIL");
					res.setResult(result.getAllErrors());
				}
				return res;
			} catch (Exception e1) {
				e1.printStackTrace();
			}

		} else if (action.equals("add")) {

			try {
				ValidationUtils.rejectIfEmpty(result, "name", "Tên không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "address", "Địa chỉ không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "birthday", "Ngày sinh không được để trống.");
				ValidationUtils.rejectIfEmpty(result, "gender", "Giới tính không được để trống.");
				if (!result.hasErrors()) {
					userDAO.insertUser(user);
					res.setStatus("SUCCESS");
					res.setResult(new Boolean(true));
				} else {
					res.setStatus("FAIL");
					res.setResult(result.getAllErrors());
				}
				return res;

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		} else if (action.equals("delete")) {

			try {
				int id = Integer.parseInt(request.getParameter("id"));
				userDAO.deleteUser(id);
				if (!result.hasErrors()) {
					res.setStatus("SUCCESS");
					res.setResult(new Boolean(true));
				} else {
					res.setStatus("FAIL");
					res.setResult(result.getAllErrors());
				}
				return res;
			} catch (Exception e1) { // TODO Auto-generated catch block
				e1.printStackTrace();
			}

		}
		return null;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("addUser") User user, Model model, HttpSession session) {
		userDAO.updateUser(user);
		return "redirect:list";

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") Integer id, Model model, HttpSession session) {
		userDAO.deleteUser(id);
		return "redirect:list";

	}
}
