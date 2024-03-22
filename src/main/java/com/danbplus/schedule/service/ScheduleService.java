package com.danbplus.schedule.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.danbplus.schedule.domain.SCB_INFO;
import com.danbplus.schedule.repository.ScheduleRepository;

import jakarta.transaction.Transactional;

@Service
public class ScheduleService {
	
	private final ScheduleRepository scheduleRepository;
	
	public ScheduleService(ScheduleRepository scheduleRepository) {
		this.scheduleRepository = scheduleRepository;
	}

	public List<SCB_INFO> findScbInfoList(){
		return scheduleRepository.findScbAll();
	}
	
	@Transactional
	public int scheduleBoardSave(SCB_INFO scb_info) {
		scheduleRepository.scheduleBoardSave(scb_info); // 스케쥴 정보 등록
		return scb_info.getNum();
	}

}
