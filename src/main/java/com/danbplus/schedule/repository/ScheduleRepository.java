package com.danbplus.schedule.repository;

import com.danbplus.schedule.domain.SCB_INFO;

public interface ScheduleRepository {

	SCB_INFO scheduleBoardSave(SCB_INFO scb_info); // 스케쥴 정보 등록
}
