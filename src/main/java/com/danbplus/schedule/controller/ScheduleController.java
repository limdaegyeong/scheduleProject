package com.danbplus.schedule.controller;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danbplus.schedule.domain.SCB_INFO;
import com.danbplus.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {

	private final ScheduleService scheduleService;
	
	@Autowired
	public ScheduleController(ScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}
	
	
	
	@RequestMapping(value="/schedule/scheduleForm")
	public String userScheduleForm() {
		
		return "scheduleForm";
	}
	
	
	@ResponseBody
	@RequestMapping("/schedule/scheduleSave.act")
	public String scheduleSave(SCB_INFO scb_info, Model model) {
		String result = "스케쥴이 등록되었습니다."; 

		try {
			scheduleService.scheduleBoardSave(scb_info); // 스케쥴 저장
		}catch(Exception e){
			e.printStackTrace();
		}

		
		return result; 
	}	
	

}
