package com.danbplus.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danbplus.schedule.domain.SCB_INFO;
import com.danbplus.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class ScheduleController {

	private final ScheduleService scheduleService;
	
	@Autowired
	public ScheduleController(ScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}
	
	
	
    @RequestMapping(value="/")
    public ModelAndView userScheduleForm() {
        ModelAndView modelAndView = new ModelAndView("schedule/scheduleForm");
        List<SCB_INFO> scb_infoList = scheduleService.findScbInfoList(); // 게시글 전체 조회
        modelAndView.addObject("scb_infoList", scb_infoList); // 모델에 조회된 값을 추가
        return modelAndView;
    }
	
    @GetMapping("/schedule/scheduleAddForm")
    public String showScheduleAddForm() {
        return "schedule/scheduleAddForm"; // 스케줄 등록 폼을 표시하는 뷰의 이름을 반환합니다.
    }	
	
    //스케쥴 저장
	@ResponseBody
	@RequestMapping("/schedule/scheduleSave.act")
	public String scheduleSave(SCB_INFO scb_info, Model model) {
		String result = "스케쥴이 등록되었습니다."; 

		try {
			scheduleService.scheduleBoardSave(scb_info); // 스케쥴 저장
		}catch(Exception e){
			e.printStackTrace();
		}

		
		return result; 
	}	
    
	//스케쥴 상세 정보
    @GetMapping("/scheduleDetailForm")
    public ModelAndView showScheduleDetailForm(@RequestParam("num") String num) {
        // scheduleDetailForm.jsp와 같은 뷰 템플릿의 이름을 반환합니다.
    	ModelAndView modelAndView = new ModelAndView("schedule/scheduleDetailForm");
    	
    	log.info("num : "+num);
    	int intNum = Integer.parseInt(num);
    	if (num != null && !num.isEmpty()) {
    		List<SCB_INFO> scb_infoDtl = scheduleService.findScbInfo(intNum);
    		modelAndView.addObject("scb_infoDtl", scb_infoDtl); // 모델에 조회된 값을 추가
    	} else {
    		
    	}
        return modelAndView;
    }
    
    //스케쥴 수정
    @ResponseBody
    @RequestMapping("/schedule/scheduleUpdate.act")
    public String scheduleUpdate(SCB_INFO scb_info, Model model) {
    	String result = "스케쥴이 수정되었습니다."; 
    	
    	try {
    		scheduleService.scheduleBoardUpdate(scb_info); // 스케쥴 저장
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return result; 
    }
    
    //스케쥴 삭제
    @ResponseBody
    @RequestMapping("/schedule/scheduleDelete.act")
    public String scheduleDelete(SCB_INFO scb_info, Model model) {
    	String result = "스케쥴이 삭제되었습니다."; 
    	
    	try {
    		scheduleService.scheduleBoardDelete(scb_info); // 스케쥴 저장
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return result; 
    }
    
    
}
