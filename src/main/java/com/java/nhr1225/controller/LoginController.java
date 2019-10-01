package com.java.nhr1225.controller;

import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.nhr1225.bean.LoginBean;
import com.java.nhr1225.util.HttpUtil;

import net.sf.json.JSONObject;

@Controller
public class LoginController {
	@Autowired
	SqlSession session;
	//카카오 로그인(Auth)
	@RequestMapping("/loginkakao")
	public void login(HttpServletRequest req, HttpServletResponse res) {
		try {
			String url2 = "https://accounts.kakao.com/login?continue=";
			String url = "https://kauth.kakao.com/oauth/authorize";
			url += "?client_id=24a9cf2f6258f5b091fcf38880647a8e&redirect_uri=";
//			url +=URLEncoder.encode("http://localhost:8080/KakaoBack","UTF-8");
			url += URLEncoder.encode("http://gdj16.gudi.kr:20010/KakaoBack", "UTF-8");
			url += "&response_type=code";
			url2+=URLEncoder.encode(url, "UTF-8");
			res.sendRedirect(url2);
		} catch (UnsupportedEncodingException e)  {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	String code;
	@RequestMapping("/KakaoBack")
	public String KakaoBack(HttpServletRequest req, HttpServletResponse res,  HttpSession hs) {
		System.out.println("KakaoBack");
		code = req.getParameter("code");
		System.out.println(code);
		try {
			
			String url="https://kauth.kakao.com/oauth/token";
			url +="?client_id=24a9cf2f6258f5b091fcf38880647a8e&redirect_uri="; 
//			url +=URLEncoder.encode("http://localhost:8080/KakaoBack","UTF-8");
			url += URLEncoder.encode("http://gdj16.gudi.kr:20010/KakaoBack", "UTF-8");
			url +="&code="+code; 
			url +="&grant_type=authorization_code";
			System.out.println(url);
			
			HashMap<String, Object> resultMap = HttpUtil.getUrl(url);
			
			String userUrl = "https://kapi.kakao.com/v2/user/me";
			userUrl += "?access_token=" + resultMap.get("access_token");
			
			System.out.println(userUrl);
			resultMap=HttpUtil.getUrl(userUrl);
			System.out.println(resultMap);
			JSONObject jObject = JSONObject.fromObject(resultMap);
			
			HashMap<String, Object> userResult = new HashMap<String, Object>();
			String temp=(String) jObject.get("properties");
			JSONObject tmp=JSONObject.fromObject(temp);
			
			userResult.put("id", (String)jObject.get("id"));
			userResult.put("nickname", tmp.get("nickname"));
			userResult.put("profile_image", tmp.get("profile_image"));
			userResult.put("thumbnail_image", tmp.get("thumbnail_image"));
			
			System.out.println("Data : " + userResult.toString());
			
			System.out.println(userResult.get("profile_image"));
			String id=(String) userResult.get("id");
			String nickname=(String) userResult.get("nickname");
			String profile_image = (String)userResult.get("profile_image");
			String thumbnail_image = (String) userResult.get("thumbnail_image");
			
			/*
			 * 0 // 1
			 * */
			System.out.println(userResult.get("id"));
			System.out.println( session.selectOne("login.select", userResult.get("id")).toString() ); // --> 신규가입 일땐 0 
		
			if(Integer.parseInt(session.selectOne("login.select", userResult.get("id"))) == 0){
				System.out.println("새로운 접속자 로그인");
				int count = session.insert("login.insert",userResult);
				System.out.println("count : " + count);
			} else {
				System.out.println("기존 접속자 로그인");
			}
			//---------------------------------------------------------------
			/*
			LoginBean result = session.selectOne("login.selectLogin",userResult.get("id"));
			
			if(userResult.get("id").equals(result.getId()))
				System.out.println("입력x");
			else {
				session.insert("login.insert",userResult);
				System.out.println("데이터 성공 ");
			}
			*/
			LoginBean resultList = session.selectOne("login.selectLogin",userResult.get("id"));
			req.setAttribute("login", jObject);
			req.setAttribute("result", resultList);
			
			hs.setAttribute("profile_image", profile_image);
			hs.setAttribute("thumbnail_image", thumbnail_image);
			hs.setAttribute("id", id);
			hs.setAttribute("nickname", nickname);
			

		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession hs, HttpServletRequest req, HttpServletResponse res) {
		try {
			System.out.println("nickname: "+hs.getAttribute("nickname"));
			System.out.println("nickname: "+hs.getAttribute("access_token"));
			String access_token =(String) hs.getAttribute("access_token");
			String url = "https://kapi.kakao.com/v1/user/logout";
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			URL u = new URL(url);
			HttpURLConnection conn = (HttpURLConnection) u.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+access_token);
			int resCode = conn.getResponseCode();
			System.out.println(resCode);
			if(resCode == 200) {
				InputStream input = conn.getInputStream();
				InputStreamReader inputReader = new InputStreamReader(input, "utf-8");
				BufferedReader br = new BufferedReader(inputReader);
				String line = "";
				String result = "";
				while((line = br.readLine()) != null) {
					result += line;
				}
				JSONObject jObject = JSONObject.fromObject(result);
				Iterator<?> iterator = jObject.keys();
				while(iterator.hasNext()) {
					String key = iterator.next().toString();
					String value = jObject.getString(key);
					resultMap.put(key, value);
				}				
				input.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		hs.invalidate();
		return "redirect:/";
	}
}
