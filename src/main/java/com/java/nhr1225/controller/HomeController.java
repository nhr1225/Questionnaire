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
//		List<makeformBean> list_all = null;
		String id = hs.getAttribute("id").toString();
		
		System.out.println("id : "+id);
//		System.out.println("title : "+title);
	
		List<makeformBean> list = session.selectList("makeform.select", id);
//		for(int i=0; i<list.size(); i++) {
//			int titleNO = list.get(i).getTitleNO();
//			list_all = session.selectList("makeform.select_all", titleNO);
//		}
//		System.out.println("list_all : "+list_all);
		
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
		makeformBean mfm =  new makeformBean();
		try {
			JSONArray subtitle = JSONArray.fromObject(req.getParameter("subtitle"));
			JSONArray option = JSONArray.fromObject(req.getParameter("option"));
			String title = req.getParameter("title");
			System.out.println("title : "+title);
			session.insert("makeform.insert", new makeformBean(req.getParameter("id"), req.getParameter("title")));
			int titleNO = session.selectOne("makeform.select_titleNO");
			System.out.println("titleNO : "+titleNO);
			for(int i = 0; i < subtitle.size(); i++) {
				System.out.println("subtitle : " + subtitle.get(i));
				System.out.println("subtitle.get(i).toString() " + subtitle.get(i).toString());
				mfm.makeformBean_sub(titleNO , subtitle.get(i).toString());
				session.insert("makeform.insert_sub", mfm);
			}
			System.out.println(option.toString());
			System.out.println(option.size());
			JSONArray option_list;
			for(int i = 0; i < option.size(); i++) {
				option_list = (JSONArray) option.get(i);
				List<Integer> subtitleNO = session.selectList("makeform.select_subtitleNO");
				for(int j = 0; j < option_list.size(); j++) {
					System.out.println("option " + i + " : " + option_list.get(j));
					mfm.makeformBean_option(option_list.get(j).toString(), subtitleNO.get(i));
					session.insert("makeform.insert_option", mfm);
				}
			}	

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
		

	
}
