package com.danbplus.schedule.repository.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.danbplus.schedule.domain.ScheduleBoard;

@Mapper
public interface ScheduleMapper {
	
	void scheduleBoardSave(ScheduleBoard scheduleBoard); // 스케쥴 정보 등록

}
