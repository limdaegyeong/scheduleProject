package com.danbplus.schedule.repository;

import org.springframework.stereotype.Repository;

import com.danbplus.schedule.domain.ScheduleBoard;
import com.danbplus.schedule.repository.mapper.ScheduleMapper;

@Repository
public class MybatisMapperScheduleRepository implements ScheduleRepository{
	
	private final ScheduleMapper scheduleMapper;
	
	public MybatisMapperScheduleRepository(ScheduleMapper scheduleMapper) {
		this.scheduleMapper = scheduleMapper;
	}
	
	/**
	 * 스케쥴 정보 저장
	 */
	@Override
	public ScheduleBoard scheduleBoardSave(ScheduleBoard scheduleBoard) {
		scheduleMapper.scheduleBoardSave(scheduleBoard);
		return scheduleBoard;
	}
	
}
