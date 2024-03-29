package com.java.nhr1225.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;

import net.sf.json.JSONObject;

public class HttpUtil {
	public static HashMap<String, Object> getUrl(String apiUrl) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			URL url= new URL(apiUrl);
			HttpURLConnection conn=(HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			int resCode=conn.getResponseCode();
			if(resCode==200) {
				InputStream input = conn.getInputStream();
				InputStreamReader inputReader = new InputStreamReader(input,"utf-8");
				BufferedReader br = new BufferedReader(inputReader);
				String line="";
				String result="";
				while((line=br.readLine())!=null) {
					result+=line;
				}
				//System.out.println(result);
				JSONObject jObject = JSONObject.fromObject(result);
				Iterator<?> iterator = jObject.keys();
				while(iterator.hasNext()) {
					String key=iterator.next().toString();
					String value=jObject.getString(key);
					resultMap.put(key, value);
				}
				input.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
