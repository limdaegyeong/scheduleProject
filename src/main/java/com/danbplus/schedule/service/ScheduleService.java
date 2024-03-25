package com.danbplus.schedule.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.danbplus.schedule.domain.SCB_INFO;
import com.danbplus.schedule.repository.ScheduleRepository;

import jakarta.transaction.Transactional;

@Service
public class ScheduleService {
	
	private final ScheduleRepository scheduleRepository;
	
	public ScheduleService(ScheduleRepository scheduleRepository) {
		this.scheduleRepository = scheduleRepository;
	}

	//전체 게시글 조회
	public List<SCB_INFO> findScbInfoList(){
		return scheduleRepository.findScbAll();
	}
	
	//게시글 상세 조회
	public List<SCB_INFO> findScbInfo(int num){
		return scheduleRepository.findScbDetail(num);
	}
	
	//게시글 등록
	@Transactional
	public int scheduleBoardSave(SCB_INFO scb_info) {
		scheduleRepository.scheduleBoardSave(scb_info); // 스케쥴 정보 등록
		return scb_info.getNum();
	}
	
	//게시글 수정
	public int scheduleBoardUpdate(SCB_INFO scbInfo) {
		scheduleRepository.scbInfoUpdate(scbInfo);
		return scbInfo.getNum();
	}
	
	//게시글 삭제
	public int scheduleBoardDelete(SCB_INFO scbInfo) {
		scheduleRepository.scbInfoDelete(scbInfo);
		return scbInfo.getNum();
	}

}
