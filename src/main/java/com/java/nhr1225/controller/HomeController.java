package com.java.nhr1225.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping("/")
	public String home() {
		
		
		return "home";
	}
	
	@RequestMapping("/myform")
	public String myform(HttpServletRequest req, Model m, HttpSession hs) {
		String id = hs.getAttribute("id").toString();
		String title = req.getParameter("title");
		System.out.println("id : "+id);
		System.out.println("title : "+title);
	
		List<makeformBean> list = session.selectList("makeform.select", id);
//		List<makeformBean> list_all = session.selectList("makeform.select_all", title);
//		System.out.println(list_all.toString());
		
		req.setAttribute("list", list);
//		req.setAttribute("list_all", list_all);
		
		return "myform";
	}
	
	@RequestMapping("/makeform")
	public String makeform() {
	
		return "makeform";
	}
	
	@PostMapping(value="/insert")
	public String myform(HttpServletRequest req) {
		try {
			JSONArray subtitle = JSONArray.fromObject(req.getParameter("subtitle"));
			JSONArray option = JSONArray.fromObject(req.getParameter("option"));
			
			for(int i = 0; i < subtitle.size(); i++) {
				System.out.println("subtitle : " + subtitle.get(i));
			}
			
			
			System.out.println(option.toString());
			System.out.println(option.size());
			JSONArray option_list;
			for(int i = 0; i < option.size(); i++) {
				option_list = (JSONArray) option.get(i);
				for(int j = 0; j < option_list.size(); j++) {
					System.out.println("option " + i + " : " + option_list.get(j));
				}
			}
//			session.insert("makeform.insert", new makeformBean(req.getParameter("id"), req.getParameter("title")));
//			session.insert("makeform.insert_sub", new makeformBean("" , req.getParameter("subtitleList")));
//			session.insert("makeform.insert_option", new makeformBean(req.getParameter("optionList"), ""));

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
		

	
}
