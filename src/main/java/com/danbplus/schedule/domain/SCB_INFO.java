package com.danbplus.schedule.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Entity
@Table(name="SCB_INFO")
@Alias("SCB_INFO")
public class SCB_INFO {
	
	@Id
	private String 	title;		// 제목
	private String 	content;	// 내용
	private Date 	startDt;	// 스케쥴 시작일
	private Date 	endDt;		// 스케쥴 종료일
	private String 	registDt;	// 스케쥴 등록일
	private int 	num;		// 스케쥴 번호
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
	public Date getStartDt() {
		return startDt;
	}
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}
	public String getRegistDt() {
		return registDt;
	}
	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "SCB_INFO [title=" + title + ", content=" + content + ", startDt=" + startDt + ", endDt=" + endDt
				+ ", registDt=" + registDt + ", num=" + num + "]";
	}
	

	

	
	
	
}
