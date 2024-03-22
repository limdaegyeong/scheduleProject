package com.danbplus.schedule.repository;

import org.springframework.stereotype.Repository;

import com.danbplus.schedule.domain.SCB_INFO;
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
	public SCB_INFO scheduleBoardSave(SCB_INFO scb_info) {
		scheduleMapper.scheduleBoardSave(scb_info);
		return scb_info;
	}
	
}
