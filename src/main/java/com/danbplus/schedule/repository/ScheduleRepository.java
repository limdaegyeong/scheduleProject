package com.danbplus.schedule.repository;

import com.danbplus.schedule.domain.ScheduleBoard;

public interface ScheduleRepository {

	ScheduleBoard scheduleBoardSave(ScheduleBoard scheduleBoard); // 스케쥴 정보 등록
}
