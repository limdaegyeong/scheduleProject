package com.danbplus.schedule.service;

import org.springframework.stereotype.Service;

import com.danbplus.schedule.domain.ScheduleBoard;
import com.danbplus.schedule.repository.ScheduleRepository;

import jakarta.transaction.Transactional;

@Service
public class ScheduleService {
	
	private final ScheduleRepository scheduleRepository;
	
	public ScheduleService(ScheduleRepository scheduleRepository) {
		this.scheduleRepository = scheduleRepository;
	}
	
	@Transactional
	public int scheduleBoardSave(ScheduleBoard scheduleBoard) {
		scheduleRepository.scheduleBoardSave(scheduleBoard); // 스케쥴 정보 등록
		return scheduleBoard.getNum();
	}

}
