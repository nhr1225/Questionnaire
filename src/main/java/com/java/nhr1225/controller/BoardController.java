package com.java.nhr1225.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.nhr1225.bean.BoardBean;

@Controller
public class BoardController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping("/write")
	public String select(HttpServletRequest req, Model m) {
		if(req.getParameter("abc") != null) {
			String no = req.getParameter("abc");
			List<BoardBean> list = session.selectList("board.tt", no);
			m.addAttribute("list", list);
			return "qna_write2";
		}
		List<BoardBean> list = session.selectList("board.select");
		req.setAttribute("list", list);
		return "write";
	}
	@RequestMapping("/qna_write")
	public String write(HttpServletRequest req) {
		return "qna_write";
	}
	
	@RequestMapping("/insert_board")
	public String insert(HttpServletRequest req) {
		session.insert("board.insert", new BoardBean("",  req.getParameter("title"), req.getParameter("txt"), req.getParameter("id"), req.getParameter("nickname")));
		return "redirect:/write";
	}
	
	@RequestMapping("/update_board")
	public String update(HttpServletRequest req) {
//		System.out.println("No :" +req.getParameter("no"));
//		System.out.println("title :" +req.getParameter("title"));
//		System.out.println("txt :" +req.getParameter("txt"));
//		System.out.println("nickname :" +req.getParameter("nickname"));
		session.update("board.update", new BoardBean(req.getParameter("no"), req.getParameter("title"), req.getParameter("txt"), req.getParameter("id"), req.getParameter("nickname")));
		return "redirect:/write";
	}
	
	@RequestMapping("/delete_board")
	public String delete(HttpServletRequest req) {
		session.update("board.delete", new BoardBean(req.getParameter("no"), req.getParameter("title"), req.getParameter("txt"), req.getParameter("id"), req.getParameter("nickname")));
		return "redirect:/write";
	}
}
