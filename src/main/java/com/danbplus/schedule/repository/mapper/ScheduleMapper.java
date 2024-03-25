package com.danbplus.schedule.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.danbplus.schedule.domain.SCB_INFO;

@Mapper
public interface ScheduleMapper {
	
	List<SCB_INFO> findScbAll();					// 게시글 전체 조회
	List<SCB_INFO> findScbDetail(int num);			// 게시글 상세 조회
	void scheduleBoardSave(SCB_INFO scb_info);		// 게시글 정보 등록
	void scheduleBoardUpdate(SCB_INFO scb_info);	// 게시글 정보 수정
	void scheduleBoardDelete(SCB_INFO scb_info);	// 게시글 정보 삭제

}
