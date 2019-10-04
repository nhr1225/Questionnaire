package com.java.nhr1225.bean;

public class makeformBean {
	private String id;
	private String title;
	private String subtitle;
	private String option;
	
	public makeformBean(String id, String title, String subtitle, String option) {
		this.id = id;
		this.title = title;
		this.subtitle = subtitle;
		this.option = option;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
}
