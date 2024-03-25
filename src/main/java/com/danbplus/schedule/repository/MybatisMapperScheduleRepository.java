package com.danbplus.schedule.repository;

import java.util.HashMap;
import java.util.List;

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
	 * 게시글 전체 조회
	 */
	@Override
	public List<SCB_INFO> findScbAll(){
		List<SCB_INFO> list = scheduleMapper.findScbAll();
		return list;		
	}
	
	/**
	 * 게시글 상세 조회
	 */
	@Override
	public List<SCB_INFO> findScbDetail(int num){
		List<SCB_INFO> list = scheduleMapper.findScbDetail(num);
		return list;		
	}
	
	/**
	 * 스케쥴 정보 저장
	 */
	@Override
	public SCB_INFO scheduleBoardSave(SCB_INFO scb_info) {
		scheduleMapper.scheduleBoardSave(scb_info);
		return scb_info;
	}
	
	/**
	 * 스케쥴 정보 수정
	 */
	@Override
	public SCB_INFO scbInfoUpdate(SCB_INFO scb_info) {
		scheduleMapper.scheduleBoardUpdate(scb_info);
		return scb_info;
	}
	
	/**
	 * 스케쥴 정보 삭제
	 */
	@Override
	public SCB_INFO scbInfoDelete(SCB_INFO scb_info) {
		scheduleMapper.scheduleBoardDelete(scb_info);
		return scb_info;
	}
	
}
