package com.danbplus.schedule.repository.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.danbplus.schedule.domain.SCB_INFO;

@Mapper
public interface ScheduleMapper {
	
	void scheduleBoardSave(SCB_INFO scb_info); // 스케쥴 정보 등록

}
