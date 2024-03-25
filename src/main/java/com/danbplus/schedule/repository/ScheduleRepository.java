package com.danbplus.schedule.repository;

import java.util.List;

import com.danbplus.schedule.domain.SCB_INFO;

public interface ScheduleRepository {
	
	List<SCB_INFO> findScbAll();					// 게시글 전체 조회
	List<SCB_INFO> findScbDetail(int num);			// 게시글 상세 조회
	SCB_INFO scheduleBoardSave(SCB_INFO scb_info);	// 게시글 정보 등록
	SCB_INFO scbInfoUpdate(SCB_INFO scbInfo);		// 게시글 정보 수정
	SCB_INFO scbInfoDelete(SCB_INFO scbInfo);		// 게시글 정보 삭제
}
