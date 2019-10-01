package com.java.nhr1225.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping("/")
	public String home() {
		
		return "home";
	}
	
	@RequestMapping("/myform")
	public String myform() {
		
		return "myform";
	}
	
	@RequestMapping("/makeform")
	public String makeform(HttpServletRequest req) {
			System.out.println(req.getParameter("id"));
//			session.insert("board.insert", new ListBean("",  req.getParameter("title"), req.getParameter("txt"), req.getParameter("id"), req.getParameter("nickname")));
			
		return "makeform";
	}
		

	
}
