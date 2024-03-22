package com.danbplus.schedule.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Date;

@Entity
@Table(name="SCB_INFO")
public class SCB_INFO {
	
	@Id
	private String 	title;		// 제목
	private String 	content;	// 내용
	private String 	startDt;	// 스케쥴 시작일
	private String 	endDt;		// 스케쥴 종료일
	private String 	registDt;	// 스케쥴 등록일
	private int 	num;		// 스케쥴 번호
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDt() {
		return startDt;
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public String getRegistDt() {
		return registDt;
	}
	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}
	@Override
	public String toString() {
		return "ScheduleBoard [title=" + title + ", content=" + content + ", startDt=" + startDt + ", endDt=" + endDt
				+ ", registDt=" + registDt + ", num=" + num + "]";
	}
	

	
	
	
}
