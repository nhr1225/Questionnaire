package com.java.nhr1225.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.nhr1225.bean.makeformBean;



@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping("/")
	public String home() {
		
		
		return "home";
	}
	
	@RequestMapping("/myform")
	public String myform(HttpServletRequest req, Model m) {
		String id = "1162715415";
		List<makeformBean> list = session.selectList("makeform.select", id);
		System.out.println(list.toString());
		
		
		req.setAttribute("list", list);
		
		return "myform";
	}
	@RequestMapping("/makeform")
	public String makeform() {
	
		return "makeform";
	}
	
	@PostMapping("/insert")
	public String myform(HttpServletRequest req) {
		try {
			req.setCharacterEncoding("UTF-8");
			System.out.println(req.getParameter("subtitle")); 
			System.out.println(req.getParameter("data"));
//			session.insert("makeform.insert", new makeformBean(req.getParameter("id"), req.getParameter("title"),req.getParameter("subtitle"), req.getParameter("option")));

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
		

	
}
