package com.java.nhr1225.bean;

import java.util.HashMap;
import java.util.List;

public class makeformBean {
	private String id;
	private String title;
	private int titleNO;
	private String subtitle;
	private int subtitleNO;
	private String option;
	
	@Override
	public String toString() {
		return "makeformBean [id=" + id + ", title=" + title + ", subtitle=" + subtitle + ", option=" + option + "]";
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

	public int getTitleNO() {
		return titleNO;
	}

	public void setTitleNO(int titleNO) {
		this.titleNO = titleNO;
	}
	
	public int getSubtitleNO() {
		return subtitleNO;
	}

	public void setSubtitleNO(int subtitleNO) {
		this.subtitleNO = subtitleNO;
	}
	
	public makeformBean(String id, String title, String subtitle, String option) {
		this.id = id;
		this.title = title;
		this.subtitle = subtitle;
		this.option = option;
	}
	
	public makeformBean(String id, String title) {
		this.id = id;
		this.title = title;
	}
	public void makeformBean_sub(int titleNO, String subtitle) {
		this.titleNO = titleNO;
		this.subtitle = subtitle;
	}
	public void makeformBean_option(String option, int subtitleNO) {
		this.option = option;
		this.subtitleNO = subtitleNO;
	}
	
}
